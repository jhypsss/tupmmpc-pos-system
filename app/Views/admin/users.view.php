<div class="table-responsive" style="height: 650px; overflow-y: scroll;">
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

        <?php if (!empty($users)):?>
            <?php foreach ($users as $user):?>
            <tr>
                <td>
                    <a href="index.php?pg=profile&id=<?=$user['id']?>">
                        <img src="<?=crop($user['image'],400,$user['gender'])?>" style="width: 100%; max-width: 100px; border-radius: 50%;">
                    </a>
                </td>
                <td style="border-right: 1px solid #ddd;">
                    <a href="index.php?pg=profile&id=<?=$user['id']?>" style="text-decoration: none;">
                        <span style="color: black;"><?=esc($user['username'])?></span>
                    </a>    
                </td>
                <td style="border-right: 1px solid #ddd;"><?=esc($user['gender'])?></td>
                <td style="border-right: 1px solid #ddd;"><?=esc($user['email'])?></td>
                <td style="border-right: 1px solid #ddd;"><?=esc($user['role'])?></td>
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
</style>
