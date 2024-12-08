<?php
session_start();
include 'db_connection.php';

// Define the SQL queries for both tables
$sql_complaints = "SELECT mc.id, m.operator_id, mc.modem_mac_address, mc.complaint_type, mc.complaint_status, 
                           mc.complaint_register_date, m.warranty_expiry_date, m.modem_vendor 
                    FROM modem_complaints AS mc 
                    JOIN modems AS m 
                    ON mc.modem_mac_address = m.modem_mac_address";

$sql_modems = "SELECT operator_id, modem_vendor, modem_model, modem_serial_number, 
                      entry_date, warranty_period_months, modem_mac_address, warranty_expiry_date 
               FROM modems";

// Handle button click to export the data as CSV
if (isset($_POST['export_complaints'])) {
    exportData($sql_complaints, 'modem_complaints.csv', ['Complaint ID', 'Operator ID', 'MAC Address', 'Complaint Type', 'Complaint Status', 'Complaint Register Date', 'Warranty Expiry Date', 'Modem Vendor']);
}

if (isset($_POST['export_modems'])) {
    exportData($sql_modems, 'ccn_store_modems.csv', ['Operator ID', 'Modem Vendor', 'Modem Model', 'Serial Number', 'Entry Date', 'Warranty Period (Months)', 'MAC Address', 'Warranty Expiry Date']);
}

// Function to export data as CSV
function exportData($sql, $filename, $headers) {
    global $conn;
    $result = $conn->query($sql);
    
    if ($result) {
        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        
        $output = fopen("php://output", "w");
        fputcsv($output, $headers);
        
        while ($row = $result->fetch_assoc()) {
            fputcsv($output, $row);
        }
        
        fclose($output);
        exit; // Terminate the script to ensure no other output is sent after the CSV
    } else {
        echo "Error fetching data: " . $conn->error;
    }
}

// Fetch the data for display (don't close the connection yet)
$result_complaints = $conn->query($sql_complaints);
$result_modems = $conn->query($sql_modems);

// Display the data
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modem Complaints and Modems Export</title>
</head>
<body>
    <h2>Export Data as CSV</h2>
    
  

   

    <!-- Display Modem Complaints Data -->
    <h2>Modem Complaints List</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Complaint ID</th>
                <th>Operator ID</th>
                <th>MAC Address</th>
                <th>Complaint Type</th>
                <th>Complaint Status</th>
                <th>Complaint Register Date</th>
                <th>Warranty Expiry Date</th>
                <th>Modem Vendor</th>
            </tr>
              <!-- Form to trigger download of complaints data CSV -->
    <form method="POST" action="">
        <button type="submit" name="export_complaints">Download </button>
    </form>
        </thead>
        <tbody>
            <?php if ($result_complaints->num_rows > 0): ?>
                <?php while ($row = $result_complaints->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['id']); ?></td>
                        <td><?php echo htmlspecialchars($row['operator_id']); ?></td>
                        <td><?php echo htmlspecialchars($row['modem_mac_address']); ?></td>
                        <td><?php echo htmlspecialchars($row['complaint_type']); ?></td>
                        <td><?php echo htmlspecialchars($row['complaint_status']); ?></td>
                        <td><?php echo htmlspecialchars($row['complaint_register_date']); ?></td>
                        <td><?php echo htmlspecialchars($row['warranty_expiry_date']); ?></td>
                        <td><?php echo htmlspecialchars($row['modem_vendor']); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="8">No complaints found.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <hr>

    <!-- Display Modems in CCN Store Data -->
    <h2>Modems in CCN Store</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Operator ID</th>
                <th>Modem Vendor</th>
                <th>Modem Model</th>
                <th>Modem Serial Number</th>
                <th>Entry Date</th>
                <th>Warranty Period (Months)</th>
                <th>MAC Address</th>
                <th>Warranty Expiry Date</th>
            </tr>
             <!-- Form to trigger download of modems in CCN store data CSV -->
    <form method="POST" action="">
        <button type="submit" name="export_modems">Download </button>
    </form>

    <hr>
        </thead>
        <tbody>
            <?php if ($result_modems->num_rows > 0): ?>
                <?php while ($row = $result_modems->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['operator_id']); ?></td>
                        <td><?php echo htmlspecialchars($row['modem_vendor']); ?></td>
                        <td><?php echo htmlspecialchars($row['modem_model']); ?></td>
                        <td><?php echo htmlspecialchars($row['modem_serial_number']); ?></td>
                        <td><?php echo htmlspecialchars($row['entry_date']); ?></td>
                        <td><?php echo htmlspecialchars($row['warranty_period_months']); ?></td>
                        <td><?php echo htmlspecialchars($row['modem_mac_address']); ?></td>
                        <td><?php echo htmlspecialchars($row['warranty_expiry_date']); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="8">No modems found.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

</body>
</html>

<?php
// Close the database connection after displaying data
$conn->close();
?>
