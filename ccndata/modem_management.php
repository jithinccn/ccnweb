<?php
session_start();
include 'db_connection.php'; // Include your database connection file

// Ensure the user is logged in
if (!isset($_SESSION['username'])) {
    echo "Please log in to register a complaint.";
    exit;
}

// Fetch modems with complaints for the search functionality
if (isset($_GET['search'])) {
    $type = $_GET['type'];
    $search_input = $_GET['selection'];

    $sql = $type === 'MAC Address'
        ? "SELECT m.operator_id, mc.modem_mac_address, mc.complaint_type, mc.complaint_status, 
                  m.warranty_expiry_date, m.modem_vendor 
           FROM modem_complaints AS mc 
           JOIN modems AS m 
           ON mc.modem_mac_address = m.modem_mac_address 
           WHERE mc.modem_mac_address = ?"
        : "SELECT m.operator_id, mc.modem_mac_address, mc.complaint_type, mc.complaint_status, 
                  m.warranty_expiry_date, m.modem_vendor 
           FROM modem_complaints AS mc 
           JOIN modems AS m 
           ON mc.modem_mac_address = m.modem_mac_address 
           WHERE m.operator_id = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $search_input);
    $stmt->execute();
    $result = $stmt->get_result();
}

// Fetch available modems for replacement (CCN operator ID, not in complaints)
$sql2 = "SELECT m.modem_mac_address 
         FROM modems AS m
         WHERE m.operator_id = 'CCN' 
         AND NOT EXISTS (
             SELECT 1 FROM modem_complaints AS mc WHERE mc.modem_mac_address = m.modem_mac_address
         )";
$result_filter = $conn->query($sql2);
$data_filter = $result_filter ? $result_filter->fetch_all(MYSQLI_ASSOC) : [];

// Handle replacement functionality
if (isset($_POST['replace_mac'])) {
    $old_mac = $_POST['old_mac'];
    $new_mac = $_POST['new_mac'];
    $warranty_period_months = intval($_POST['warranty_period_months']);

    // Start transaction
    $conn->begin_transaction();

    try {
        // Update the old modem: set operator_id to 'CCN'
        $sql_replace_old = "UPDATE modems SET operator_id = 'CCN' WHERE modem_mac_address = ?";
        $stmt_replace_old = $conn->prepare($sql_replace_old);
        $stmt_replace_old->bind_param("s", $old_mac);

        if (!$stmt_replace_old->execute()) {
            throw new Exception("Failed to update old modem: " . $stmt_replace_old->error);
        }

        // Update the new modem: set operator_id to the old modem's operator_id, reset warranty_expiry_date
        $sql_get_old_operator = "SELECT operator_id FROM modems WHERE modem_mac_address = ?";
        $stmt_get_old_operator = $conn->prepare($sql_get_old_operator);
        $stmt_get_old_operator->bind_param("s", $old_mac);
        $stmt_get_old_operator->execute();
        $result_operator = $stmt_get_old_operator->get_result();
        $old_operator_id = $result_operator->fetch_assoc()['operator_id'];

        $new_warranty_expiry = date('Y-m-d', strtotime("+$warranty_period_months months"));
        $sql_replace_new = "UPDATE modems 
                            SET operator_id = ?, warranty_expiry_date = ? 
                            WHERE modem_mac_address = ?";
        $stmt_replace_new = $conn->prepare($sql_replace_new);
        $stmt_replace_new->bind_param("sss", $old_operator_id, $new_warranty_expiry, $new_mac);

        if (!$stmt_replace_new->execute()) {
            throw new Exception("Failed to update new modem: " . $stmt_replace_new->error);
        }

        // Commit transaction
        $conn->commit();
        echo "Modem replacement completed successfully.";
    } catch (Exception $e) {
        // Rollback transaction on error
        $conn->rollback();
        echo "Error: " . $e->getMessage();
    } finally {
        // Close statements
        $stmt_replace_old->close();
        $stmt_replace_new->close();
        $stmt_get_old_operator->close();
    }
}
?>
