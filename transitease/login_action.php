<?php
require 'db_connect.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if the user exists in the database
    $sql = "SELECT * FROM users WHERE name = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Set session variables
            $_SESSION['username'] = $username;
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['user_name'] = $user['name'];

            // Redirect to index.html
            echo "
            <script>
                sessionStorage.setItem('user_id', '{$user['user_id']}');
                sessionStorage.setItem('user_name', '{$user['name']}');
                window.location.href = 'index.html';
            </script>";
            exit;
        } else {
            // Incorrect password
            echo "<script>alert('Incorrect password.'); window.history.back();</script>";
        }
    } else {
        // User not found
        echo "<script>alert('User not found.'); window.history.back();</script>";
    }

    $stmt->close();
    $conn->close();
}
?>
