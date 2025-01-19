<?php
include 'db_connect.php';

$company_name = $_GET['company_name'];
$company_id = $_GET['company_id'];
$transit_type = $_GET['transit_type'];

// Determine the income table based on transit type
$income_table = ($transit_type === 'Bus') ? 'bus_income' : 'metro_income';

// Get the current date
$current_date = date('Y-m-d');
$current_month = date('Y-m');

// Fetch income for the current date
$date = isset($_POST['date']) ? $_POST['date'] : $current_date;
$sql = "SELECT date, income_amount FROM $income_table WHERE company_id = ? AND date = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Query preparation failed: " . $conn->error);
}

$stmt->bind_param("is", $company_id, $date);
$stmt->execute();
$result = $stmt->get_result();

// Calculate total income for the selected date
$total_income = 0;
$income_data = [];
while ($row = $result->fetch_assoc()) {
    $income_data[] = $row;
    $total_income += $row['income_amount'];
}
$stmt->close();

// Fetch monthly income
$month = isset($_POST['month']) ? $_POST['month'] : $current_month;
$sql_monthly = "SELECT DATE_FORMAT(date, '%Y-%m-%d') as day, SUM(income_amount) as daily_total 
               FROM $income_table 
               WHERE company_id = ? AND DATE_FORMAT(date, '%Y-%m') = ? 
               GROUP BY day 
               ORDER BY day ASC";
$stmt_monthly = $conn->prepare($sql_monthly);

if (!$stmt_monthly) {
    die("Query preparation failed: " . $conn->error);
}

$stmt_monthly->bind_param("is", $company_id, $month);
$stmt_monthly->execute();
$result_monthly = $stmt_monthly->get_result();

$monthly_income_data = [];
$total_monthly_income = 0;
while ($row = $result_monthly->fetch_assoc()) {
    $monthly_income_data[] = $row;
    $total_monthly_income += $row['daily_total'];
}
$stmt_monthly->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Welcome, <?php echo htmlspecialchars($company_name); ?></h1>
    </header>
    <main>
        <h2>Transit Type: <?php echo htmlspecialchars($transit_type); ?></h2>
        <p>Manage your company's operations and view statistics.</p>

        <section>
            <h3>Income Details</h3>

            <!-- Form to select a date -->
            <form method="POST" action="">
                <label for="date">Select Date:</label>
                <input type="date" id="date" name="date" value="<?php echo htmlspecialchars($date); ?>" required>
                <button type="submit">Show Income</button>
            </form>

            <!-- Income Table -->
            <h4>Income for <?php echo htmlspecialchars($date); ?></h4>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>Date</th>
                    <th>Income Amount</th>
                </tr>
                <?php if (!empty($income_data)) { ?>
                    <?php foreach ($income_data as $income) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($income['date']); ?></td>
                            <td><?php echo htmlspecialchars($income['income_amount']); ?></td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="2">No income data available for this date.</td>
                    </tr>
                <?php } ?>
            </table>

            <!-- Total Income -->
            <h4>Total Income: <?php echo htmlspecialchars(number_format($total_income, 2)); ?></h4>
        </section>

        <section>
            <h3>Monthly Income Details</h3>

            <!-- Form to select a month -->
            <form method="POST" action="">
                <label for="month">Select Month:</label>
                <input type="month" id="month" name="month" value="<?php echo htmlspecialchars($month); ?>" required>
                <button type="submit">Show Monthly Income</button>
            </form>

            <!-- Monthly Income Table -->
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

            <!-- Total Monthly Income -->
            <h4>Total Monthly Income: <?php echo htmlspecialchars(number_format($total_monthly_income, 2)); ?></h4>
        </section>

        <section>
            <h3>Actions</h3>
            <button onclick="window.location.href='view_routes.php?company_id=<?php echo $company_id; ?>&transit_type=<?php echo $transit_type; ?>'">View Routes</button>
            <button onclick="window.location.href='view_employees.php?company_id=<?php echo $company_id; ?>&transit_type=<?php echo $transit_type; ?>'">View Employee Info</button>
        </section>
    </main>
    <footer>
        <p>&copy; 2025 TransitEase</p>
    </footer>
</body>
</html>
