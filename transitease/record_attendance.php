<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $attendance_date = $_POST['attendance_date'];

    foreach ($_POST['attendance'] as $emp_id => $status) {
        $sql = "INSERT INTO emp_attendance (emp_id, attendance_date, status) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("iss", $emp_id, $attendance_date, $status);
        $stmt->execute();
    }

    echo "<script>alert('Attendance recorded successfully!'); window.location.href='manager_dashboard_bus.php?name=$name';</script>";
}
?>
