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
    .table thead th {
        background-color: #C23540; 
        color: #fff;
    }
</style>

<!-- Table section -->
<?php if (!empty($categories)):?>
<div class="table-responsive" style="height: 600px; overflow-y: scroll;">
    <table class="table table-striped table-hover">
        <thead class="table-light" style="position: sticky; top: 0;">
            <tr>
                <th style="width:15%">Name</th>
                <th style="width:70%">Description</th>
                <th style="text-align:center;">
                    <a href="index.php?pg=category-new" class="btn btn-primary btn-sm">
                        <i class="fa fa-plus fa-fw style=font-size: 10px;" ></i>Add new
                    </a>
                </th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($categories as $category):?>
            <tr>
                <td><a href="index.php?pg=category-edit&id=<?=$category['id']?>">
                    <?=esc($category['name'])?></a>
                </td>
                <td><?=esc($category['description'])?></td>

                <td style="text-align:center;">
                    <a href="index.php?pg=category-edit&id=<?=$category['id']?>">
                        <button class="btn btn-success btn-sm"><i class="fa fa-cog"></i></button>
                    </a>
                    <a href="index.php?pg=category-delete&id=<?=$category['id']?>">
                        <button class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                    </a>
                </td>
            </tr>
        <?php endforeach;?>
        </tbody>
    </table>
    
    <?php else:?>
        <div class="task-roll-up">
            <i class="fa fa-table fa-fw icon"></i>
            <p class="no-items-message"> There are no categories to show.</p>
            <a href="index.php?pg=category-new" class="add-button btn btn-info">
                <i class="fa fa-plus fa-fw"></i> Add Category
            </a>
        </div>
    <?php endif;?>
</div>
