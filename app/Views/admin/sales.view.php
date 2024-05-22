<style>
	@media print {
		@page {
			size: letter;
		}
		body * {
			visibility: hidden;
		}
		
		#generateResult, #generateResult * {
			visibility: visible;
			
		}
		#generateResult {
			position: absolute;
			left: 0;
			top: 0;
			width: 100%;
			margin: 0;
		}
		
	}
	.task-roll-up {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 50px;
	}
	
	.no-items-message {
	font-size: 20px;
	color: #666;
	margin-bottom: 20px;
	display: flex;
	align-items: center;
	}
	
	.add-button {
	padding: 10px 20px;
	background-color: #0078d7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	display: flex;
	align-items: center;
	}
	
	.fa-fw {
	font-size: 1em;
	margin-right: 5px;
	}
	
	.icon {
	font-size: 4em;
	}
</style>
<ul class="nav nav-tabs">
  
  <li class="nav-item">
    <a class="nav-link <?=($section =='table') ? 'active':''?>" aria-current="page" href="index.php?pg=admin&tab=sales">
	    List View
	</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <?=($section =='graph') ? 'active':''?>" href="index.php?pg=admin&tab=sales&s=graph">
	    Graph View
	</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <?=($section =='generate') ? 'active':''?>" href="index.php?pg=admin&tab=sales&s=generate">
	    Generate Sales
	</a>
  </li>
  
</ul>

<br>

<?php if($section == 'table'):?>
<!--
<a href="../app/views/admin/sales_report.php"><button style="background-color: orange; border-radius: 5px;  color: white; border-color: white; padding: 7px;">SALES REPORTS</button></a>
-->
<?php if (!empty($sales)):?>
	
<div>
	<h2>Today's Total: ₱<?=number_format($sales_total,2)?></h2>	
</div>

<div class="table-responsive" style="height: 500px;overflow-y: scroll;">
	
	<table class="table table-striped table-hover">
		<thead class="table-light" style="position: sticky;top: 0">
		<tr>
			<th>Barcode</th>
			<th>Receipt No</th>
			<th>Description</th>
			<th>Qty</th>
			<th>Amount</th>
			<th>Total</th>
			<th>Cashier</th>
			<th colspan=2>Date | Time</th>			
		</tr>
		</thead>
		<tbody>
		<?php foreach ($sales as $sale):?>
	 		<tr>
				<td><?=esc($sale['barcode'])?></td>
				<td><?=esc($sale['receipt_no'])?></td>
				<td>
 					<?=esc($sale['description'])?>
 				</td>
				<td><?=esc($sale['qty'])?></td>
				<td><?=esc($sale['amount'])?></td>
				<td><?=esc($sale['total'])?></td>
				<?php 
					$cashier = get_user_by_id($sale['user_id']);
					if(empty($cashier)){
						$name = "Unknown";
						$namelink = "#";
					}else{
						$name = $cashier['username'];
						$namelink = "index.php?pg=profile&id=".$cashier['id'];
					}
				?>
				<td>
					<a href="<?=$namelink?>">
						<?=esc($name)?>
					</a>
				</td>
		
				<td><?=date("M j, Y | h:i:s a",strtotime($sale['date']))?></td>
				<td>
					<a href="index.php?pg=#&id=<?=$sale['id']?>">
					<button class="btn btn-success btn-sm"><i class="fa fa-cog"></i></button>
					</a>
				</td>
			</tr>
			<?php endforeach;?>
		
		</tbody>
	</table>
	
<?php
		$pager->display($totalSales);
?>
<?php else:?>

	<div class="task-roll-up">
		<i class="fa fa-money-bill-wave icon fa-fw"></i>
		<p class="no-items-message"> There are no sales for today.</p>
	</div>
<?php endif;?>

</div>

<?php elseif($section == 'graph'):?>
	<h2 class="text-center mb-3">GRAPH VIEW</h2>
	<?php 
		$graph = new Graph();

		$data = generate_daily_data($today_records);

		if (empty($data)) {
			$graph->title = "Today's sales: No sales data available for today.";
			$graph->display([]);
		} else {
			$graph->title = "Today's sales";
			$graph->xtitle = "Hours of the day";
			$graph->styles = "width:80%;margin:auto;display:block";
			$graph->display($data);
			echo "<br>";
		}

		$data = generate_monthly_data($thismonth_records);
		if (empty($data)) {
			$graph->title = "This month's sales: No sales data available for this month.";
			$graph->display([]);
		} else {
			$graph->title = "This month's sales";
			$graph->xtitle = "Days of the month";
			$graph->styles = "width:80%;margin:auto;display:block";
			$graph->display($data);
			echo "<br>";
		}
		
		$data = generate_thisyear_data($thisyear_records);
		if (empty($data)) {
			$graph->title = "This year's sales: No sales data available for this year.";
			$graph->display([]);
		} else {
			$graph->title = "This year's sales";
			$graph->xtitle = "Months of the year";
			$graph->styles = "width:80%;margin:auto;display:block";
			$graph->display($data);
			echo "<br>";
		}

		$data = generate_yearly_data($all_records);
		if (empty($data)) {
			$graph->title = "Annual Sales: No sales data available.";
			$graph->display([]);
		} else {
			$graph->title = "Annual Sales";
			$graph->xtitle = "Years";
			$graph->styles = "width:80%;margin:auto;display:block";
			$graph->display($data);
			echo "<br>";
		}
	?>
