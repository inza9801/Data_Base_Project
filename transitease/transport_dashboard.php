<?php
include 'db_connect.php';

$transport_id = $_GET['transport_id'];
$transit_type = $_GET['transit_type'];

// Determine table names and field names based on transit type
$income_table = ($transit_type === 'Bus') ? 'bus_income' : 'metro_income';
$route_table = ($transit_type === 'Bus') ? 'routes' : 'metro_routes';
$stops_table = ($transit_type === 'Bus') ? 'stops' : 'metro_stops';
$vehicle_id_field = ($transit_type === 'Bus') ? 'bus_id' : 'train_id';
$company_table = ($transit_type === 'Bus') ? 'bus_companies' : 'metro_companies';

// Fetch income for the selected date (default to current date)
$current_date = date('Y-m-d');
$date = isset($_POST['date']) ? $_POST['date'] : $current_date;
$sql_date_income = "SELECT date, income_amount FROM $income_table WHERE $vehicle_id_field = ? AND date = ?";
$stmt_date = $conn->prepare($sql_date_income);
$stmt_date->bind_param("is", $transport_id, $date);
$stmt_date->execute();
$result_date = $stmt_date->get_result();

$total_daily_income = 0;
$daily_income_data = [];
while ($row = $result_date->fetch_assoc()) {
    $daily_income_data[] = $row;
    $total_daily_income += $row['income_amount'];
}
$stmt_date->close();

// Fetch income for the selected month (default to current month)
$current_month = date('Y-m');
$month = isset($_POST['month']) ? $_POST['month'] : $current_month;
$sql_monthly_income = "SELECT DATE_FORMAT(date, '%Y-%m-%d') AS day, SUM(income_amount) AS daily_total 
                       FROM $income_table 
                       WHERE $vehicle_id_field = ? AND DATE_FORMAT(date, '%Y-%m') = ?
                       GROUP BY day 
                       ORDER BY day ASC";
$stmt_monthly = $conn->prepare($sql_monthly_income);
$stmt_monthly->bind_param("is", $transport_id, $month);
$stmt_monthly->execute();
$result_monthly = $stmt_monthly->get_result();

$total_monthly_income = 0;
$monthly_income_data = [];
while ($row = $result_monthly->fetch_assoc()) {
    $monthly_income_data[] = $row;
    $total_monthly_income += $row['daily_total'];
}
$stmt_monthly->close();

// Fetch company name and routes with stops using subqueries
$sql_details = "
    SELECT 
        (SELECT c.name 
         FROM $company_table c 
         WHERE c.company_id = (
             SELECT i.company_id 
             FROM $income_table i 
             WHERE i.$vehicle_id_field = ?
             LIMIT 1
         )
        ) AS company_name,
        (SELECT GROUP_CONCAT(r.route_id, ':', r.name, '|', 
                (SELECT GROUP_CONCAT(s.name ORDER BY s.stop_number SEPARATOR ', ') 
                 FROM $stops_table s 
                 WHERE s.route_id = r.route_id
                )
               ORDER BY r.route_id SEPARATOR '; ')
         FROM $route_table r 
         WHERE r.company_id = (
             SELECT i.company_id 
             FROM $income_table i 
             WHERE i.$vehicle_id_field = ?
             LIMIT 1
         )
        ) AS routes_and_stops
";
$stmt_details = $conn->prepare($sql_details);
$stmt_details->bind_param("ii", $transport_id, $transport_id);
$stmt_details->execute();
$result_details = $stmt_details->get_result();
$details = $result_details->fetch_assoc();
$stmt_details->close();

// Parse routes and stops
$routes_and_stops = explode('; ', $details['routes_and_stops'] ?? '');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Dashboard</title>
</head>
<body>
    <header>
        <h1>Transport Dashboard</h1>
        <h2>Transport Type: <?php echo htmlspecialchars($transit_type); ?></h2>
        <h2>Transport ID: <?php echo htmlspecialchars($transport_id); ?></h2>
        <h2>Company: <?php echo htmlspecialchars($details['company_name'] ?? 'N/A'); ?></h2>
    </header>
    <main>
        <!-- Daily Income Section -->
        <section>
            <h3>Daily Income</h3>
            <form method="POST" action="">
                <label for="date">Select Date:</label>
                <input type="date" id="date" name="date" value="<?php echo htmlspecialchars($date); ?>" required>
                <button type="submit">Show Daily Income</button>
            </form>
            <h4>Income for <?php echo htmlspecialchars($date); ?></h4>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>Date</th>
                    <th>Income Amount</th>
                </tr>
                <?php if (!empty($daily_income_data)) { ?>
                    <?php foreach ($daily_income_data as $income) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($income['date']); ?></td>
                            <td><?php echo htmlspecialchars(number_format($income['income_amount'], 2)); ?></td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="2">No income data available for this date.</td>
                    </tr>
                <?php } ?>
            </table>
            <h4>Total Daily Income: <?php echo htmlspecialchars(number_format($total_daily_income, 2)); ?></h4>
        </section>

        <!-- Monthly Income Section -->
        <section>
            <h3>Monthly Income</h3>
            <form method="POST" action="">
                <label for="month">Select Month:</label>
                <input type="month" id="month" name="month" value="<?php echo htmlspecialchars($month); ?>" required>
                <button type="submit">Show Monthly Income</button>
            </form>
            <h4>Income for <?php echo htmlspecialchars($month); ?></h4>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>Date</th>
                    <th>Daily Total Income</th>
                </tr>
                <?php if (!empty($monthly_income_data)) { ?>
                    <?php foreach ($monthly_income_data as $daily_income) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($daily_income['day']); ?></td>
                            <td><?php echo htmlspecialchars(number_format($daily_income['daily_total'], 2)); ?></td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="2">No income data available for this month.</td>
                    </tr>
                <?php } ?>
            </table>
            <h4>Total Monthly Income: <?php echo htmlspecialchars(number_format($total_monthly_income, 2)); ?></h4>
        </section>

        <!-- Routes and Stops Section -->
        <section>
            <h3>Routes and Stops</h3>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>Route ID</th>
                    <th>Route Name</th>
                    <th>Stops</th>
                </tr>
                <?php if (!empty($routes_and_stops)) { ?>
                    <?php foreach ($routes_and_stops as $route_data) { 
                        list($route_id, $details) = explode(':', $route_data);
                        list($route_name, $stops) = explode('|', $details);
                    ?>
                        <tr>
                            <td><?php echo htmlspecialchars($route_id); ?></td>
                            <td><?php echo htmlspecialchars($route_name); ?></td>
                            <td><?php echo htmlspecialchars($stops); ?></td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="3">No routes data available for this transport.</td>
                    </tr>
                <?php } ?>
            </table>
        </section>
    </main>
</body>
</html>
