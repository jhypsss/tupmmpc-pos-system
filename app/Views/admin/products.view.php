<style>
    @media print {
		@page {
			size: 8.5in 11in;
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
    .btn-success {
        border: none;
        color: white;
        padding: 10px;
    }
    .btn-danger {
        border: none;
        color: white;
        padding: 10px;
    }
    
    .fa-fw {
        font-size: 1em;
        margin-right: 5px;
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
    .icon {
        font-size: 4em;
    }
    .list-table thead th {
        background-color: #C23540; 
        color: #fff;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var searchInput = document.getElementById('searchInput');
        var tableRows = document.querySelectorAll('.table tbody tr');

        // Search functionality
        searchInput.addEventListener('keyup', function(event) {
            var query = event.target.value.toLowerCase();

            tableRows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                var found = false;

                if (cells.length >= 2) {
                    // Only search in the first and second columns
                    for (var i = 0; i < 2; i++) {
                        var cellText = cells[i].textContent.toLowerCase();
                        if (cellText.indexOf(query) > -1) {
                            found = true;
                            break;
                        }
                    }
                }

                row.style.display = found ? '' : 'none';
            });
        });
    });

    function printSalesTable() {
        window.print();
    }
</script>

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link <?=($section =='table') ? 'active':''?>" aria-current="page" href="index.php?pg=admin&tab=products">
	    List View
	</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <?=($section =='inventory') ? 'active':''?>" href="index.php?pg=admin&tab=products&s=inventory">
	    Inventory Report
	</a>
  </li>
</ul>
<?php if($section == 'table'):?>


<?php if (!empty($products)):?>
<div class="table-responsive" style="height: 600px;overflow-y: scroll;">
<div class="mt-3">
    <a href="index.php?pg=product-new">
        <button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
    </a>
    <a href="index.php?pg=barcode.view">
        <button class="btn btn-secondary btn-sm"><i class="fa fa-barcode"></i> All Barcodes</button>
    </a>
    <input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;">
    <br>
    <br>
</div>
    <!-- Table section -->
    <table class="list-table table table-responsive table-striped table-hover">
        <thead class="table-light" style="position: sticky;top: 0">
            <tr>
                <th>Barcode</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Stock</th>
                <th>Price</th>
                <th>Image</th>
                <th>Date Created</th>
                <th>Encoder</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($products as $product):
                $get_category = get_CategoryName($product['category_id']); ?>
                <tr>
                    <td><?=esc($product['barcode'])?></td>
                    <td>
                        <a href="index.php?pg=product-edit&id=<?=$product['id']?>">
                            <?=esc($product['description'])?>
                        </a>    
                    </td>
                    <td>
                        <?=esc($get_category)?>
                    </td>
                    <td>
                        <?php 
                        // Check if stock is exactly 0
                        if ($product['stock'] == 0): ?>
                            <!-- Display in red -->
                            <span style="color: red; font-weight: bold;">
                                <?= esc($product['stock']) ?>
                            </span>
                        <?php elseif ($product['stock'] >= 10 && $product['stock'] <= 20): ?>
                            <!-- Display in orange -->
                            <span style="color: orange; font-weight: bold;">
                                <?= esc($product['stock']) ?>
                            </span>
                        <?php elseif ($product['stock'] < 10): ?>
                            <!-- Display in orange -->
                            <span style="color: red; font-weight: bold;">
                                <?= esc($product['stock']) ?>
                            </span>
                        <?php else: ?>
                            <?= esc($product['stock']) ?>
                        <?php endif; ?>
                    </td>
                    <td><?=esc($product['amount'])?></td>
                    <td>
                        <img src="<?=($product['image'])?>" style="width: 100%;max-width:100px;" >
                    </td>
                    <td><?=date("M j, Y",strtotime($product['date']))?></td>
                    <?php 
                        $cashier = get_user_by_id($product['user_id']);
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
                    <td>
                        <a href="index.php?pg=product-edit&id=<?=$product['id']?>">
                        <button class="btn btn-success btn-sm"><i class="fa fa-cog"></i></button>
                        </a>
                        <a href="index.php?pg=product-delete&id=<?=$product['id']?>">
                        <button class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                        </a>
                    </td>
                </tr>
                <?php endforeach;?>
        </tbody>
    </table>
    
    <?php //$pager->display($totalProducts)?>
    <?php else:?>
        <div class="task-roll-up">
            <i class="fa fa-hamburger fa-fw icon"></i>
            <p class="no-items-message"> There are no products to show.</p>
            <a href="index.php?pg=product-new" class="add-button btn btn-info">
                <i class="fa fa-plus fa-fw"></i> Add Product
            </a>
        </div>
    <?php endif;?>
</div>


<?php elseif($section == 'inventory'):?>
    <div class="row justify-content-center mt-3 md-10 mx-1 px-3 border-3 border-top border-bottom bottom-secondary">
		<div class="col-md-10 p-3">
			<div class="form-container">
				<h2 class="text-center mb-3">INVENTORY REPORT</h2>
				<form method="GET" class="row row-cols-lg-auto justify-content-center">
						<input type="hidden" name="pg" value="admin">
						<input type="hidden" name="tab" value="products">
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
							<th><?= esc(($TotalInv['total_stock_out']))?></th>
                            <th><?= esc(($TotalCurrentStocks[0]['total_current_stocks']))?></th>
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
					</tbody>
				</table>

			</div>
        <?php endif;?>
		</div>
	</div>
    
<?php endif;?>