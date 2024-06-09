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
	
	.btn-primary {
        border: none;
        color: white;
        width: 100px;
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
    
    .icon {
        font-size: 4em;
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
    .sales-table thead th {
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

                if (cells.length >= 1) {
                    // Only search in the first column
                    for (var i = 0; i < 1; i++) {
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
    <a class="nav-link <?=($section =='table') ? 'active':''?>" aria-current="page" href="index.php?pg=admin&tab=sales">
	    List View
	</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <?=($section =='graph') ? 'active':''?>" href="index.php?pg=admin&tab=sales&s=graph">
	    Graph View
	</a>
  </li>
</ul>

<?php if($section == 'table'):?>

<?php if (!empty($sales)):?>
<div>
	<h5><?= date("l, M j, Y")?></h5>
	<input type="text" class="form-control" id="searchInput" placeholder="Search Receipt No..." style="width: 50%; float: right;">
	<h2> Today's Total: ₱<?=number_format($sales_total,2)?></h2>
</div>

<div class="table-responsive" style="height: 500px;overflow-y: scroll;">
    <table class="sales-table table table-striped table-hover">
        <thead class="table-light" style="position: sticky;top: 0">
            <tr>
                <th>Receipt No</th>
                <th>Barcode</th>
                <th>Description</th>
                <th>Qty</th>
                <th>Amount</th>
                <th>Total</th>
                <th>Encoder</th>
                <th colspan="2">Date | Time</th>           
            </tr>
        </thead>
        <tbody>
        <?php foreach ($sales as $sale):?>
            <tr>
                <td><?=esc($sale['receipt_no'])?></td>
                <td><?=esc($sale['barcode'])?></td>
                <td><?=esc($sale['description'])?></td>
                <td><?=esc($sale['qty'])?></td>
                <td><?=esc(number_format($sale['amount']))?></td>
                <td><?=esc(number_format($sale['total']))?></td>
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
        
                <td><?=date("M j, Y | h:i:sa",strtotime($sale['date']))?></td>
                <td>
                    <a href="index.php?pg=sale-refund&id=<?=$sale['id']?>">
                    <button class="btn btn-success btn-sm"><i class="fa fa-cog"></i></button>
                    </a>
                </td>
            </tr>
            <?php endforeach;?>
        
        </tbody>
    </table>
  
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

        $graph = new Graph(); // Resetting graph object for the next section

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
        
        $graph = new Graph(); // Resetting graph object for the next section

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

        $graph = new Graph(); // Resetting graph object for the next section

        $data = generate_yearly_data($all_records);
        if (empty($data)) {
            $graph->title = "Annual Sales: No sales data available.";
            $graph->display([]);
        } else {
            $graph->title = "Annual Sales";
            $graph->xtitle = "Years";
            $graph->styles = "width:80%;margin:auto;display:block";
            // Customizing graph display style for a more colorful design
            $graph->display($data);
            echo "<br>";
        }
    ?>

	

	

<?php endif;?>