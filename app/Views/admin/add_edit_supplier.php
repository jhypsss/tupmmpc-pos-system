<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'pos_db');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Check if ID is provided for updating
    if (isset($_POST['id']) && !empty($_POST['id'])) {
        // Prepare and bind the parameters for updating
        $stmt = $conn->prepare("UPDATE supplier SET supplier_name=?, contact_person=?, contact_number=?, email=?, business_type=? WHERE id=?");
        $stmt->bind_param("sssssi", $supplier_name, $contact_person, $contact_number, $email, $business_type, $id);

        // Set parameters and execute
        $id = $_POST['id'];
    } else {
        // Prepare and bind the parameters for adding
        $stmt = $conn->prepare("INSERT INTO supplier (supplier_name, contact_person, contact_number, email, business_type) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $supplier_name, $contact_person, $contact_number, $email, $business_type);
    }

    // Set parameters and execute
    $supplier_name = $_POST['supplier_name'];
    $contact_person = $_POST['contact_person'];
    $contact_number = $_POST['contact_number'];
    $email = $_POST['email'];
    $business_type = $_POST['business_type'];

    if ($stmt->execute()) {
        echo (isset($_POST['id']) && !empty($_POST['id'])) ? "Supplier updated successfully" : "New supplier added successfully";
    } else {
        echo "Error: " . $conn->error;
    }

    $stmt->close();
    $conn->close();
}
?>
