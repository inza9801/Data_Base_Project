<?php
session_start();

// Check if required parameters are present
if (!isset($_GET['source']) || !isset($_GET['destination']) || !isset($_GET['transit_type'])) {
    echo "<p>Invalid trip details. Please go back and try again.</p>";
    exit();
}

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    echo "<p>You must be logged in to book a trip. Please <a href='login.php'>log in</a>.</p>";
    exit();
}

// Retrieve trip details and user ID
$source = $_GET['source'];
$destination = $_GET['destination'];
$transit_type = $_GET['transit_type'];
$user_id = $_SESSION['user_id'];

// Database connection
$conn = new mysqli("localhost", "root", "", "transit_system");
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

// Query to find the best route with minimum stops and corresponding company
$query = $transit_type === 'metro' ? "
WITH route_details AS (
    SELECT 
        r.name AS route_name,
        mc.name AS metro_company,
        ABS(ms2.stop_number - ms1.stop_number) AS stops_to_cross,
        COUNT(t.train_id) AS train_count
    FROM 
        metro_stops ms1
    JOIN 
        metro_stops ms2 ON ms1.route_id = ms2.route_id
    JOIN 
        metro_routes r ON ms1.route_id = r.route_id
    JOIN 
        metro_companies mc ON r.company_id = mc.company_id
    LEFT JOIN 
        trains t ON mc.company_id = t.company_id
    WHERE 
        ms1.name = ?
        AND ms2.name = ?
    GROUP BY 
        r.name, mc.name, stops_to_cross
)
SELECT 
    route_name, metro_company AS company_name, stops_to_cross
FROM 
    route_details
WHERE 
    stops_to_cross = (SELECT MIN(stops_to_cross) FROM route_details)
ORDER BY 
    train_count DESC, route_name ASC
LIMIT 1
" : "
WITH route_details AS (
    SELECT 
        r.name AS route_name,
        bc.name AS bus_company,
        ABS(s2.stop_number - s1.stop_number) AS stops_to_cross,
        COUNT(b.bus_id) AS bus_count
    FROM 
        stops s1
    JOIN 
        stops s2 ON s1.route_id = s2.route_id
    JOIN 
        routes r ON s1.route_id = r.route_id
    JOIN 
        bus_companies bc ON r.company_id = bc.company_id
    LEFT JOIN 
        buses b ON bc.company_id = b.company_id
    WHERE 
        s1.name = ?
        AND s2.name = ?
    GROUP BY 
        r.name, bc.name, stops_to_cross
)
SELECT 
    route_name, bus_company AS company_name, stops_to_cross
FROM 
    route_details
WHERE 
    stops_to_cross = (SELECT MIN(stops_to_cross) FROM route_details)
ORDER BY 
    bus_count DESC, route_name ASC
LIMIT 1
";

$stmt = $conn->prepare($query);
$stmt->bind_param("ss", $source, $destination);
$stmt->execute();
$result = $stmt->get_result();
$routeData = $result->fetch_assoc();

if (!$routeData) {
    echo "<p>No valid route found for the given source and destination. Please try again.</p>";
    exit();
}

$stop_count = $routeData['stops_to_cross'];
$fare = $stop_count * ($transit_type === 'metro' ? 20 : 10);
$company_name = $routeData['company_name'];

// Select a random bus_id or train_id for the selected company
if ($transit_type === 'metro') {
    $queryTrain = "SELECT train_id FROM trains WHERE route_id = (SELECT route_id FROM metro_routes WHERE name = ?) ORDER BY RAND() LIMIT 1";
    $stmtTrain = $conn->prepare($queryTrain);
    $stmtTrain->bind_param("s", $routeData['route_name']);
    $stmtTrain->execute();
    $trainData = $stmtTrain->get_result()->fetch_assoc();
    $transport_id = $trainData['train_id'];

    // Insert into metro_income
    $insertIncome = "INSERT INTO metro_income (train_id, company_id, date, income_amount) VALUES (?, (SELECT company_id FROM metro_companies WHERE name = ?), CURDATE(), ?)";
    $stmtIncome = $conn->prepare($insertIncome);
    $stmtIncome->bind_param("isd", $transport_id, $company_name, $fare);
    $stmtIncome->execute();
} else {
    $queryBus = "SELECT bus_id FROM buses WHERE route_id = (SELECT route_id FROM routes WHERE name = ?) ORDER BY RAND() LIMIT 1";
    $stmtBus = $conn->prepare($queryBus);
    $stmtBus->bind_param("s", $routeData['route_name']);
    $stmtBus->execute();
    $busData = $stmtBus->get_result()->fetch_assoc();
    $transport_id = $busData['bus_id'];

    // Insert into bus_income
    $insertIncome = "INSERT INTO bus_income (bus_id, company_id, date, income_amount) VALUES (?, (SELECT company_id FROM bus_companies WHERE name = ?), CURDATE(), ?)";
    $stmtIncome = $conn->prepare($insertIncome);
    $stmtIncome->bind_param("isd", $transport_id, $company_name, $fare);
    $stmtIncome->execute();
}

// Insert booking into the bookings table
$insertQuery = "INSERT INTO bookings (start_stop, end_stop, fare, transit_company, user_id, date) VALUES (?, ?, ?, ?, ?, CURDATE())";
$insertStmt = $conn->prepare($insertQuery);
$insertStmt->bind_param("ssdsi", $source, $destination, $fare, $company_name, $user_id);

if ($insertStmt->execute()) {
    $message = "Your trip has been successfully booked!";
    $date = date("Y-m-d"); // Get the current date
} else {
    $message = "Failed to book your trip. Please try again.";
    $date = null;
}

// Close connections
$stmt->close();
if (isset($stmtTrain)) $stmtTrain->close();
if (isset($stmtBus)) $stmtBus->close();
if (isset($stmtIncome)) $stmtIncome->close();
$insertStmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Info</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Trip Information</h1>
    </header>
    <main>
        <section id="trip-info">
            <h2>Your Trip Details</h2>
            <p><strong>Source:</strong> <?php echo htmlspecialchars($source); ?></p>
            <p><strong>Destination:</strong> <?php echo htmlspecialchars($destination); ?></p>
            <p><strong>Transit Type:</strong> <?php echo htmlspecialchars(ucfirst($transit_type)); ?></p>
            <p><strong>Fare:</strong> <?php echo $fare; ?> BDT</p>
            <p><strong>Company:</strong> <?php echo htmlspecialchars($company_name); ?></p>
            <p><strong>Date:</strong> <?php echo htmlspecialchars($date); ?></p>
            <p><?php echo htmlspecialchars($message); ?></p>
            <button id="endTrip">End Trip</button>
        </section>
    </main>
    <footer>
        <p>© 2025 Dhaka City Transit System</p>
    </footer>
    <script>
        document.getElementById("endTrip").addEventListener("click", () => {
            // Redirect to the 'endTrip.php' page
            window.location.href = "endTrip.php";
        });
    </script>
</body>
</html>
