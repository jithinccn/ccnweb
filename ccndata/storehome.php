<?php
session_start();
include 'db_connection.php'; // Include your database connection file

// Ensure user is logged in
if (!isset($_SESSION['username'])) {
    echo "Please log in.";
    exit;
}

// Total modem count
$count_total = "SELECT COUNT(*) AS modem_mac_address FROM modems";
$stmt = $conn->prepare($count_total);
$stmt->execute();

// Bind the result to a variable
$stmt->bind_result($modemCount);
$stmt->fetch();
$stmt->close();

// Query for vendor counts
$vendoor_count = "
    SELECT 
        m.modem_vendor AS Modem_Vendor,
        COUNT(DISTINCT m.modem_mac_address) AS Total_Modems,
        COUNT(mc.modem_mac_address) AS Total_Complaints,
        COUNT(CASE WHEN mc.complaint_status = 'New_complaint' THEN 1 END) AS Open_Complaints,
        COUNT(CASE WHEN mc.complaint_status = 'Resolved' THEN 1 END) AS Resolved_Complaints,
        COUNT(CASE WHEN mc.complaint_status = 'Replaced' THEN 1 END) AS Replaced,
        COUNT(CASE WHEN mc.complaint_status = 'sended to service' THEN 1 END) AS sended_to_service
    FROM 
        modems m
    LEFT JOIN 
        modem_complaints mc ON m.modem_mac_address = mc.modem_mac_address
    GROUP BY 
        m.modem_vendor
";
$result_vendoor_count = $conn->query($vendoor_count);

// Check if the query was successful
if (!$result_vendoor_count) {
    echo "Error with query: " . $conn->error;
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint and Modem Count</title>
    <link rel="stylesheet" href="css/frame.css">
</head>
<body>
    <div>
        <!-- Display total modems -->
        <div id="modemCountContainer">
            <p><?php echo "Total Modems In CCN Store: " . htmlspecialchars($modemCount); ?></p>
        </div>

        <!-- Display complaint statuses and counts -->
        <div id="complaintCountContainer">
            <table>
                <tr>
                    <th>Modem Vendor</th>
                    <th>Total Modems</th>
                    <th>Total Complaints</th>
                    <th>Open Complaints</th>
                    <th>Resolved Complaints</th>
                    <th>Replaced</th>
                    <th>Sended to Service</th>
                </tr>
                <?php
                // Check if there are any results
                if ($result_vendoor_count->num_rows > 0) {
                    // Loop through each row
                    while ($row = $result_vendoor_count->fetch_assoc()) {
                        // Assign each column to a variable
                        $modemVendor = htmlspecialchars($row['Modem_Vendor']);
                        $totalModems = htmlspecialchars($row['Total_Modems']);
                        $totalComplaints = htmlspecialchars($row['Total_Complaints']);
                        $openComplaints = htmlspecialchars($row['Open_Complaints']);
                        $resolvedComplaints = htmlspecialchars($row['Resolved_Complaints']);
                        $replaced = htmlspecialchars($row['Replaced']);
                        $sentToService = htmlspecialchars($row['sended_to_service']);
                        echo "<tr>
                                <td>$modemVendor</td>
                                <td>$totalModems</td>
                                <td>$totalComplaints</td>
                                <td>$openComplaints</td>
                                <td>$resolvedComplaints</td>
                                <td>$replaced</td>
                                <td>$sentToService</td>
                              </tr>";
                    }
                } else {
                    echo "<tr><td colspan='7'>No data found</td></tr>";
                }
                ?>
            </table>
        </div>

        <div id="additionalContentContainer">
            <!-- Additional content can go here -->
        </div>
    </div>
</body>
</html>

<?php
// Close the database connection
$conn->close();
?>
