
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
	    Generate Sales View
	</a>
  </li>
  
</ul>

<br>

<?php if($section == 'table'):?>
<!--
<a href="../app/views/admin/sales_report.php"><button style="background-color: orange; border-radius: 5px;  color: white; border-color: white; padding: 7px;">SALES REPORTS</button></a>
-->
<div>
	<form class="row float-end" >
			<div class="col">
				<label for="start">Start Date:</label>
				<input class="form-control" id="start" type="date" name="start" value="<?=!empty($_GET['start']) ? $_GET['start']:''?>">
			</div>
			<div class="col">
				<label for="end">End Date:</label>
				<input class="form-control" id="end" type="date" name="end" value="<?=!empty($_GET['end']) ? $_GET['end']:''?>">
			</div>
			<div class="col">
				<label for="limit">Rows:</label>
				<input style="max-width: 80px" class="form-control" id="limit" type="number" min="1" name="limit" value="<?=!empty($_GET['limit']) ? $_GET['limit']:'20'?>">
			</div>
			
			<button style="max-width:50px" class="btn col btn-primary btn-sm">Go <i class="fa fa-chevron-right"></i></button>
			<input type="hidden" name="pg" value="admin">
			<input type="hidden" name="tab" value="sales">
	</form>
	<div class="clearfix" ></div>
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
		<?php if (!empty($sales)):?>
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
		<?php endif;?>
		</tbody>
	</table>

<?php
		$pager->display($totalSales);
?>
</div>

<?php elseif($section == 'graph'):?>
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


<?php endif;?>