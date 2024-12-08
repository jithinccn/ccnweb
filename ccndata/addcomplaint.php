<?php
session_start();
include 'db_connection.php'; // Include your database connection file

// Ensure user is logged in
if (!isset($_SESSION['username'])) {
    echo "Please log in to register a complaint.";
    exit;
}

// Fetch the modem MAC addresses from the modems table
$sql1 = "SELECT modem_mac_address FROM modems";
$result_op = $conn->query($sql1);
$data = $result_op->fetch_all(MYSQLI_ASSOC);

// Initialize variables
$username = $_SESSION['username'];
$modemMacAddress = '';
$powerStatus = 'NA';
$bootingStatus = 'NA';
$lanportStatus = 'NA';
$wlanStatus = 'NA';
$weblogin = 'NA';
$comment = 'NA';
$complaintStatus = 'New_complaint';
$replacedMac = 'NA';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get form data
    $modemMacAddress = $_POST['modem_mac_address'];
    $complaintType = $_POST['complaint_type'];

    // Check if the modem exists in the modems table and has no unresolved complaint
   
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Get form data
        $modemMacAddress = $_POST['modem_mac_address'];
    
        // SQL to check if the modem exists in the `modems` table and ensure all complaints are resolved in the `modem_complaints` table
        $sql = "
            SELECT m.modem_mac_address 
            FROM modems m 
            LEFT JOIN modem_complaints mc 
            ON m.modem_mac_address = mc.modem_mac_address
            WHERE m.modem_mac_address = ? 
            AND (mc.complaint_status IS NULL OR mc.complaint_status = 'resolved')
        ";
    
        $stmt = $conn->prepare($sql);
    
        // Check if the prepared statement was successful
        if (!$stmt) {
            die("Error preparing SQL statement: " . $conn->error);
        }
    
        $stmt->bind_param("s", $modemMacAddress);
        $stmt->execute();
        $result = $stmt->get_result();
    
        if ($result->num_rows > 0) {
            echo "Modem found and has no unresolved complaints.";
            // Proceed with further logic
        } else {
            echo "Modem not found or has unresolved complaints.";
        }
    
        
    }
    

    if ($result->num_rows > 0) {
        // Prepare the INSERT query for the complaint
        $insertSql = "INSERT INTO modem_complaints 
                        (modem_mac_address, complaint_type, complaint_register_date, complaint_register_person, power_status, booting_status, lan_port_status, wlan_status, weblogin, dcomment, complaint_status, Relaced_modem_mac) 
                      VALUES (?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Prepare the INSERT statement
        $insertStmt = $conn->prepare($insertSql);

        // Check if the INSERT statement was successfully prepared
        if (!$insertStmt) {
            die("Error preparing INSERT SQL statement: " . $conn->error);
        }

        // Bind the parameters for the INSERT query
        $insertStmt->bind_param(
            "sssssssssss", 
            $modemMacAddress, 
            $complaintType, 
            $username, // complaint_register_person is the username
            $powerStatus, 
            $bootingStatus, 
            $lanportStatus, 
            $wlanStatus, 
            $weblogin, 
            $comment, 
            $complaintStatus, 
            $replacedMac
        );

        // Execute the query
        if ($insertStmt->execute()) {
            echo "Complaint registered successfully.";
        } else {
            echo "Error executing INSERT: " . $insertStmt->error;
        }

        // Close the prepared statement
        $insertStmt->close();
    } else {
        echo "Modem already has a resolved complaint or does not exist.";
    }
    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Modem Complaint</title>
</head>
<body>
<h2>Register a Modem Complaint</h2>
<form action="addcomplaint.php" method="post">
    <label for="modem_mac_address">MAC Address:</label>
    <input list="modem_mac_addresses" name="modem_mac_address" id="modem_mac_address" required>
    <datalist id="modem_mac_addresses">
        <?php 
        foreach ($data as $id) {
            echo "<option value='".$id['modem_mac_address']."'>";
        }
        ?>
    </datalist>
    <br>

    <label for="complaint_type">Complaint Type:</label>    
     <select name="complaint_type" id="complaint_type" required>
        <option value="" disabled selected>Select a complaint type</option>
        <option value="Restarting">Restarting</option>
        <option value="Wifi-issue">Wifi issue</option>
        <option value="Dead">Dead</option>
        <option value="Speed issue">Speed issue</option>
        <option value="Red light">Red light</option>
        <option value="Pon Light issue">Pon Light issue</option>
        <option value="Login issue">Login issue</option>
        <option value="Wifi Range issue">Wifi Range issue</option>
        <option value="Other">Other</option>
    </select>
    <input type="submit" value="Register Complaint">
</form>
    
</body>
</html>
