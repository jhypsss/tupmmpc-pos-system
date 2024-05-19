<?php
	$productClass = new Product();
	$stocks = $productClass->query("SELECT * FROM products WHERE if_deleted=0 AND (stock <= 20 OR stock = 0)");
	$stocksCount = $productClass->query("SELECT COUNT(*) AS count FROM products WHERE if_deleted=0 AND (stock <= 20 OR stock = 0)");
	$role = Auth::get('role');
?>

<nav class="navbar navbar-expand-lg navbar-light" style="min-width:350px; background-color: #ffdddd; ">
	  <div class="container-fluid">
		
	  	<?php if ($role=='Supervisor' || $role=='Manager' || $role=='Cashier' || $role=='User'):?>
				<a class="navbar-brand" href="index.php?pg=home" style="font-family:Verdana; font-weight:bold;">
		<?php else: ?>
				<a class="navbar-brand" href="index.php?pg=admin" style="font-family:Verdana; font-weight:bold;">
		<?php endif ?>
					<img src="assets/images/logo.png" style="width:100%;max-width:50px;margin:0 10px;" >
					<?=esc(APP_NAME)?>
				</a>

	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		  	<?php if ($role=='Admin'):?>

					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="index.php?pg=admin">Admin Panel</a>
					</l>

			<?php elseif (($role=='Supervisor' || $role=='Manager')):?>
					<li class="nav-item">
						<a class="nav-link active" href="index.php?pg=home">Point-of-Sale</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="index.php?pg=admin">Admin Panel</a>
					</li>
					
			<?php elseif ($role=='Cashier'):?>
					<li class="nav-item">
						<a class="nav-link active" href="index.php?pg=home">Point-of-Sale</a>
					</li>
			<?php endif ?>
		        
	        <?php if(Auth::access('Admin')):?>
		        <li class="nav-item">
		          <a class="nav-link" href="index.php?pg=signup">Create User</a>
		        </li>
		    <?php endif;?>

			

		    <?php if(!Auth::logged_in()):?>
		        <li class="nav-item">
		          <a class="nav-link" href="index.php?pg=login">Log In</a>
		        </li>
	        <?php else:?>
			<?php if($role!='User'):?>
				<li class="nav-item">
					<?php if (!empty($stocks)):?>
						<a href="" class="nav-link" data-toggle="modal" data-target="#notifModal" style="color:#cc0000">
						<b><i class="fas fa-bell"></i>(<?php echo $stocksCount[0]['count'];?>)!</a></b>
					<?php else:?>
						<a href="" class="nav-link" data-toggle="modal" data-target="#notifModal">
						<b><i class="fas fa-bell"></i>(0)</a></b>
					<?php endif;?>
		        </li>
			<?php endif;?>
		        <li class="nav-item dropdown">
		          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            Hi, <?=auth('username')?> (<?=(Auth::get('role'))?>)
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="index.php?pg=profile">Profile</a></li>
		            <li><a class="dropdown-item" href="index.php?pg=edit-user&id=<?=Auth::get('id')?>">Profile-Settings</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="index.php?pg=logout">Log Out</a></li>
		          </ul>
		        </li>
	    	 <?php endif;?>

	      </ul>
	    </div>
	  </div>
	</nav>

	<!--Notification Modal-->
	<div class="modal fade" id="notifModal" tabindex="-1" aria-labelledby="notifModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="notifModalLabel"><i class="fas fa-bell"></i> Notification</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<?php if (empty($stocks)):?>
				<h5 class="modal-title" id="notifModalLabel"><center><i class="fas fa-bell"></i>
				<br>No Notification Here</center></h5>
			<?php else:?>
				<h5 class="modal-title" id="notifModalLabel">Critical Item Stocks</h5>
				<table class="table table-striped table-hover">
				<tr>
					<th>Image</th>
					<th>Item</th>
					<th>Status</th>
				</tr>
					</a>
					<?php foreach ($stocks as $stock):?>
						<?php if ($stock['stock'] == 0): $msg = "Out of Stock!"?>
							<tr class="alert alert-danger" role="alert">
						<?php else: $msg = "Low Stock!"?>
							<tr class="alert alert-warning" role="alert">
						<?php endif;?>
								<td>
									<img src="<?=($stock['image'])?>" style="width:100%;max-width:75px;" >
								</td>
								<td>Item: <?=esc($stock['barcode'])?><br>
									Name: <?=esc($stock['description'])?><br>
									Stock Level: <b><?=esc($stock['stock'])?></b></b><br>
								</td>
								<td><b><?=esc($msg)?></b></td>

							</tr>
					<?php endforeach;?>
        		
				</table>
			<?php endif;?>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>