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
	
	.fa-fw {
	font-size: 1em;
	margin-right: 5px;
	}
	
	.icon {
	font-size: 4em;
	}
</style>

    <!-- Table section -->
<?php if (!empty($categories)):?>
<div class="table-responsive" style="height: 600px;overflow-y: scroll;">
    <table class="table table-striped table-hover">
        <thead class="table-light" style="position: sticky;top: 0">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>
				<a href="index.php?pg=category-new">
					<button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
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

                <td>
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
            <a href="index.php?pg=category-new">
                <button class="btn btn-primary btn"><i class="fa fa-plus fa-fw"></i> Add Category</button>
            </a>
        </div>
    <?php endif;?>
</div>

