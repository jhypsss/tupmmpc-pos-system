<?php require views_path('partials/header');?>

<div style="color:#444">
	<center class="p-2"><h4><i class="fa fa-user-shield"></i> Admin Panel</h4></center>
	<div class="container-fluid row">
		<div class="col-12 col-sm-4 col-md-3 col-lg-2">
			<ul class="list-group">
				<a href="index.php?pg=admin&tab=dashboard">
			  		<li class="list-group-item <?=!$tab || $tab == 'dashboard'?'active':''?>" ><i class="fa fa-th-large"></i> Dashboard</li>
			  	</a>
			  	<a href="index.php?pg=admin&tab=users">
			  		<li class="list-group-item <?=$tab=='users'?'active':''?>"><i class="fa fa-users"></i> Users</li>
				</a>
				<a href="index.php?pg=admin&tab=categories">
			  		<li class="list-group-item <?=$tab=='categories'?'active':''?>"><i class="fa fa-table"></i> Categories</li>
				</a>
			  	<a href="index.php?pg=admin&tab=products">
			  		<li class="list-group-item <?=$tab=='products'?'active':''?>"><i class="fa fa-hamburger"></i> Products</li>
				</a>
				<a href="index.php?pg=admin&tab=suppliers">
			  		<li class="list-group-item <?=$tab=='suppliers'?'active':''?>"><i class="fa fa-truck"></i> Suppliers</li>
				</a>
				<a href="index.php?pg=admin&tab=sales">
			  		<li class="list-group-item <?=$tab=='sales'?'active':''?>"><i class="fa fa-money-bill-wave"></i> Sales</li>
				</a>
				<a href="index.php?pg=admin&tab=returned items">
			  		<li class="list-group-item <?=$tab=='returned_items'?'active':''?>"><i class="fas fa-undo-alt"></i> Returned Items</li>
				</a>
				<a href="index.php?pg=admin&tab=audit trail">
			  		<li class="list-group-item <?=$tab=='audit trail'?'active':''?>"><i class="fas fa-file-alt"></i> Audit Trail</li>
				</a>
			  	<a href="index.php?pg=logout">
			  		<li class="list-group-item"><i class="fa fa-sign-out-alt"></i> Log Out</li>
				</a>
			</ul>
		</div>
		<div class="border col p-3">
			
			<h4><?=strtoupper($tab)?></h4>

			<?php  

				switch ($tab) {
					case 'users':
						// code...
						require views_path('admin/users');
						break;

					case 'categories':
						// code...
						require views_path('admin/categories');
						break;

					case 'products':
						// code...
						require views_path('admin/products');
						break;

					case 'suppliers':
						// code...
						require views_path('admin/suppliers');
						break;

					case 'sales':
						// code...
						require views_path('admin/sales');
						break;
					
					case 'returned items':
						// code...
						require views_path('admin/returned_items');
						break;

					case 'audit trail':
						// code...
						require views_path('admin/audit_trail');
						break;

					case 'barcode':
						// code...
						require views_path('admin/barcode');
						break;
					
					default:
						// code...
						require views_path('admin/dashboard');
						break;
				}
			?>
		</div>
	</div>
</div>
<?php require views_path('partials/footer');?>