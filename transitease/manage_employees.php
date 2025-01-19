<?php
include 'db_connect.php';

$company_id = $_GET['company_id'];
$transit_type = $_GET['transit_type'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['month'])) {
    $month = $_POST['month'];
    $month_number = date('m', strtotime($month));
    $year = date('Y', strtotime($month));

    $sql = "SELECT 
                e.emp_id,
                e.name,
                e.contact_info,
                e.position,
                s.salary_amount,
                COUNT(CASE WHEN a.status = 'Present' THEN 1 ELSE NULL END) AS present_days,
                p.bonus,
                p.payment_date
            FROM employees e
            LEFT JOIN emp_salary s ON e.emp_id = s.emp_id
            LEFT JOIN emp_attendance a ON e.emp_id = a.emp_id 
                AND MONTH(a.attendance_date) = ? AND YEAR(a.attendance_date) = ?
            LEFT JOIN payment p ON e.emp_id = p.emp_id 
                AND MONTH(p.bonus_added_date) = ? AND YEAR(p.bonus_added_date) = ?
            WHERE e.company_id = ? AND e.transit_type = ?
            GROUP BY e.emp_id
            ORDER BY e.position ASC, present_days DESC, e.emp_id ASC";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iiiiis", $month_number, $year, $month_number, $year, $company_id, $transit_type);
    $stmt->execute();
    $result = $stmt->get_result();
} else {
    $result = null;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_bonus'])) {
    $month = $_POST['month'];
    $month_number = date('m', strtotime($month));
    $year = date('Y', strtotime($month));

    $rankedEmployeesSql = "WITH RankedEmployees AS (
        SELECT 
            e.position,
            e.emp_id,
            e.name,
            COUNT(CASE WHEN a.status = 'Present' THEN 1 ELSE NULL END) AS present_days,
            ROW_NUMBER() OVER (
                PARTITION BY e.position 
                ORDER BY COUNT(CASE WHEN a.status = 'Present' THEN 1 ELSE NULL END) DESC, e.emp_id ASC
            ) AS rank
        FROM employees e
        LEFT JOIN emp_attendance a ON e.emp_id = a.emp_id
        WHERE e.position != 'Manager' 
          AND e.company_id = ?
          AND e.transit_type = ?
          AND MONTH(a.attendance_date) = ?
          AND YEAR(a.attendance_date) = ?
        GROUP BY e.position, e.emp_id, e.name
    )
    SELECT r.emp_id, r.position, r.name, ROUND(s.salary_amount * 0.10, 2) AS bonus
    FROM RankedEmployees r
    JOIN emp_salary s ON r.emp_id = s.emp_id
    WHERE r.rank <= 3
    ORDER BY r.position ASC, r.present_days DESC, r.emp_id ASC;";

    $stmt = $conn->prepare($rankedEmployeesSql);
    $stmt->bind_param("isis", $company_id, $transit_type, $month_number, $year);
    $stmt->execute();
    $rankedResult = $stmt->get_result();

    if ($rankedResult->num_rows > 0) {
        $insertBonusSql = "INSERT INTO payment (emp_id, bonus, bonus_added_date) VALUES (?, ?, ?)";
        $insertStmt = $conn->prepare($insertBonusSql);

        while ($row = $rankedResult->fetch_assoc()) {
            $emp_id = $row['emp_id'];
            $bonus = $row['bonus'];
            $bonus_added_date = date('Y-m-d');

            $insertStmt->bind_param("ids", $emp_id, $bonus, $bonus_added_date);
            $insertStmt->execute();
        }
        echo "<p>Bonuses successfully added for top employees.</p>";
    } else {
        echo "<p>No eligible employees found for bonus.</p>";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['pay_employee'])) {
    $emp_id = $_POST['emp_id'];
    $payment_date = date('Y-m-d');

    $updatePaymentSql = "UPDATE payment SET payment_date = ? WHERE emp_id = ? AND DATE(bonus_added_date) = ?";
    $updateStmt = $conn->prepare($updatePaymentSql);
    $updateStmt->bind_param("sis", $payment_date, $emp_id, $payment_date);
    $updateStmt->execute();

    if ($updateStmt->affected_rows > 0) {
        echo "<p>Payment date updated for Employee ID: $emp_id.</p>";
    } else {
        echo "<p>No matching bonus found for Employee ID: $emp_id on today's date.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Manage Employees</h1>
    <form method="POST" action="">
        <label for="month">Select Month:</label>
        <input type="month" id="month" name="month" required>
        <button type="submit" name="view">View</button>
        <button type="submit" name="add_bonus">Add Bonus</button>
    </form>

    <?php if ($result && $result->num_rows > 0): ?>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Contact Info</th>
                <th>Position</th>
                <th>Salary</th>
                <th>Present Days</th>
                <th>Bonus</th>
                <th>Payment Date</th>
                <th>Action</th>
            </tr>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['emp_id']); ?></td>
                    <td><?php echo htmlspecialchars($row['name']); ?></td>
                    <td><?php echo htmlspecialchars($row['contact_info']); ?></td>
                    <td><?php echo htmlspecialchars($row['position']); ?></td>
                    <td><?php echo htmlspecialchars($row['salary_amount']); ?></td>
                    <td><?php echo htmlspecialchars($row['present_days']); ?></td>
                    <td><?php echo htmlspecialchars($row['bonus']); ?></td>
                    <td><?php echo htmlspecialchars($row['payment_date'] ?? 'Not Set'); ?></td>
                    <td>
                        <form method="POST" action="">
                            <input type="hidden" name="emp_id" value="<?php echo $row['emp_id']; ?>">
                            <button type="submit" name="pay_employee">Pay</button>
                        </form>
                    </td>
                </tr>
            <?php endwhile; ?>
        </table>
    <?php elseif ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['view'])): ?>
        <p>No records found for the selected month.</p>
    <?php endif; ?>
</body>
</html>
