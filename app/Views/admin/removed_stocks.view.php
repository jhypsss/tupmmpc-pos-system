<style>
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
    .table thead th {
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

                Array.from(cells).forEach(function(cell) {
                    var cellText = cell.textContent.toLowerCase();
                    if (cellText.indexOf(query) > -1) {
                        found = true;
                    }
                });

                row.style.display = found ? '' : 'none';
            });
        });
    });
</script>
<?php if (!empty($lists)):?>
    <input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;">
    <br>
    <br>
<div class="table-responsive" style="height: 500px;overflow-y: scroll;">
	<table class="table table-striped table-hover">
		<thead class="table-light" style="position: sticky;top: 0">
		<tr>
			<th>Barcode</th>
			<th>Product Name</th>
			<th>Price</th>
			<th>Removed Qty</th>
            <th>Initiator</th>
			<th>Status</th>
			<th>Remarks</th>
            <th>Date Removed</th>
		</tr>
		</thead>
		<tbody>
	 	<tr>
		<?php foreach ($lists as $list): ?>
            <?php
                $productrow = get_productRow($list['product_id']); ?>
			<td><?= esc($productrow['barcode']); ?></td>
			<td><?= esc($productrow['description']); ?></td>
			<td><?= esc($productrow['amount']); ?></td>
			<td><?= esc($list['removed_qty']); ?></td>
            <?php 
                $removedby = get_user_by_id($list['user_id']);
                if(empty($removedby)){
                    $name = "Unknown";
                    $namelink = "#";
                }else{
                    $name = $removedby['username'];
                    $namelink = "index.php?pg=profile&id=".$removedby['id'];
                }
            ?>
            <td>
                <a href="<?=$namelink?>">
                    <?=esc($name)?>
                </a>
            </td>
			<td><?= esc($list['status']); ?></td>
            <td><?= esc($list['remarks']); ?></td>
            <td><?=date("M j, Y - h:i a",strtotime($list['date'])) ?></td>
            
		</tr>
		<?php endforeach;?>
		</tbody>
		
	</table>
	<?php else:?>
        <div class="task-roll-up">
            <i class="icon fas fa-minus-square"></i>
            <p class="no-items-message"> There are no records to show.</p>
        </div>
    <?php endif;?>
	
</div>
