<?php
// Assuming you have a database connection already established
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'pos_db';

$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Include TCPDF library
require_once('tcpdf/tcpdf.php');

// Create a TCPDF object
$pdf = new TCPDF();

// Add a page
$pdf->AddPage();

// Set font
$pdf->SetFont('helvetica', '', 12);
$pdf->SetTitle('TUP Manila Multi-Purpose Cooperative');

// Add some text
$pdf->Cell(0, 10, 'TUP Manila Multi-Purpose Cooperative', 0, 0, 'C');
$pdf->Ln();
$pdf->Cell(0, 10, 'TUPMMPC Product Barcode List', 0, 1, 'C');

// Fetch data from the products table
$query = "SELECT barcode, description, amount FROM products WHERE if_deleted = 0";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    // Start the table
    $pdf->SetFont('helvetica', 'B', 12);
    $pdf->SetFillColor(200, 220, 255); // Set table header background color
    $pdf->Cell(90, 10, 'Product', 0, 0, 'L');
    $pdf->Cell(90, 10, 'Barcode', 0, 1, 'L');

    // Set font back to regular for the table content
    $pdf->SetFont('helvetica', '', 12);

    // Loop through the records
    while ($row = $result->fetch_assoc()) {
        // Extract data from the current row
        $barcodeValue = $row['barcode'];
        $description = $row['description'];
        $amount = $row['amount'];

        // Add product information to the table
        //$pdf->Cell(90, 10, "Name: $description \nPrice: $amount", 0, 0, 'L');
        $pdf->MultiCell(90, 10, "Name: $description \nPrice: $amount", 0, 'L', 0, 0);
        
        // Add a 1D barcode (CODE 39)
        $style = array(
            'position' => '',
            'align' => 'C',
            'stretch' => false,
            'fitwidth' => true,
            'cellfitalign' => '',
            'cellfitvalign' => '',
            'border' => false,
            'hpadding' => 0,
            'vpadding' => 0,
            'fgcolor' => array(0, 0, 0),
            'bgcolor' => false, // array(255,255,255)
            'text' => true,
            'font' => 'helvetica',
            'fontsize' => 8,
            'stretchtext' => 4
        );
        $pdf->write1DBarcode($barcodeValue, 'C128', '', '', '', 18, 0.4, $style, 'N');

        // Add a new line for the next row
        $pdf->Ln();
    }

    // Output the PDF to the browser or save it to a file
    $pdf->Output('barcode.pdf', 'I');
} else {
    echo "No products found in the database.";
}

// Close the database connection
$conn->close();
?>
