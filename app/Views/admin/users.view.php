<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
	<table class="table table-striped table-hover">
		<thead class="table-light" style="position: sticky;top: 0">
		<tr>
			<th>Image</th>
			<th>Name</th>
			<th>Gender</th>
			<th>Email</th>
			<th>Role</th>
			<th>Date Created</th>
			<th>
				<a href="index.php?pg=signup">
					<button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
				</a>
			</th>
		</tr>
		</thead>
		<tbody>

		<?php if (!empty($users)):?>
			<?php foreach ($users as $user):?>
	 		<tr>
				<td>
					<a href="index.php?pg=profile&id=<?=$user['id']?>">
					<img src="<?=crop($user['image'],400,$user['gender'])?>" style="width: 100%;max-width:100px;" >
					</a>
				</td>

				<td>
					<a href="index.php?pg=profile&id=<?=$user['id']?>">
						<?=esc($user['username'])?>
					</a>	
				</td>
				<td><?=esc($user['gender'])?></td>
				<td><?=esc($user['email'])?></td>
				<td><?=esc($user['role'])?></td>
				
				<td><?=date("M j, Y",strtotime($user['date']))?></td>
				<td>
					<a href="index.php?pg=edit-user&id=<?=$user['id']?>">
						<button class="btn btn-success btn-sm"><i class="fas fa-user-cog"></i></button>
					</a>
					<a href="index.php?pg=delete-user&id=<?=$user['id']?>">
						<button class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
					</a>
				</td>
			</tr>
			<?php endforeach;?>
		<?php endif;?>
		</tbody>
	</table>

	<?php //$pager->display($totalUsers)?>
</div>