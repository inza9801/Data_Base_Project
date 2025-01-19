<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $company_name = $_POST['company_name'];
    $password = $_POST['password'];
    $transit_type = $_POST['transit_type'];

    // Determine the table based on transit type
    $company_table = ($transit_type === 'Bus') ? 'bus_companies' : 'metro_companies';

    // Prepare the query to check credentials
    $sql = "SELECT company_id, name 
            FROM $company_table 
            WHERE name = ? AND password = ?";
    $stmt = $conn->prepare($sql);

    // Debugging: Check if the statement was prepared successfully
    if (!$stmt) {
        die("Query preparation failed: " . $conn->error);
    }

    $stmt->bind_param("ss", $company_name, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if a match is found
    if ($result->num_rows > 0) {
        $company = $result->fetch_assoc();
        header('Location: company_dashboard.php?company_name=' . urlencode($company['name']) . '&company_id=' . $company['company_id'] . '&transit_type=' . urlencode($transit_type));
        exit;
    } else {
        echo "<script>alert('Invalid credentials. Please try again.');</script>";
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Company Login</h1>
    </header>
    <main>
        <form method="POST" action="">
            <label for="company_name">Company Name:</label>
            <input type="text" id="company_name" name="company_name" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <label for="transit_type">Transit Type:</label>
            <select id="transit_type" name="transit_type" required>
                <option value="Bus">Bus</option>
                <option value="Metro">Metro</option>
            </select>
            <br>
            <button type="submit">Login</button>
        </form>
    </main>
</body>
</html>
