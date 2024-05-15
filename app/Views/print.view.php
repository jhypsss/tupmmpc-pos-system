<?php 

	if($_SERVER['REQUEST_METHOD'] == "POST")
	{

 		$WshShell = new COM("WScript.Shell");
 		$obj = $WshShell->Run("cmd /c wscript.exe www/public/file.vbs",0, true); 
 		$obj = $WshShell->Run("cmd /c wscript.exe ".ABSPATH."/file.vbs",0, true); 
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
			size:  auto;   /* auto is the initial value */
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
		}

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
		<h1><?=$obj['company']?></h1>
		<h4>Receipt</h4>
	</center>

	<table class="table table-striped">
		<tr>
			<th>Qty</th><th>Description</th><th>@</th><th>Amount</th>
		</tr>

		<?php foreach ($obj['data'] as $row):?>
			<tr>
				<td><?=$row['qty']?></td><td><?=$row['description']?></td><td>₱<?=$row['amount']?></td><td>₱<?=number_format($row['qty'] * $row['amount'],2)?></td>
			</tr>
		<?php endforeach;?>

		<tr>
			<td colspan="2"></td><td><b>Total:</b></td><td><b>₱<?=$obj['gtotal']?></b></td>
		</tr>
		<tr>
			<td colspan="2"></td><td>Amount paid:</td><td>₱<?=$obj['amount']?></td>
		</tr>
		<tr>
			<td colspan="2"></td><td>Change:</td><td>₱<?=$obj['change']?></td>
		</tr>
		<tr>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td>Order Number:</td>
			<td colspan="3">
				<?=get_receipt_no()?>
			</td>
		</tr>
		<tr>
			<td>Cashier: </td> 
			<td colspan="3"> 
				<?=auth('username')?>
			</td>
		</tr>
		<tr>
			<td>Date and Time:</td>
			<td colspan="3">
				<?php date_default_timezone_set('Asia/Shanghai');?>
				<?=date("M j, Y H:i a")?>
			</td>
		</tr>
	</table>

	<center>
		<p>This serves as your Official Receipt.<br><i>Thanks for shopping with us!</i></p></center>
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
