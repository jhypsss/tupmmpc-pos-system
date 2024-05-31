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
<?php if (!empty($lists)):?>
<div class="table-responsive" style="height: 500px;overflow-y: scroll;">
	<table class="table table-striped table-hover">
		<thead class="table-light" style="position: sticky;top: 0">
		<tr>
            <th>Date Removed</th>
			<th>Barcode</th>
			<th>Product Name</th>
			<th>Price</th>
			<th>Removed Qty</th>
			<th>Status</th>
			<th>Remarks</th>
            <th>Encoder</th>
            
		</tr>
		</thead>
		<tbody>
	 	<tr>
		<?php foreach ($lists as $list): ?>
            <td><?=date("M j, Y - h:i a",strtotime($list['date'])) ?></td>
            <?php
                $productrow = get_productRow($list['product_id']); ?>
			<td><?= esc($productrow['barcode']); ?></td>
			<td><?= esc($productrow['description']); ?></td>
			<td><?= esc($productrow['amount']); ?></td>
			<td><?= esc($list['removed_qty']); ?></td>
			<td><?= esc($list['status']); ?></td>
            <td><?= esc($list['remarks']); ?></td>
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
		</tr>
		<?php endforeach;?>
		</tbody>
		
	</table>
	<?php else:?>
        <div class="task-roll-up">
            <i class="fa fa-undo-alt"></i>
            <p class="no-items-message"> There are no records to show.</p>
        </div>
    <?php endif;?>
	
</div>
