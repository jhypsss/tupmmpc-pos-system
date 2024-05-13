<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pos_db"; // Replace 'your_database_name' with your actual database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch year and month from AJAX request
$year = $_GET['year'];
$month = $_GET['month'];

// Prepare and execute SQL query
$sql = "SELECT * FROM sales WHERE YEAR(date) = YEAR('$year-$month-01') AND MONTH(date) = MONTH('$year-$month-01')";
$result = $conn->query($sql);

// Display sales data in HTML table format
if ($result->num_rows > 0) {
    echo "<table class='table table-striped table-hover'>";
    echo "<tr><th>Barcode</th><th>Receipt No</th><th>Description</th><th>Qty</th><th>Amount</th><th>Total</th><th>Cashier</th><th>Date</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["barcode"] . "</td>";
        echo "<td>" . $row["receipt_no"] . "</td>";
        echo "<td>" . $row["description"] . "</td>";
        echo "<td>" . $row["qty"] . "</td>";
        echo "<td>" . $row["amount"] . "</td>";
        echo "<td>" . $row["total"] . "</td>";
        echo "<td>" . $row["cashier"] . "</td>";
        echo "<td>" . $row["date"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "No sales data available for the selected year and month.";
}
$conn->close();
?>
