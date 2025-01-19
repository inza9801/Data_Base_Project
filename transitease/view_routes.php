<?php
include 'db_connect.php';

$company_id = $_GET['company_id'];
$transit_type = $_GET['transit_type'];

// Determine the appropriate table names
$route_table = ($transit_type === 'Bus') ? 'routes' : 'metro_routes';
$stops_table = ($transit_type === 'Bus') ? 'stops' : 'metro_stops';
$vehicle_table = ($transit_type === 'Bus') ? 'buses' : 'trains';

// Fetch routes and stops
$sql = "SELECT r.route_id, r.name AS route_name, GROUP_CONCAT(s.name ORDER BY s.stop_number SEPARATOR ', ') AS stops 
        FROM $route_table r 
        LEFT JOIN $stops_table s ON r.route_id = s.route_id 
        WHERE r.company_id = ? 
        GROUP BY r.route_id";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $company_id);
$stmt->execute();
$routes = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
$stmt->close();

// Count vehicles
$sql_vehicle_count = "SELECT COUNT(*) AS vehicle_count FROM $vehicle_table WHERE company_id = ?";
$stmt_vehicle = $conn->prepare($sql_vehicle_count);
$stmt_vehicle->bind_param("i", $company_id);
$stmt_vehicle->execute();
$vehicle_count = $stmt_vehicle->get_result()->fetch_assoc()['vehicle_count'];
$stmt_vehicle->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Routes</title>
</head>
<body>
    <h1>Routes for <?php echo htmlspecialchars($transit_type); ?> Company</h1>
    <table border="1">
        <tr>
            <th>Route ID</th>
            <th>Route Name</th>
            <th>Stops</th>
        </tr>
        <?php foreach ($routes as $route) { ?>
            <tr>
                <td><?php echo htmlspecialchars($route['route_id']); ?></td>
                <td><?php echo htmlspecialchars($route['route_name']); ?></td>
                <td><?php echo htmlspecialchars($route['stops']); ?></td>
            </tr>
        <?php } ?>
    </table>
    <p>Total Number of Vehicles: <?php echo htmlspecialchars($vehicle_count); ?></p>
</body>
</html>
