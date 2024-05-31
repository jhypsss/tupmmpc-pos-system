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
        text-align: center;
        background-color: #C23540; 
        color: #fff;
    }
    .button-container {
        display: flex;
        gap: 5px;
    }
</style>



<?php if (!empty($suppliers)):?>
    <input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;"><br><br>
    <div class="table-responsive" style="height: 650px; overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-striped table-hover">
        <thead class="table-red" style="position: sticky; top: 0; background-color: #C23540;">
        <tr>
            <th>Company Name</th>
            <th style="width:15%;">Company Address</th>
            <th>Contact Person</th>
            <th>Contact No</th>
            <th>Email</th>
            <th style="width:15%;">Business Type</th>
            <th>
                <a href="index.php?pg=supplier-new">
                    <button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
                </a>
            </th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($suppliers as $supplier): ?>
            <tr>
                <td><a href="index.php?pg=supplier-edit&id=<?= $supplier['id'] ?>"><?= esc($supplier['company_name']) ?></a></td>
                <td><?= esc($supplier['company_address']) ?></td>
                <td><?= esc($supplier['contact_person']) ?></td>
                <td><?= esc($supplier['contact_number']) ?></td>
                <td><?= esc($supplier['contact_email']) ?></td>
                <td><?= esc($supplier['business_type']) ?></td>
                <td>
                    <div class="button-container">
                        <a href="index.php?pg=supplier-edit&id=<?= $supplier['id'] ?>">
                            <button class="btn btn-success btn-sm"><i class="fa fa-cog"></i></button>
                        </a>
                        <a href="index.php?pg=supplier-delete&id=<?= $supplier['id'] ?>">
                            <button class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                        </a>
                    </div>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
    <?php else:?>
        <div class="task-roll-up">
            <i class="fa fa-truck fa-fw icon"></i>
            <p class="no-items-message"> There are no suppliers to show.</p>
            <a href="index.php?pg=supplier-new">
                <button class="btn btn-primary btn"><i class="fa fa-plus fa-fw"></i> Add Supplier</button>
            </a>
        </div>
    <?php endif;?>
</div>
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

                Array.from(cells).forEach(function(cell) {
                    var cellText = cell.textContent.toLowerCase();
                    if (cellText.indexOf(query) > -1) {
                        found = true;
                    }
                });

                row.style.display = found ? '' : 'none';
            });
        });
    });
</script>

