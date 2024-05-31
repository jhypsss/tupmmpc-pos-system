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
</script>



<?php if (!empty($products)):?>
<div class="table-responsive">
    <a href="index.php?pg=product-new">
        <button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
    </a>
    <a href="index.php?pg=barcode.view">
        <button class="btn btn-secondary btn-sm"><i class="fa fa-barcode"></i> Barcode</button>
    </a>
    <input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;">
    <br>
    <br>
</div>


<div class="table-responsive" style="height: 600px;overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-responsive table-striped table-hover">
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
