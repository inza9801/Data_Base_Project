<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $password = $_POST['password'];
    $transit_type = $_POST['transit_type'];

    if ($password === 'Manager') {
        // Validate the manager's transit type
        $sql = "SELECT e.name, e.transit_type 
                FROM employees e
                WHERE e.name = ? AND e.position = 'Manager' AND e.transit_type = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $name, $transit_type);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            // Manager exists and matches the selected transit type
            header('Location: manager_dashboard.php?name=' . urlencode($name) . '&transit_type=' . urlencode($transit_type));
            exit;
        } else {
            // Handle transit type mismatch or invalid manager name
            echo "<script>alert('Invalid manager name or transit type mismatch. Please try again.');</script>";
        }
        $stmt->close();
    } else {
        echo "<script>alert('Invalid password. Access denied.');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Manager Login</h1>
    </header>
    <main>
        <form method="POST" action="">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
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
