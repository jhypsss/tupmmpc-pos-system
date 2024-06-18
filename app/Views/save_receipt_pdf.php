<?php
require_once('../app/Controllers/tcpdf/tcpdf.php');

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);
        $html = $data['html'];
        $receipt_no = $data['receiptno'];
        $date = $data['date'];;
        $folder = "uploads/receipts/";
		if(!file_exists($folder))
		{
			mkdir($folder,0777,true);
		}
        $pdf = new TCPDF();
        $pdf->AddPage();
        $pdf->writeHTML($html, true, false, true, false, '');
        $file_path = 'assets/.'.$folder.'./receipt_'.$receipt_no.'-'.$date.'.pdf';
        $pdf->Output(__DIR__ . '/' . $file_path, 'F');

        echo json_encode(['file_path' => $file_path]);
    }

?>