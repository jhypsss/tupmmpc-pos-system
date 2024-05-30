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
<?php if (!empty($refunded_items)):?>
<div class="table-responsive" style="height: 500px;overflow-y: scroll;">
	<table class="table table-striped table-hover">
		<thead class="table-light" style="position: sticky;top: 0">
		<tr>
            <th style="background-color: #C23540; color: black;">Receipt No</th>
			<th style="background-color: #C23540; color: black;">Barcode</th>
			<th style="background-color: #C23540; color: black;">Description</th>
			<th style="background-color: #C23540; color: black;">Qty</th>
			<th style="background-color: #C23540; color: black;">Amount</th>
			<th style="background-color: #C23540; color: black;">Total</th>
			<th style="background-color: #C23540; color: black;">Status</th>
            <th style="background-color: #C23540; color: black;">Remarks</th>
            <th style="background-color: #C23540; color: black;">Encoder</th>
            <th style="background-color: #C23540; color: black;">Date | Time</th>
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
			<td><?=date("M j, Y, h:i:sa",strtotime($refunded_item['date']))?></td>

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
