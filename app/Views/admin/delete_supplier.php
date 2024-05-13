<?php
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id'])) {
    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'pos_db');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare and bind the parameter
    $stmt = $conn->prepare("DELETE FROM supplier WHERE id=?");
    $stmt->bind_param("i", $id);

    // Set parameter and execute
    $id = $_GET['id'];
    
    if ($stmt->execute()) {
        echo "Supplier deleted successfully";
    } else {
        echo "Error: " . $conn->error;
    }

    $stmt->close();
    $conn->close();
}
?>
