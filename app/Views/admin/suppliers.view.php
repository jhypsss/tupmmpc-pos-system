<div class="table-responsive">
    <!-- Table section -->
    <table class="table table-striped table-hover">
        <tr>
            <th>Company Name</th>
            <th>Company Address</th>
            <th>Contact Person</th>
            <th>Contact Number</th>
            <th>Email</th>
            <th>Business Type</th>

            <th>
				<a href="index.php?pg=supplier-new">
					<button class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add new</button>
				</a>
			</th>
        </tr>

        <?php if (!empty($suppliers)):?>
            <?php foreach ($suppliers as $supplier):?>
                <tr>
                    <td><a href="index.php?pg=supplier-edit&id=<?=$supplier['id']?>">
                        <?=esc($supplier['company_name'])?></a>
                    </td>
                    <td><?=esc($supplier['company_address'])?></td>
                    <td><?=esc($supplier['contact_person'])?></td>
                    <td><?=esc($supplier['contact_number'])?></td>
                    <td><?=esc($supplier['contact_email'])?></td>
                    <td><?=esc($supplier['business_type'])?></td>

                    <td>
                        <a href="index.php?pg=supplier-edit&id=<?=$supplier['id']?>">
                        <button class="btn btn-success btn-sm"><i class="fa fa-cog"></i></button>
                        </a>
                        <a href="index.php?pg=supplier-delete&id=<?=$supplier['id']?>">
                        <button class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                        </a>
                    </td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        
    </table>
</div>