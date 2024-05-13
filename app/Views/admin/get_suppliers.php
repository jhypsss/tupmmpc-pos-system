<?php
// Database connection
$conn = new mysqli('localhost', 'root', '', 'pos_db');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch suppliers from database
$sql = "SELECT * FROM supplier";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row['supplier_name']."</td>";
        echo "<td>".$row['contact_person']."</td>";
        echo "<td>".$row['contact_number']."</td>";
        echo "<td>".$row['email']."</td>";
        echo "<td>".$row['business_type']."</td>";
        echo "<td><button id='editbtn' class='btn btn-sm btn-primary editBtn' data-id='".$row['id']."'>Edit</button> <button class='btn btn-sm btn-danger deleteBtn' data-id='".$row['id']."'>Delete</button></td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='6'>No suppliers found</td></tr>";
}

$conn->close();
?>
