<div class="table-responsive">
    <!-- Table section -->
    <table class="table table-striped table-hover">
        <tr>
            <th>Date Deleted</th>
            <th>From:</th>
            <th>Deleted Element</th>
            <th>Deleter</th>
            <th>Action</th>
        </tr>
        

        <?php if (!empty($deleted_items)):?>
            
            <?php foreach ($deleted_items as $deleted_item):?>
                <tr>
                    <td><?=date("M j, Y \n H:i:s",strtotime($deleted_item['date_deleted'])) ?></td>
                    <td><?=strtoupper(esc($deleted_item['from_table']))?></td>
                    <?php
                        $deleted_details = get_deleted_details($deleted_item['deleted_id'], $deleted_item['from_table']);
                    ?>

                    <td>
                        <?php if($deleted_item['from_table']=='Users'):?>
                            User: <b><?= esc($deleted_details['username']) ?></b>
                        <?php elseif($deleted_item['from_table']=='Categories'):?>
                            Category Name: <b><?= esc($deleted_details['name']) ?></b>
                        <?php elseif($deleted_item['from_table']=='Products'):?>
                            Product: <b><?= esc($deleted_details['barcode']) ?></b><br>
                            Product Name: <b><?= esc($deleted_details['description']) ?></b>
                        <?php endif?>
                    </td>


                    <?php
                        $deleted_item = get_user_by_id($deleted_item['user_id']);
                        if(empty($deleted_item)){
                            $deleter = "Unknown User";
                            $namelink = "#";
                        }else{
                            $deleter = $deleted_item['username'];
                            $namelink = "index.php?pg=profile&id=".$deleted_item['id'];
                        }
                    ?>
                    <td><a href="<?=esc($namelink)?>"><?=esc($deleter)?></a></td>
                    <td>
                        <a href="index.php?pg=#&id=<?=$deleted_item['id']?>">
                            <button class="btn btn-secondary btn-sm">Restore</button>
                        </a>
                    </td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        
    </table>
</div>