

<?php
// Check if any products were returned
/*if (!empty($stocks)): ?>
    <button id="toggleAlerts" class="btn btn-secondary mb-3">Show Notif</button>
        <a href="../app/views/admin/supplier.php"><button class="btn btn-secondary mb-3" id="openSupplierBtn">Suppliers</button></a>
        <input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;">
    <div id="alertsContainer" style="display: none;">
        <?php foreach ($stocks as $stock): ?>
            <?php if ($stock['stock'] == 0): ?>
                <div class="alert alert-danger" role="alert">
                    <strong>Out of Stock:</strong> Product <?= esc($stock['description']) ?> is out of stock!
                </div>
            <?php else: ?>
                <div class="alert alert-warning" role="alert">
                    <strong>Warning:</strong> Product <?= esc($stock['description']) ?> has reached the critical level! Current stock: <b><?= esc($stock['stock']) ?></b>
                </div>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>
<?php endif; 
*/?>

<div class="table-responsive"></div>

<th>
    <a href="index.php?pg=product-new">
        <button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
    </a>
    <a href="index.php?pg=barcode.view">
        <button class="btn btn-primary btn-sm"><i class="fa fa-barcode"></i> Barcode</button>
    </a>
</th>


    <!-- Table section -->
    <table class="table table-striped table-hover">
        <tr>
            <th>Barcode</th>
            <th>Product</th>
            <th>Category</th>
            <th>Stock</th>
            <th>Price</th>
            <th>Image</th>
            <th>Date Created</th>
            <th>Encoder</th>
            <th>Action</th>
        </tr>

        <?php if (!empty($products)):?>
            <?php foreach ($products as $product):?>
                <tr>
                    <td><?=esc($product['barcode'])?></td>
                    <td>
                        <a href="index.php?pg=product-edit&id=<?=$product['id']?>">
                            <?=esc($product['description'])?>
                        </a>    
                    </td>
                    <td>
                            <?=esc($product['category'])?>
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
                            <button class="btn btn-success btn-sm">Edit</button>
                        </a>
                        <a href="index.php?pg=product-delete&id=<?=$product['id']?>">
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </a>
                    </td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        
    </table>
    <?php //$pager->display($totalProducts)?>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var toggleButton = document.getElementById('toggleAlerts');
        var alertsContainer = document.getElementById('alertsContainer');
        var searchInput = document.getElementById('searchInput');
        var tableRows = document.querySelectorAll('.table tbody tr');
        var tableHeader = document.querySelector('.table thead tr');

        // Toggle visibility of alerts
        toggleButton.addEventListener('click', function() {
            if (alertsContainer.style.display === 'none') {
                alertsContainer.style.display = 'block';
                toggleButton.innerText = 'Hide Notif'; // Change button text to "Hide Notif" when alerts are shown
            } else {
                alertsContainer.style.display = 'none';
                toggleButton.innerText = 'Show Notif'; // Change button text to "Show Notif" when alerts are hidden
            }
        });

        // Search functionality
        searchInput.addEventListener('keyup', function(event) {
            var query = event.target.value.toLowerCase();

            tableRows.forEach(function(row, index) {
                if (index !== 1) { // Skip header row
                    var cells = row.getElementsByTagName('td');
                    var found = false;

                    Array.from(cells).forEach(function(cell) {
                        var cellText = cell.textContent.toLowerCase();
                        if (cellText.indexOf(query) > -1) {
                            found = true;
                        }
                    });

                    if (found) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                }
            });
        });
    });
</script>