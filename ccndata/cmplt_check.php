<?php
session_start();
include 'db_connection.php';

if (!isset($_SESSION['username'])) {
    echo "Please log in to check complaints.";
    exit;
}

$username = $_SESSION['username'];

// Fetch new complaints
$sql = "SELECT m.operator_id, mc.modem_mac_address, mc.complaint_type, mc.complaint_status, 
                       m.warranty_expiry_date, m.modem_vendor 
                FROM modem_complaints AS mc 
                JOIN modems AS m
                 ON 
                 mc.modem_mac_address = m.modem_mac_address";
$new_complaints = $conn->query($sql);

// Handle form submission to update complaint status
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mac_address = $_POST['mac_address'];
    $updated_status = $_POST['complaint_status'];
    $update_sql = "UPDATE modem_complaints SET complaint_status = ? WHERE modem_mac_address = ?";
    $stmt = $conn->prepare($update_sql);
    $stmt->bind_param("ss", $updated_status, $mac_address);
    $stmt->execute();
    
    if ($stmt->affected_rows > 0) {
        echo "<p>Complaint status successfully updated!</p>";
    } else {
        echo "<p>Failed to update the complaint status.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Check</title>
</head>
<body>
<h2>New Complaints</h2>
<table border="1">
    <tr>
        <th>Operator IDs</th>
        <th>MAC Address</th>
        <th>Complaint Type</th>
        <th>Complaint Status</th>
        <th>Action</th>
    </tr>
    <?php while ($row = $new_complaints->fetch_assoc()): ?>
        <tr>
            <td><?php echo htmlspecialchars($row['operator_id']); ?></td>
            <td><?php echo htmlspecialchars($row['modem_mac_address']); ?></td>
            <td><?php echo htmlspecialchars($row['complaint_type']); ?></td>
            <td><?php echo htmlspecialchars($row['complaint_status']); ?></td>
            <td>
                <form method="POST" action="">
                    <input type="hidden" name="mac_address" value="<?php echo $row['modem_mac_address']; ?>">
                    <select name="complaint_status" required>
                        <option value="">Select Status</option>
                        <option value="In_progress">In Progress</option>
                        <option value="Resolved">Resolved</option>
                        <option value="Complaint">Complaint</option>
                    </select>
                    <button type="submit">Update Status</button>
                </form>
            </td>
        </tr>
    <?php endwhile; ?>
</table>
</body>
</html>
