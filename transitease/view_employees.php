<?php
include 'db_connect.php';

$company_id = $_GET['company_id'];
$transit_type = $_GET['transit_type'];

// Fetch employee data
$sql = "SELECT e.emp_id, e.name, e.contact_info, e.position, s.salary_amount 
        FROM employees e 
        JOIN emp_salary s ON e.emp_id = s.emp_id 
        WHERE e.company_id = ? AND e.transit_type = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("is", $company_id, $transit_type);
$stmt->execute();
$employees = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
$stmt->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Information</title>
</head>
<body>
    <h1>Employee Information for <?php echo htmlspecialchars($transit_type); ?> Company</h1>
    <table border="1">
        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Contact Info</th>
            <th>Position</th>
            <th>Salary</th>
        </tr>
        <?php foreach ($employees as $employee) { ?>
            <tr>
                <td><?php echo htmlspecialchars($employee['emp_id']); ?></td>
                <td><?php echo htmlspecialchars($employee['name']); ?></td>
                <td><?php echo htmlspecialchars($employee['contact_info']); ?></td>
                <td><?php echo htmlspecialchars($employee['position']); ?></td>
                <td><?php echo htmlspecialchars(number_format($employee['salary_amount'], 2)); ?></td>
            </tr>
        <?php } ?>
    </table>
</body>
</html>
