<?php if (!empty($users)):?>
<div class="table-responsive" style="height: 650px; overflow-y: scroll;">
<input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;"><br><br>
    <table class="table table-striped table-hover">
        <thead style="position: sticky; top: 0; background-color: #000; color: white;">
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


            <?php foreach ($users as $user):?>
            <tr>
                <td>
                    <a href="index.php?pg=profile&id=<?=$user['id']?>">
                        <img src="<?=crop($user['image'],400,$user['gender'])?>" style="width: 100%; max-width: 100px; border-radius: 50%;">
                    </a>
                </td>
                <td>
                    <a href="index.php?pg=profile&id=<?=$user['id']?>">
                        <span style="font-weight:bold"><?=esc($user['username'])?></span>
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
        </tbody>
    </table>

    <?php //$pager->display($totalUsers)?>
</div>
</div>
    <?php else:?>
        <div class="task-roll-up">
            <i class="fa fa-truck fa-fw icon"></i>
            <p class="no-items-message"> There are no users to show.</p>
            <a href="index.php?pg=supplier-new">
                <button class="btn btn-primary btn"><i class="fa fa-plus fa-fw"></i> Add User</button>
            </a>
        </div>
    <?php endif;?>
</div>

<style>
    .table-responsive {
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .table-hover tbody tr:hover {
        background-color: #f1f1f1;
    }
    .table-striped tbody tr:nth-of-type(odd) {
        background-color: #f9f9f9;
    }
    .table-striped tbody tr:nth-of-type(even) {
        background-color: #e9e9e9;
    }
    .table thead th {
        text-align: center;
        background-color: #C23540; 
        color: #fff;
    }
    .table tbody td {
        text-align: center;
        vertical-align: middle;
    }
    .table tbody img {
        border-radius: 50%;
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
    a {
        color: #f94449;
    }
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

                if (cells.length >= 1) {
                    // Only search in the first column
                    for (var i = 0; i <= 2; i++) {
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
