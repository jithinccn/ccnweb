<!-- Example: store.php -->
<?php
session_start();
if ($_SESSION['role'] != 'store') {
    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Store Dashboard</title>
    <link rel="stylesheet" href="css/style1.css">
</head>
<body>
    <div class="container">
    
        <!-- Sidebar Menu -->
        <div class="sidebar">
            <h2>Store Menu</h2>
            <header>
                <img src="images/ccn.jpg" alt="Logo" class="logo">
            </header>
            <ul>
               
                <li><a href="#" onclick="loadPage('storehome.php')">Home</a></li>
                <li><a href="#" onclick="loadPage('addmodem.php')">Add Modem</a></li>
                <li><a href="#" onclick="loadPage('displaymodem.php')">Display Modem</a></li>
                <li><a href="#" onclick="loadPage('addcomplaint.php')">Add Complaint</a></li>
                <li><a href="#" onclick="loadPage('replacemodem.php')">Replace modem</a></li>
                <a href="logout.php" class="logout">Logout</a>

            </ul>
            
        </div>
        
        <!-- Content Area -->
        <div class="content">
            <iframe id="contentFrame" src="storehome.php"></iframe>
        </div>
    </div>

    <script>
        function loadPage(page) {
            document.getElementById('contentFrame').src = page;
        }
    </script>
</body>
</html>
