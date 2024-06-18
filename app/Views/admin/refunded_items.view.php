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

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link <?=($section =='list') ? 'active':''?>" aria-current="page" href="index.php?pg=admin&tab=refunded items">
	    Pending List
	</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <?=($section =='completed') ? 'active':''?>" href="index.php?pg=admin&tab=refunded items&s=completed">
	    Completed List
	</a>
  </li>
</ul>

<?php if($section == 'list'):?>
<br>
<?php if (!empty($refunded_items)):?>
<div class="table-responsive" class="mt-3" style="height: 500px;overflow-y: scroll;">
	<table class="table table-striped table-hover">
		<thead class="table-light" style="position: sticky;top: 0">
		<tr>
            <th style="width:10%">Receipt No.</th>
			<th>Barcode</th>
			<th>Description</th>
			<th>Qty</th>
			<th>Amount</th>
			<th>Total</th>
			<th>Status</th>
            <th>Remarks</th>
            <th>Encoder</th>
            <th>Date Refunded</th>
			<th>Action</th>
		</tr>
		</thead>
		<tbody>
	 	<tr>
		<?php foreach ($refunded_items as $refunded_item): ?>

			<td><?=esc($refunded_item['receipt_no'])?></td>
			<td><?=esc($refunded_item['barcode'])?></td>
			<td><?=esc($refunded_item['description'])?></td>
			<td><?=esc($refunded_item['qty'])?></td>
			<td><?=esc($refunded_item['amount'])?></td>
			<td><?=esc($refunded_item['total'])?></td>
			<td><?=esc($refunded_item['status'])?></td>
			<td><?=esc($refunded_item['remarks'])?></td>
			<?php 
				$encoder = get_user_by_id($refunded_item['user_id']);
				if(empty($encoder)){
					$name = "Unknown";
					$namelink = "#";
				}else{
					$name = $encoder['username'];
					$namelink = "index.php?pg=profile&id=".$encoder['id'];
				}
			?>
			<td>
				<a href="<?=$namelink?>">
					<?=esc($name)?>
				</a>
			</td>
			<td><?=date("M j, Y, h:ia",strtotime($refunded_item['date']))?></td>
			<td>
				<a href="index.php?pg=refund-action&id=<?=$refunded_item['product_id']?>">
					<button class="btn btn-success btn-sm"><i class="fa fa-cog"></i></button>
				</a>
			</td>

		</tr>
		<?php endforeach;?>
		</tbody>
		
	</table>
	<?php else:?>
        <div class="task-roll-up">
            <i class="icon fa fa-undo-alt"></i>
            <p class="no-items-message"> There are no records to show.</p>
        </div>
    <?php endif;?>
	
</div>

<?php elseif($section == 'completed'):?>
	<br>
	<?php if (!empty($completed_items)):?>
		<div class="table-responsive" class="mt-3" style="height: 500px;overflow-y: scroll;">
		<table class="table table-striped table-hover">
				<thead class="table-light" style="position: sticky;top: 0">
				<tr>
					<th style="width:10%">Receipt No.</th>
					<th>Barcode</th>
					<th>Description</th>
					<th>Qty</th>
					<th>Amount</th>
					<th>Total</th>
					<th>Status</th>
					<th>Remarks</th>
					<th>Action</th>
					<th>Decision by</th>
					<th>Date Completed</th>
				</tr>
				</thead>
				<tbody>
				<tr>
				<?php foreach ($completed_items as $completed_item): ?>

					<td><?=esc($completed_item['receipt_no'])?></td>
					<td><?=esc($completed_item['barcode'])?></td>
					<td><?=esc($completed_item['description'])?></td>
					<td><?=esc($completed_item['qty'])?></td>
					<td><?=esc($completed_item['amount'])?></td>
					<td><?=esc($completed_item['total'])?></td>
					<td><?=esc($completed_item['status'])?></td>
					<td><?=esc($completed_item['remarks'])?></td>
					<td width="10%"><b><?=esc($completed_item['action_taken'])?></b></td>
					<?php 
						$encoder = get_user_by_id($completed_item['by_user_id']);
						if(empty($encoder)){
							$name = "Unknown";
							$namelink = "#";
						}else{
							$name = $encoder['username'];
							$namelink = "index.php?pg=profile&id=".$encoder['id'];
						}
					?>
					<td>
						<a href="<?=$namelink?>">
							<?=esc($name)?>
						</a>
					</td>
					<td><?=date("M j, Y, h:ia",strtotime($completed_item['date_completed']))?></td>

				</tr>
				<?php endforeach;?>
				</tbody>
				
			</table>
			<?php else:?>
				<div class="task-roll-up">
					<i class="icon fa fa-undo-alt"></i>
					<p class="no-items-message"> There are no records to show.</p>
				</div>
	<?php endif;?>
			
		</div>
<?php endif;?>