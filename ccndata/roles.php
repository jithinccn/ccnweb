<?php
session_start();

if (!isset($_SESSION['role'])) {
    header("Location: index.php"); // Redirect to login if role is not set
    exit();
}

switch ($_SESSION['role']) {
    case 'store':
        header("Location: store.php");
        break;
    case 'service':
        header("Location: service.php");
        break;
    case 'customersupport':
        header("Location: customersupport.php");
        break;
    case 'support engineers':
        header("Location: support_engineers.php");
        break;
    case 'operators':
        header("Location: operators.php");
        break;
    case 'team lead':
        header("Location: team_lead.php");
        break;
    case 'admin':
        header("Location: admin.php");
        break;
    default:
        echo "Role not recognized!";
}
?>