<?php elseif($section == 'generate'):?>
	<div class="row justify-content-center md-10 mx-1 px-3 border-3 border-top border-bottom bottom-secondary">
		<div class="col-md-10 p-3">
			<div class="form-container">
				<h2 class="text-center mb-3">GENERATE SALES</h2>
				<form method="GET" class="row row-cols-lg-auto justify-content-center">
						<input type="hidden" name="pg" value="admin">
						<input type="hidden" name="tab" value="sales">
						<input type="hidden" name="s" value="generate">
					<div class="col-12">
						<div class="input-group">
						<label class="input-group-text" for="from_date">From:</label>
						<input class="form-control" name="from_date" type="date" id="from_date" value="<?=!empty($_GET['from_date']) ? $_GET['from_date']: date("Y-m-d")?>">
						</div>
					</div>

					<div class="col-12">
						<div class="input-group">
						<label class="input-group-text" for="to_date">To:</label>
						<input class="form-control" name="to_date" type="date" id="to_date" value="<?=!empty($_GET['to_date']) ? $_GET['to_date']: date("Y-m-d")?>">
						</div>
					</div>

					<div class="col-12">
						<button class="btn btn-primary">Generate</button>
					</div>
				</form>
			</div>
		</div>
    </div>

	<div class="row mt-4 table-responsive ">
        <div class="col-md-12 ">
			<?php if(!$SalesPerCategories && !$SalesPerProducts):?>
			<h3> No Sales For Today: <?= esc(date("M j, Y")); ?></h3>
			<?php else:?>
			<nav class="row row-cols-lg-auto g-3">
				<h4 class="col-12">SALES REPORT</h4>
				<button class="btn btn-success mb-2 col-12" onclick="printSalesTable()">Print Data</button>
			</nav>
			
			<div class="table-responsive border border-secondary border-3 rounded p-4" id="generateResult">
				
				<h5> Store: <?= esc(APP_NAME); ?></h6>
				<h6> <?= esc($TimePeriod); ?> </h6>
				<!-- Sales Per Category Table -->
				<table class="table table-striped table-hover" style="width:75%;">
					<thead class="table-light" style="position: sticky;top: 0">
						<tr>
							<th colspan="3">SALES PER CATEGORY: </th>
						</tr>
						<tr>
							<th>Category</th>
							<th>Gross QTY</th>
							<th>Gross Sales</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach($SalesPerCategories as $SalesPerCategory) :?>
							<?php $PerCategoryName = get_CategoryName($SalesPerCategory['category_id']) ?>
						<tr>
							<td><?= esc($PerCategoryName) ?></td>
							<td><?= esc($SalesPerCategory['gross_qty']) ?></td>
							<td>₱<?= esc($SalesPerCategory['gross_sales']) ?></td>
						</tr>
						<?php endforeach?>
						<?php foreach($TotalSales as $TotalSale) :?>
						<tr style="border-top:2px solid">
							<th>TOTAL: </th>
							<th><?= esc($TotalSale['total_grossqty']) ?></th>
							<th>₱<?= esc($TotalSale['total_grosssales']) ?></th>
						</tr>
						<?php endforeach?>
					</tbody>

				</table>
				<!-- Sales Per Product Table -->
				<table class="table table-striped table-hover">
					<thead class="table-light" style="position: sticky;top: 0">
						<tr>
							<th colspan="5">PRODUCTS LIST SOLD: </th>
						</tr>
						<tr>
							<th>Barcode</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Gross QTY</th>
							<th>Gross Sales</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach($SalesPerProducts as $SalesPerProduct) :?>
						<tr>
							<td><?= esc($SalesPerProduct['barcode']) ?></td>
							<td><?= esc($SalesPerProduct['description']) ?></td>
							<td><?= esc($SalesPerProduct['amount']) ?></td>
							<td><?= esc($SalesPerProduct['gross_qty']) ?></td>
							<td>₱<?= esc($SalesPerProduct['gross_sales']) ?></td>
						</tr>
						<?php endforeach?>
						<?php foreach($TotalSales as $TotalSale) :?>
						<tr style="border-top:2px solid">
							<th colspan="2"></th>
							<th>TOTAL: </th>
							<th><?= esc($TotalSale['total_grossqty']) ?></th>
							<th>₱<?= esc($TotalSale['total_grosssales']) ?></th>
						</tr>
						<?php endforeach?>
					</tbody>
				</table>

			</div>
			<?php endif; ?>
		</div>
	</div>
	<script>
        function printSalesTable() {
            window.print();
        }
    </script>

<?php endif;?>