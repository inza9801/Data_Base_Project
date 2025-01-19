<?php
include 'db_connect.php';

$name = $_GET['name'];
$transit_type = $_GET['transit_type'];

// Determine the company table to query based on transit type
$company_table = ($transit_type === 'Bus') ? 'bus_companies' : 'metro_companies';

// Fetch company name and ID for the manager
$sql = "SELECT c.name AS company_name, e.company_id 
        FROM employees e
        JOIN $company_table c ON e.company_id = c.company_id
        WHERE e.name = ? AND e.position = 'Manager' AND e.transit_type = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $name, $transit_type);
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_assoc();

// If no valid data is found, block access
if (!$data) {
    echo "<script>alert('Invalid manager or transit type. Access denied.'); window.location.href='manager_login.php';</script>";
    exit;
}

$company_name = $data['company_name'];
$company_id = $data['company_id'];
$stmt->close();

// Handle form submission for attendance recording
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $attendance_date = $_POST['attendance_date'];

    foreach ($_POST['attendance'] as $emp_id => $status) {
        $sql = "INSERT INTO emp_attendance (emp_id, attendance_date, status) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("iss", $emp_id, $attendance_date, $status);
        $stmt->execute();
    }

    echo "<script>alert('Attendance recorded successfully!');</script>";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        function showAttendanceTable() {
            const tableDiv = document.getElementById('attendance-table');
            tableDiv.style.display = 'block';
        }

        function hideAttendanceTable() {
            const tableDiv = document.getElementById('attendance-table');
            tableDiv.style.display = 'none';
        }
    </script>
</head>
<body>
    <h1>Welcome, <?php echo htmlspecialchars($transit_type); ?> Manager <?php echo htmlspecialchars($name); ?></h1>
    <h2>Company: <?php echo htmlspecialchars($company_name); ?></h2>
    <p>Here you can manage all employees in your company.</p>
    <button onclick="showAttendanceTable()">Take Attendance</button>
    <button onclick="window.location.href='manage_employees.php?company_id=<?php echo $company_id; ?>&transit_type=<?php echo $transit_type; ?>'">Manage Employees</button>

    <!-- Attendance Table -->
    <div id="attendance-table" style="display: none; margin-top: 20px;">
        <form method="POST" action="">
            <label for="attendance_date">Date:</label>
            <input type="date" id="attendance_date" name="attendance_date" required>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>Employee Name</th>
                    <th>Attendance</th>
                </tr>
                <?php
                // Fetch employees only for the manager's company and transit type
                $sql = "SELECT emp_id, name FROM employees WHERE company_id = ? AND transit_type = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("is", $company_id, $transit_type);
                $stmt->execute();
                $result = $stmt->get_result();
                while ($employee = $result->fetch_assoc()) {
                    echo "<tr>
                            <td>" . htmlspecialchars($employee['name']) . "</td>
                            <td>
                                <label>
                                    <input type='radio' name='attendance[" . $employee['emp_id'] . "]' value='Present' checked> Present
                                </label>
                                <label>
                                    <input type='radio' name='attendance[" . $employee['emp_id'] . "]' value='Absent'> Absent
                                </label>
                                <label>
                                    <input type='radio' name='attendance[" . $employee['emp_id'] . "]' value='Leave'> Leave
                                </label>
                            </td>
                          </tr>";
                }
                $stmt->close();
                ?>
            </table>
            <button type="submit" onclick="hideAttendanceTable()">Record</button>
        </form>
    </div>
</body>
</html>
