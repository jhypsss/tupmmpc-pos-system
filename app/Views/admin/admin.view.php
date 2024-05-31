<style>
    .admin-panel {
        color: #444;
        margin-top: 20px;
    }
    .admin-panel .list-group-item {
        border: 1px solid #ddd; /* Add border */
        border-radius: 10px; /* Round the corners */
        margin-bottom: 0.5px; /* Add smaller spacing between items */
        margin: 0 15px;
        padding: 15px;
        transition: background-color 0.3s, color 0.3s;
        background-color: whit; /* Background color for list items */
        font-weight:bold;
    }
    .admin-panel .list-group-item > .icon{
        width: 30px;
        font-size: 20px;
    }
    .admin-panel .list-group-item.active {
        background-color: #C23540;
        border-color:#C23540;
        color: white;
    }
    .admin-panel .list-group-item:hover,
    .admin-panel .list-group-item:focus {
        background-color: #F69697;
        color: white;
    }
    .admin-panel .list-group-item i {
        margin-right: 8px;
    }
    .admin-panel .container-fluid {
        padding: 0;
    }
    .admin-panel .col-12 {
        padding: 0;
    }
    .admin-panel h4 {
        color: #010101;
    }
</style>

<?php require views_path('partials/header'); ?>
<div class="admin-panel" style="color:#444">
    <div class="container-fluid row">
        <div class="col-12 col-sm-4 col-md-3 col-lg-2 bg-light">
            <ul class="list-group">
                <a href="index.php?pg=admin&tab=dashboard">
                    <li class="list-group-item <?=!$tab || $tab == 'dashboard'?'active':''?>" ><i class="icon fa fa-th-large"></i> Dashboard</li>
                </a>
                <a href="index.php?pg=admin&tab=users">
                    <li class="list-group-item <?=$tab=='users'?'active':''?>"><i class="icon fa fa-users"></i> Users</li>
                </a>
                <a href="index.php?pg=admin&tab=categories">
                    <li class="list-group-item <?=$tab=='categories'?'active':''?>"><i class="icon fa fa-table"></i> Categories</li>
                </a>
                <a href="index.php?pg=admin&tab=products">
                    <li class="list-group-item <?=$tab=='products'?'active':''?>"><i class="icon fa fa-hamburger"></i> Products</li>
                </a>
                <a href="index.php?pg=admin&tab=suppliers">
                    <li class="list-group-item <?=$tab=='suppliers'?'active':''?>"><i class="icon fa fa-truck"></i> Suppliers</li>
                </a>
                <a href="index.php?pg=admin&tab=sales">
                    <li class="list-group-item <?=$tab=='sales'?'active':''?>"><i class="icon fa fa-money-bill-wave"></i> Sales</li>
                </a>
				<a href="index.php?pg=admin&tab=removed stocks">
			  		<li class="list-group-item <?=$tab=='removed stocks'?'active':''?>"><i class="icon fas fa-minus-square"></i> Removed Stocks</li>
				</a>
                <a href="index.php?pg=admin&tab=refunded items">
                    <li class="list-group-item <?=$tab=='refunded items'?'active':''?>"><i class="icon fas fa-undo-alt"></i> Refunded Items</li>
                </a>
                <a href="index.php?pg=admin&tab=audit trail">
                    <li class="list-group-item <?=$tab=='audit trail'?'active':''?>"><i class="icon fas fa-file-alt"></i> Audit Trail</li>
                </a>
                <a href="index.php?pg=admin&tab=deleted items">
                    <li class="list-group-item <?=$tab=='deleted items'?'active':''?>"><i class="icon fas fa-trash-alt"></i> Deleted Items</li>
                </a>
                <a href="index.php?pg=admin&tab=restored items">
                    <li class="list-group-item <?=$tab=='restored items'?'active':''?>"><i class="icon fas fa-trash-restore-alt"></i> Restored Items</li>
                </a>
                <a href="index.php?pg=logout">
                    <li class="list-group-item"><i class="icon fa fa-sign-out-alt"></i> Log Out</li>
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

					case 'sales':
						// code...
						require views_path('admin/sales');
						break;
					case 'removed stocks':
						// code...
						require views_path('admin/removed_stocks');
						break;
						
					case 'refunded items':
						// code...
						require views_path('admin/refunded_items');
						break;
					
					case 'suppliers':
						// code...
						require views_path('admin/suppliers');
						break;

					case 'audit trail':
						// code...
						require views_path('admin/audit_trail');
						break;

					case 'deleted items':
						// code...
						require views_path('admin/deleted_items');
						break;
					
					case 'restored items':
						// code...
						require views_path('admin/restored_items');
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
>>>>>>> devs
</div>

<?php require views_path('partials/footer'); ?>
