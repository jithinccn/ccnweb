<?php
// Handle AJAX request to fetch data
if (isset($_GET['data_type'])) {
    // Database connection
    include 'db_connection.php';

    // Check connection
    if ($conn->connect_error) {
        die('Connection failed: ' . $conn->connect_error);
    }

    // Get the data type
    $data_type = $_GET['data_type'];

    // Fetch data based on the selected data type
    if ($data_type === 'operator_id') {
        $sql = "SELECT m.operator_id AS id, m.operator_id AS name
                FROM modems AS m
                JOIN modem_complaints AS mc 
                ON m.modem_mac_address = mc.modem_mac_address
                WHERE mc.complaint_status = 'complaint'";
    } elseif ($data_type === 'mac_address') {
        $sql = "SELECT m.modem_mac_address AS id, m.modem_mac_address AS name
                FROM modems AS m
                JOIN modem_complaints AS mc 
                ON m.modem_mac_address = mc.modem_mac_address
                WHERE mc.complaint_status = 'complaint'";
    } else {
        echo json_encode([]);
        exit;
    }

    $result = $conn->query($sql);
    $data = [];
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
    }

    // Return the data as JSON
    header('Content-Type: application/json');
    echo json_encode($data);
    $conn->close();
    exit;
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Database connection
    include 'db_connection.php';

    if ($conn->connect_error) {
        die('Connection failed: ' . $conn->connect_error);
    }

    $selected_id = $_POST['select_item'];

    // Fetch details of the selected item
    $sql = "SELECT operator_id, modem_mac_address FROM modems WHERE operator_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $selected_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        $operator_id = $row['operator_id'];
        $mac_address = $row['modem_mac_address'];
    } else {
        $operator_id = 'Not found';
        $mac_address = 'Not found';
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Operator ID and MAC Address</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<form action="" method="POST">
    <label for="data_type">Select Data Type:</label>
    <select id="data_type" name="data_type" required>
        <option value="">--Select Data Type--</option>
        <option value="operator_id">Operator ID</option>
        <option value="mac_address">MAC Address</option>
    </select>

    <label for="select_item">Select or Type Item:</label>
    <input list="data_list" id="select_item" name="select_item" required>
    <datalist id="data_list">
        <!-- Options will be dynamically added here -->
    </datalist>

    <button type="submit">Submit</button>
</form>

<div id="result">
    <?php if ($_SERVER['REQUEST_METHOD'] === 'POST'): ?>
        <h3>Selected Item Details</h3>
        <table>
            <thead>
                <tr>
                    <th>Operator ID</th>
                    <th>MAC Address</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><?= htmlspecialchars($operator_id) ?></td>
                    <td><?= htmlspecialchars($mac_address) ?></td>
                </tr>
            </tbody>
        </table>
    <?php endif; ?>
</div>

<script>
    document.getElementById('data_type').addEventListener('change', function () {
        const dataType = this.value;

        // Clear the datalist
        const dataList = document.getElementById('data_list');
        dataList.innerHTML = '';

        if (dataType) {
            // Make an AJAX request to fetch data
            fetch(`?data_type=${dataType}`)
                .then(response => response.json())
                .then(data => {
                    data.forEach(item => {
                        const option = document.createElement('option');
                        option.value = item.name; // Display name/label
                        dataList.appendChild(option);
                    });
                })
                .catch(error => console.error('Error fetching data:', error));
        }
    });
</script>

</body>
</html>
