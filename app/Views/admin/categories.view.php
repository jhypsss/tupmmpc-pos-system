<div class="table-responsive">
    <!-- Table section -->
    <table class="table table-striped table-hover">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>
				<a href="index.php?pg=category-new">
					<button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
				</a>
			</th>
        </tr>

        <?php if (!empty($categories)):?>
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
        <?php endif;?>
        
    </table>
</div>