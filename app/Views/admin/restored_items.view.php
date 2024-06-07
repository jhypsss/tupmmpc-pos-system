<style>
    .table thead th {
        background-color: #C23540; 
        color: #fff;
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

    .fa-fw {
        font-size: 1em;
        margin-right: 5px;
    }
    
    .icon {
        font-size: 4em;
    }
</style>
<?php if (!empty($restored_items)):?>
<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-striped table-hover">
        <thead class="table-red" style="position: sticky;top: 0; background-color: #C23540;">
        <tr>
            <th>Date Restored</th>
            <th>From:</th>
            <th>Restored Info</th>
            <th colspan="2">Restored by:</th>
        </tr>
        </thead>
        <tbody>
            <?php foreach ($restored_items as $restored_item):?>
                <tr>
                    <td><?=date("M j, Y - h:i a",strtotime($restored_item['date_restored'])) ?></td>
                    <td><?=strtoupper(esc($restored_item['from_table']))?></td>
                    <?php
                        $restored_details = get_details($restored_item['restored_id'], $restored_item['from_table']);
                    ?>

                    <td>
                        <?php if($restored_item['from_table']=='Users'):?>
                            User: <b><?= esc($restored_details['username']) ?></b>
                        <?php elseif($restored_item['from_table']=='Categories'):?>
                            Category Name: <b><?= esc($restored_details['name']) ?></b>
                        <?php elseif($restored_item['from_table']=='Products'):?>
                            Product: <b><?= esc($restored_details['barcode']) ?></b><br>
                            Product Name: <b><?= esc($restored_details['description']) ?></b>
                        <?php elseif($restored_item['from_table']=='Suppliers'):?>
                            Company Name: <b><?= esc($restored_details['company_name']) ?></b><br>
                        <?php endif?>
                    </td>


                    <?php
                        $restored_item = get_user_by_id($restored_item['user_id']);
                        if(empty($restored_item)){
                            $deleter = "Unknown User";
                            $namelink = "#";
                        }else{
                            $deleter = $restored_item['username'];
                            $namelink = "index.php?pg=profile&id=".$restored_item['id'];
                        }
                    ?>
                    <td><a href="<?=esc($namelink)?>"><?=esc($deleter)?></a></td>
                            
                        <!--
                            <button onclick="delete_btn()" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                        -->
                </tr>
            <?php endforeach;?>
        </tbody>
    </table>
    <?php else:?>
        <div class="task-roll-up">
            <i class="icon fas fa-trash-restore-alt"></i>
            <p class="no-items-message"> There are no records to show.</p>
        </div>
    <?php endif;?>
</div>