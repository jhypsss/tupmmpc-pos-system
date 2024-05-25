<?php 

	if($_SERVER['REQUEST_METHOD'] == "POST")
	{
 		$WshShell = new COM("WScript.Shell");
 		$obj = $WshShell->Run("cmd /c wscript.exe www/public/file.vbs",0, true); 
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?= esc(APP_NAME) ?></title>

	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">

	<style>
		@page 
		{
			size:  A5 portrait;   /*Paper size */
			margin: 0mm;  /* this affects the margin in the printer settings */
		}

		html
		{
			background-color: #FFFFFF; 
			margin: 0px;  /* this affects the margin on the html before sending to printer */
		}

		body
		{
			border: solid 0px;
			margin: 10mm 15mm 10mm 15mm; /* margin you want for the content */
			font-size:12px;
		}

		.price {
			text-align:right;
			width: 20%;
		}
	</style>
</head>
<body>
	<?php 

		$vars = $_GET['vars'] ?? "";

		$obj = json_decode($vars,true);

	?>
<?php if(is_array($obj)):?>

	<center>
		<h3><?=$obj['store']?></h3>
		<p><?=$obj['address']?></p>
		<h6>OFFICIAL RECEIPT</h6>
		<p><?=date("M j, Y (D) H:i:s")?></p>
	</center>
	<table class="table table-default table-sm">
		<tbody>
			<tr>
				<td colspan="2">Cashier: <?= strtoupper($obj['staffid'])?> - <?=strtoupper($obj['staff'])?></td>
			</tr>
			<tr>
				<td>Receipt: #<?=$obj['receiptno']?></td>
			</tr>
		</tbody>
	</table>

	<table class="table table-striped table-sm">
		<thead class="table">
		<tr>
			<th>Qty</th><th>Description</th><th style="text-align:right;">@</th><th style="text-align:right;">Amount</th>
		</tr>
		</thead>
		<tbody>
		<?php $i=0; foreach ($obj['data'] as $row):?>
			<tr>
				<td><?=$row['qty']?></td>
				<td style="width: auto;"><?=$row['description']?></td>
				<td class="price"><?=$row['amount']?></td>
				<td class="price"><?=number_format($row['qty'] * $row['amount'],2)?></td>
			</tr>
			<?php $i=$i+1;?>
		<?php endforeach;?>
		</tbody>

		<tbody>
		<tr>
			<td colspan="2"></td><td><b>Total Due:</b></td>
			<td class="price" style="font-size:16px;"><b>₱<?=number_format($obj['gtotal'],2)?></b></td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td>Cash:</td>
			<td class="price">₱<?=number_format($obj['amount'],2)?></td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td>Change:</td>
			<td class="price"><?=number_format($obj['change'],2)?></td>
		</tr>
		</tbody>
	</table>

	<center>
		<i>Thanks for shopping with us!</i>
		<br><br>
		<p>
		CONTACT US <br>
		Email: tup@tup.edu.ph <br>
		Website: www.tup.edu.ph
		</p>
		<i>This serves as your Official Receipt.</i>
	</center>
<?php endif;?>

<script>
	
	window.print();

	var ajax = new XMLHttpRequest();

	ajax.addEventListener('readystatechange',function(){

	if(ajax.readyState == 4)
		{
			//console.log(ajax.responseText);
		}
	});

	ajax.open('POST','',true);
	//ajax.send();

</script>
</body>
</html>
