<?php
session_start();
include 'db_connection.php'; // Include your database connection file

// Ensure user is logged in
if (!isset($_SESSION['username'])) {
    echo "Please log in to view data.";
    exit;
}

// Initialize variables for selection and results
$selected_type = '';
$selected_value = '';
$results = [];
$operator_ids = [];
$mac_addresses = [];

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Set the selected type from the form
    $selected_type = $_POST['input_type'];
    $selected_value = $_POST['input_value'];

    // Query to fetch details based on the selected type and value
    if ($selected_type === 'modem_mac_address') {
        $sql = "
            SELECT 
                mc.modem_mac_address, 
                mc.complaint_status, 
                m.operator_id, 
                m.modem_vendor, 
                m.modem_model, 
                m.warranty_expiry_date,
                CASE 
                    WHEN m.warranty_expiry_date < CURDATE() THEN 'Expired'
                    ELSE 'Valid'
                END AS warranty_status
            FROM 
                modem_complaints mc
            JOIN 
                modems m ON mc.modem_mac_address = m.modem_mac_address
            WHERE 
                mc.complaint_status = 'Complaint'
                AND m.warranty_expiry_date >= CURDATE()
                AND m.modem_mac_address ;"; // Filter by selected modem MAC address
    } elseif ($selected_type === 'operator_id') {
        $sql = "
            SELECT 
                mc.modem_mac_address, 
                mc.complaint_status, 
                m.operator_id, 
                m.modem_vendor, 
                m.modem_model, 
                m.warranty_expiry_date,
                CASE 
                    WHEN m.warranty_expiry_date < CURDATE() THEN 'Expired'
                    ELSE 'Valid'
                END AS warranty_status
            FROM 
                modem_complaints mc
            JOIN 
                modems m ON mc.modem_mac_address = m.modem_mac_address
            WHERE 
                mc.complaint_status = 'Complaint'
                AND m.warranty_expiry_date >= CURDATE()
                AND m.operator_id = ?;"; // Filter by selected operator ID
    }

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $selected_value);
    $stmt->execute();
    $results = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

    // Fetch available operator IDs and MAC addresses for dynamic datalist
    
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modem Details Viewer</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>View Modem Details</h1>

    <!-- Selection Form -->
    <form method="POST">
        <label for="input_type">Select Type:</label>
        <select id="input_type" name="input_type" required onchange="updateDatalist()">
            <option value="">-- Select Type --</option>
            <option value="operator_id" <?= $selected_type === 'operator_id' ? 'selected' : '' ?>>Operator ID</option>
            <option value="modem_mac_address" <?= $selected_type === 'modem_mac_address' ? 'selected' : '' ?>>MAC Address</option>
        </select>
    <!-- Input field with the "oninput" event triggering the JavaScript function -->
    <input type="text" id="input_value" name="input_value" list="dynamic_list" oninput="updateDatalist()" placeholder="Type to filter options">
    
    <!-- Datalist with options dynamically populated by PHP -->
    <datalist id="dynamic_list">
        <?php
        foreach ($results as $result) {
            echo "<option value='" . htmlspecialchars($result) . "'>";
        }
        ?>
    </datalist>

    <script>
        // Define the JavaScript function to handle the input event
        function updateDatalist() {
            // Get the input value
            var inputValue = document.getElementById('input_value').value;
            console.log('Input value changed to: ', inputValue);  // Log to console for debugging

            // Access the datalist and its options
            var datalist = document.getElementById('dynamic_list');
            var options = datalist.getElementsByTagName('option');
            
            // Loop through the options and filter them based on the input value
            for (var i = 0; i < options.length; i++) {
                if (options[i].value.toLowerCase().includes(inputValue.toLowerCase())) {
                    options[i].style.display = 'block'; // Show matching options
                } else {
                    options[i].style.display = 'none'; // Hide non-matching options
                }
            }
        }

        // Log when the script is loaded
        console.log("JavaScript loaded and ready.");
    </script>

        <button type="submit">View Details</button>
    </form>

    <!-- Results Table -->
    <?php if (!empty($results)): ?>
        <table>
            <thead>
                <tr>
                    <th>Modem MAC Address</th>
                    <th>Complaint Status</th>
                    <th>Operator ID</th>
                    <th>Modem Vendor</th>
                    <th>Modem Model</th>
                    <th>Warranty Expiry Date</th>
                    <th>Warranty Status</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($results as $row): ?>
                    <tr>
                        <td><?= htmlspecialchars($row['modem_mac_address']) ?></td>
                        <td><?= htmlspecialchars($row['complaint_status']) ?></td>
                        <td><?= htmlspecialchars($row['operator_id']) ?></td>
                        <td><?= htmlspecialchars($row['modem_vendor']) ?></td>
                        <td><?= htmlspecialchars($row['modem_model']) ?></td>
                        <td><?= htmlspecialchars($row['warranty_expiry_date']) ?></td>
                        <td><?= htmlspecialchars($row['warranty_status']) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php elseif ($_SERVER['REQUEST_METHOD'] === 'POST'): ?>
        <p>No data found for the selected criteria.</p>
    <?php endif; ?>

    
</body>
</html>
