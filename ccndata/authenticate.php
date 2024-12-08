<?php
session_start();

include 'db_connection.php';
$username = $_POST['username'];
$password = md5($_POST['password']); // MD5 hashing (for simplicity, use bcrypt in production)

// Query to verify user credentials
$sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
$result = $conn->query($sql);

if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    $_SESSION['username'] = $username;
    $_SESSION['role'] = $row['role'];
    header("Location: roles.php"); // Redirect to role-based page
} else {
    echo "Invalid username or password!";
}
$conn->close();
?>
