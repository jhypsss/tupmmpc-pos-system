<?php
// Assuming you have a database connection
$servername = "localhost";
$username = "root";
$password = ""; // Assuming password is empty
$dbname = "pos_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$year = $_GET['year'];
$month = $_GET['month'];

if(isset($_GET['day'])){
    $day = $_GET['day'];
    $lbl = "Today";
    // Convert numerical month to month text
    $month_text = date("F", mktime(0, 0, 0, $month, 1));
    $month_text = "".$month_text." ".$day.", ";
    $sql = "SELECT * FROM sales WHERE YEAR(date) = $year AND MONTH(date) = $month AND DAY(date) = $day";
    $result = $conn->query($sql);
}
else{
    // Ensure $month is set and within a valid range
    $month_text = $month;
    if ($month_text >= 1 && $month_text <= 12) {
        $lbl = "Monthly";
        // Convert numerical month to month text
        $month_text = date("F", mktime(0, 0, 0, $month_text, 1));
        $month_text = "".$month_text.", ";
        // Assuming sales table structure and proper sanitization/preparation to prevent SQL injection
        $sql = "SELECT * FROM sales WHERE YEAR(date) = $year AND MONTH(date) = $month";
        $result = $conn->query($sql);
    }
    else if($month_text == 13){
        $lbl = "Annually";
        $month_text = "";
        // Assuming sales table structure and proper sanitization/preparation to prevent SQL injection
        $sql = "SELECT * FROM sales WHERE YEAR(date) = $year";
        $result = $conn->query($sql);
    }
}

if ($result->num_rows > 0) {
    echo "<h4>".$lbl." Sales Report (".$month_text."".$year.") </h4>
    <table border='1'>
    <tr>
        <th>Barcode</th>
        <th>Receipt No</th>
        <th>Description</th>
        <th>Quantity</th>
        <th>Amount</th>
        <th>Date</th>
    </tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>
        <td>".$row["barcode"]."</td>
        <td>".$row["receipt_no"]."</td>
        <td>".$row["description"]."</td>
        <td>".$row["qty"]."</td>
        <td>".$row["amount"]."</td>
        <td>".$row["date"]."</td>
        </tr>";
    }
    echo "</table>";
} else {
    echo "<h4>".$lbl." Sales Report (".$month_text."".$year.") </h4>
    <table border='1'>
    <tr>
        <th>Barcode</th>
        <th>Receipt No</th>
        <th>Description</th>
        <th>Quantity</th>
        <th>Amount</th>
        <th>Date</th>
    </tr>";
    echo "</table>";
}
$conn->close();
?>
