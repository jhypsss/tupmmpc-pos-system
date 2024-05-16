<input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;"><br>
<th>
    <a href="index.php?pg=product-new">
        <button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
    </a>
    <a href="index.php?pg=barcode.view">
        <button class="btn btn-success btn-sm"><i class="fa fa-barcode"></i> Barcode</button>
    </a>
</th>
<div class="table-responsive" style="height: 650px;overflow-y: scroll;">

    <!-- Table section -->
    <table class="table table-striped table-hover">
        <thead class="table-light" style="position: sticky;top: 0">
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
        </thead>
        <tbody>
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
                        <button class="btn btn-success btn-sm"><i class="fa fa-cog"></i></button>
                        </a>
                        <a href="index.php?pg=product-delete&id=<?=$product['id']?>">
                        <button class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                        </a>
                    </td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        </tbody>
    </table>
    <?php //$pager->display($totalProducts)?>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var searchInput = document.getElementById('searchInput');
        var tableRows = document.querySelectorAll('.table tbody tr');
        // Assuming the barcode is in the first column (index 0) and description is in the second column (index 1)
        var barcodeColumnIndex = 0;
        var descriptionColumnIndex = 1;

        // Search functionality
        searchInput.addEventListener('keyup', function(event) {
            var query = event.target.value.toLowerCase();

            tableRows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                var barcodeText = cells[barcodeColumnIndex].textContent.toLowerCase();
                var descriptionText = cells[descriptionColumnIndex].textContent.toLowerCase();
                
                if (barcodeText.indexOf(query) > -1 || descriptionText.indexOf(query) > -1) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    });
</script>