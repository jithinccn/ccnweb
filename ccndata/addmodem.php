<?php
session_start();
include 'db_connection.php';



$sql1 = "SELECT operator_id FROM operators";
$result_op = $conn->query($sql1);
$data=$result_op->fetch_all(MYSQLI_ASSOC);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Database connection
    

    // Collect data from POST
    $operator_id = $_POST['op_list'];
    $modem_vendor = $_POST['modem_vendor'];
    $modem_model = $_POST['modem_model'];
    $modem_mac_address = $_POST['modem_mac_address'];
    $modem_serial_number = $_POST['modem_serial_number'];
    $entry_date = $_POST['entry_date'] ?: date('Y-m-d'); // Default to current date if empty
    $warranty_period_months = $_POST['warranty_period_months'];

    // Insert data
    $stmt = $conn->prepare("INSERT INTO modems (operator_id, modem_vendor, modem_model, modem_mac_address, modem_serial_number, entry_date, warranty_period_months) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssi", $operator_id, $modem_vendor, $modem_model, $modem_mac_address, $modem_serial_number, $entry_date, $warranty_period_months);
    
    if ($stmt->execute()) {
        echo "Modem added successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }
    

    $stmt->close();
    $conn->close();
    // Fetch operator IDs for dropdown





// $operatorIds = [];


if ($result_op->num_rows > 0) {
    while ($row = $result_op->fetch_assoc()) {
        
        
    }
}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Modem</title>
</head>
<body>
    <h2>Add Modem</h2>
    <form method="POST" action="">
                <label for="op_list">Operator id</label>
                <input list="op_list" name=op_list id="op_lists">
                <datalist id="op_list" name="op_id_list">
            
                    <?php 
                    foreach ($data as $id):
                        echo "<option value=".$id['operator_id'].">";
                    endforeach;
                    ?>
                    
                    
                </datalist>
           
        <br><br>

        <label for="modem_vendor">Modem Vendor:</label>
        <input type="text" id="modem_vendor" name="modem_vendor" required><br><br>

        <label for="modem_model">Modem Model:</label>
        <input type="text" id="modem_model" name="modem_model" required><br><br>

        <label for="modem_mac_address">MAC Address:</label>
        <input type="text" id="modem_mac_address" name="modem_mac_address" required><br><br>

        <label for="modem_serial_number">Serial Number:</label>
        <input type="text" id="modem_serial_number" name="modem_serial_number" required><br><br>

        <label for="entry_date">Entry Date:</label>
        <input type="date" id="entry_date" name="entry_date"><br><br>

        <label for="warranty_period_months">Warranty Period (months):</label>
        <input type="number" id="warranty_period_months" name="warranty_period_months" required><br><br>

        <button type="submit">Add Modem</button>
    </form>
</body>
</html>
