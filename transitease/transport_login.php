<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $transport_id = $_POST['transport_id'];
    $password = $_POST['password'];
    $transit_type = $_POST['transit_type'];

    // Determine the table and fields based on transit type
    $vehicle_table = ($transit_type === 'Bus') ? 'buses' : 'trains';
    $company_table = ($transit_type === 'Bus') ? 'bus_companies' : 'metro_companies';
    $id_field = ($transit_type === 'Bus') ? 'bus_id' : 'train_id';

    // Prepare the query to check credentials
    $sql = "SELECT v.$id_field AS transport_id, c.name AS company_name 
            FROM $vehicle_table v
            JOIN $company_table c ON v.company_id = c.company_id
            WHERE v.$id_field = ? AND c.password = ?";

    $stmt = $conn->prepare($sql);

    // Check if the statement was prepared successfully
    if (!$stmt) {
        die("Query preparation failed: " . $conn->error);
    }

    $stmt->bind_param("is", $transport_id, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if a match is found
    if ($result->num_rows > 0) {
        $transport = $result->fetch_assoc();
        header('Location: transport_dashboard.php?transport_id=' . urlencode($transport['transport_id']) . '&company_name=' . urlencode($transport['company_name']) . '&transit_type=' . urlencode($transit_type));
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
    <title>Transport Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Transport Login</h1>
    </header>
    <main>
        <form method="POST" action="">
            <label for="transport_id">Transport ID:</label>
            <input type="number" id="transport_id" name="transport_id" required>
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
