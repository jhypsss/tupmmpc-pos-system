<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link <?=($section =='inventory') ? 'active':''?>" href="index.php?pg=admin&tab=generate reports&s=inventory">
	    Inventory Report
	</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <?=($section =='sales') ? 'active':''?>" href="index.php?pg=admin&tab=generate reports&s=sales">
	    Generate Sales Report
	</a>
  </li>
</ul>


<?php if($section == 'inventory'):?>
    <div class="row justify-content-center mt-3 md-10 mx-1 px-3 border-3 border-top border-bottom bottom-secondary">
		<div class="col-md-10 p-3">
			<div class="form-container">
				<h2 class="text-center mb-3">INVENTORY REPORT</h2>
				<form method="GET" class="row row-cols-lg-auto justify-content-center">
						<input type="hidden" name="pg" value="admin">
						<input type="hidden" name="tab" value="generate reports">
						<input type="hidden" name="s" value="inventory">
					<div class="col-12 mx-2">
						<div class="input-group">
						<label class="input-group-text" for="from_date">From:</label>
						<input class="form-control" name="from_date" type="date" id="from_date" value="<?=!empty($_GET['from_date']) ? $_GET['from_date']: date("Y-m-d")?>">
						</div>
					</div>

					<div class="col-12 mx-2">
						<div class="input-group">
						<label class="input-group-text" for="to_date">To:</label>
						<input class="form-control" name="to_date" type="date" id="to_date" value="<?=!empty($_GET['to_date']) ? $_GET['to_date']: date("Y-m-d")?>">
						</div>
					</div>

					<div class="col-12 mx-2">
						<button class="btn btn-primary">Generate</button>
					</div>
				</form>
			</div>
		</div>
    </div>

    <div class="row mt-4 table-responsive ">
        <div class="col-md-12 ">
			
        <?php if(!$StocksPerCategories && !$StocksInventory):?>
			<h3> No Records for <?= esc($TimePeriod); ?></h3>
			<?php else:?>
			<nav class="row row-cols-lg-auto mb-3 mx-auto">
                <h4 class="col-12">RESULT: </h4>
                <button class="btn btn-success col-12 mx-3 px-3" onclick="printSalesTable()">Print Data</button>
			</nav>        
            <div class="table-responsive border border-secondary border-3 rounded p-4" id="generateResult">
                <h2 class="mb-3" style="text-align:Center;">INVENTORY REPORT</h2>
				<h5> Store: <?= esc(APP_NAME); ?></h5>
				<h6> <?= esc($TimePeriod); ?> </h6>
                <!-- Stocks Inventory Per Category -->
				<table class="table table-striped table-hover mx-auto" style="width:70%;">
					<thead class="table-light">
						<tr>
							<th colspan="4">STOCKS INVENTORY PER CATEGORY: </th>
						</tr>
						<tr>
							<th>Category</th>
							<th>Stock-IN</th>
							<th>Stock-OUT</th>
                            <th>Current Stocks</th>
						</tr>
					</thead>
					<tbody>
                        <?php foreach($StocksPerCategories as $StocksPerCategory) :?>
							<td><?= esc($StocksPerCategory['name']) ?></td>
							<td><?= esc(number_format($StocksPerCategory['stock_in_qty'])) ?></td>
							<td><?= esc(number_format($StocksPerCategory['stock_out_qty']))?></td>
                            <td>
                                <?php $CurrentStocks = get_CurrentStock($StocksPerCategory['category_id']); ?>
                                <?= esc(number_format($CurrentStocks['current_stocks']))?>
                            </td>
						</tr>
						<?php endforeach?>
                        <?php foreach($TotalInventory as $TotalInv) :?>
						<tr style="border-top:2px solid">
							<th>TOTAL: </th>
							<th><?= esc(number_format($TotalInv['total_stock_in'])) ?></th>
							<th><?= esc(number_format($TotalInv['total_stock_out']))?></th>
                            <th><?= esc(number_format($TotalCurrentStocks[0]['total_current_stocks']))?></th>
						</tr>
						<?php endforeach?>
					</tbody>

				</table>
				<!-- Per Product Table -->
				<table class="table table-striped table-hover mx-auto" style="width:85%;">
					<thead class="table-light" style="position: sticky;top: 0">
						<tr>
							<th colspan="5">PRODUCT STOCKS INVENTORY: </th>
						</tr>
						<tr>
							<th>Barcode</th>
							<th>Product Name</th>
							<th>Stock-IN</th>
							<th>Stock-OUT</th>
                            <th>Current Stocks</th>
						</tr>
					</thead>
					<tbody>
                    <?php foreach($StocksInventory as $row) :?>
                        <tr>
                            <td><?= esc($row['barcode']) ?></td>
                            <td><?= esc($row['description']) ?></td>
                            <td><?= esc(number_format($row['stock_in_qty'])) ?></td>
                            <td><?= esc(number_format($row['stock_out_qty'])) ?></td>
                            <td><?= esc(number_format($row['stock'])) ?></td>
                        </tr>
                    <?php endforeach?>
                    <?php foreach($TotalInventory as $TotalInv) :?>
						<tr style="border-top:2px solid">
                            <th colspan="1"></th>
							<th>TOTAL: </th>
							<th><?= esc(number_format($TotalInv['total_stock_in'])) ?></t h>
							<th><?= esc(number_format($TotalInv['total_stock_out']))?></th>
                            <th><?= esc(number_format($TotalCurrentStocks[0]['total_current_stocks']))?></th>
						</tr>
					<?php endforeach?>
					</tbody>
				</table>

			</div>
        <?php endif;?>
		</div>
	</div>

    <?php elseif($section == 'sales'):?>
	<div class="row justify-content-center mt-3 md-10 mx-1 px-3 border-3 border-top border-bottom bottom-secondary">
		<div class="col-md-10 p-3">
			<div class="form-container">
				<h2 class="text-center mb-3">GENERATE SALES</h2>
				<form method="GET" class="row row-cols-lg-auto justify-content-center">
                        <input type="hidden" name="pg" value="admin">
						<input type="hidden" name="tab" value="generate reports">
						<input type="hidden" name="s" value="sales">
					<div class="col-12 mx-2">
						<div class="input-group">
						<label class="input-group-text" for="from_date">From:</label>
						<input class="form-control" name="from_date" type="date" id="from_date" value="<?=!empty($_GET['from_date']) ? $_GET['from_date']: date("Y-m-d")?>">
						</div>
					</div>

					<div class="col-12 mx-2">
						<div class="input-group">
						<label class="input-group-text" for="to_date">To:</label>
						<input class="form-control" name="to_date" type="date" id="to_date" value="<?=!empty($_GET['to_date']) ? $_GET['to_date']: date("Y-m-d")?>">
						</div>
					</div>

					<div class="col-12 mx-2">
						<button class="btn btn-primary">Generate</button>
					</div>
				</form>
			</div>
		</div>
    </div>

	<div class="row mt-4 table-responsive ">
        <div class="col-md-12 ">
			<?php if(!$SalesPerCategories && !$SalesPerProducts && !$RefundPerProducts):?>
			<h3> No Sales For <?= esc($TimePeriod); ?></h3>
			<?php else:?>
				<nav class="row row-cols-lg-auto mb-3 mx-auto">
    		<h4 class="col-12">RESULT: </h4>
    		<button class="btn btn-success col-12 mx-3 px-3" onclick="printSalesTable()">Print Data</button>
			</nav>
			
			<div class="table-responsive border border-secondary border-3 rounded p-4" id="generateResult">
				<h2 class="mb-3" style="text-align:Center;">SALES REPORT</h2>
				<h5> Store: <?= esc(APP_NAME); ?></h5>
				<h6> <?= esc($TimePeriod); ?> </h6>
				<!-- Sales Per Category Table -->
                <?php if(!empty($SalesPerCategories) && !empty($TotalSales)): ?>
				<table class="table table-striped table-hover mx-auto mb-4" style="width:50%;">
					<thead class="table-light">
						<tr>
							<th colspan="3" style="width: 2in">SALES PER CATEGORY: </th>
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
							<td><?= esc(number_format($SalesPerCategory['gross_qty'])) ?></td>
							<td style="text-align:right;"><?= esc(number_format($SalesPerCategory['gross_sales']))?></td>
						</tr>
						<?php endforeach?>
						<?php foreach($TotalSales as $TotalSale) :?>
						<tr style="border-top:2px solid">
							<th>TOTAL: </th>
							<th><?= esc(number_format($TotalSale['total_grossqty'])) ?></th>
							<th style="width:1.2in; text-align:right;">₱<?= esc(number_format($TotalSale['total_grosssales']))?></th>
						</tr>
						<?php endforeach?>
					</tbody>
				</table>
                <?php endif; ?>
				<!-- Sales Per Product Table -->
                <?php if(!empty($SalesPerCategories) && !empty($TotalSales)): ?>
				<table class="table table-striped table-hover mx-auto" style="width:90%;">
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
							<td><?= esc(number_format($SalesPerProduct['amount'])) ?></td>
							<td><?= esc(number_format($SalesPerProduct['gross_qty'])) ?></td>
							<td style="width:1.2in; text-align:right;"><?= esc(number_format($SalesPerProduct['gross_sales'])) ?></td>
						</tr>
						<?php endforeach?>
						<?php foreach($TotalSales as $TotalSale) :?>
						<tr style="border-top:2px solid">
							<th colspan="2"></th>
							<th>TOTAL: </th>
							<th><?= esc($TotalSale['total_grossqty']) ?></th>
							<th style="width:1.2in; text-align:right;">₱<?= esc(number_format($TotalSale['total_grosssales'])) ?></th>
						</tr>
						<?php endforeach?>
                    </tbody>
                </table>
                <?php endif; ?>

                <!-- Refunded Items Per Product Table -->
                <?php if(!empty($RefundPerProducts) && !empty($TotalRefunds)): ?>  
				<table class="table table-striped table-hover mx-auto" style="width:90%;">
					<thead class="table-light" style="position: sticky;top: 0">
						<tr>
							<th colspan="5">REFUNDED ITEMS: </th>
						</tr>
						<tr>
							<th>Barcode</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Refund QTY</th>
							<th>Refunded Amount</th>
						</tr>
					</thead>
					<tbody>
                    <?php foreach($RefundPerProducts as $RefundPerProduct) :?>
						<tr>
							<td><?= esc($RefundPerProduct['barcode']) ?></td>
							<td><?= esc($RefundPerProduct['description']) ?></td>
							<td><?= esc(number_format($RefundPerProduct['amount'])) ?></td>
							<td><?= esc(number_format($RefundPerProduct['refunded_qty'])) ?></td>
							<td style="width:1in; text-align:right;"><?= esc(number_format($RefundPerProduct['refunded_amount'])) ?></td>
						</tr>
						<?php endforeach?>
                        <?php foreach($TotalRefunds as $TotalRefund) :?>
						<tr style="border-top:2px solid">
							<th colspan="2"></th>
							<th>TOTAL: </th>
							<th><?= esc($TotalRefund['refunded_qty']) ?></th>
							<th style="width:1in; text-align:right;">₱<?= esc(number_format($TotalRefund['refunded_amount'])) ?></th>
						</tr>
						<?php endforeach?>
                    </tbody>
                </table>
                <?php endif; ?>

			</div>
			<?php endif; ?>
		</div>
	</div>
    
<?php endif;?>

<style>
    @media print {
		@page {
			size: legal;
		}
		body * {
			visibility: hidden;
            color:black;
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
        #generateResult .table{
            width: 100%;
        }
		
	}
</style>

<script>
    function printSalesTable() {
        window.print();
    }
</script>