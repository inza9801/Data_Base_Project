<?php
include 'db_connect.php';

echo "<h1>All Bus Routes</h1>";

$query = "SELECT r.route_id, r.name AS route_name, s.name AS stop_name, s.stop_number
          FROM routes r
          JOIN stops s ON r.route_id = s.route_id
          JOIN bus_companies bc ON r.company_id = bc.company_id
          ORDER BY r.route_id, s.stop_number";

$result = $conn->query($query);

if (!$result) {
    die("Query failed: " . $conn->error);
}

if ($result->num_rows > 0) {
    $currentRoute = null;
    while ($row = $result->fetch_assoc()) {
        if ($row['route_id'] !== $currentRoute) {
            if ($currentRoute !== null) echo "</ul>";
            $currentRoute = $row['route_id'];
            echo "<h2>Route " . htmlspecialchars($row['route_name']) . " (ID: " . htmlspecialchars($currentRoute) . "):</h2>";
            echo "<ul>";
        }
        echo "<li>Stop " . htmlspecialchars($row['stop_number']) . ": " . htmlspecialchars($row['stop_name']) . "</li>";
    }
    echo "</ul>";
} else {
    echo "No bus routes found.";
}

$conn->close();
?>
