<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-striped table-hover">
        <thead class="table-light" style="position: sticky;top: 0">
        <tr>
            <th>Date Deleted</th>
            <th>From:</th>
            <th>Deleted Info</th>
            <th>Removed by:</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <?php if (!empty($deleted_items)):?>
            
            <?php foreach ($deleted_items as $deleted_item):?>
                <tr>
                    <td><?=date("M j, Y - h:i a",strtotime($deleted_item['date_deleted'])) ?></td>
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
                        <?php elseif($deleted_item['from_table']=='Suppliers'):?>
                            Company Name: <b><?= esc($deleted_details['company_name']) ?></b><br>
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
                        <!--
                            <button class="btn btn-success btn-sm"><i class="fas fa-cog"></i></button>
                            <button onclick="delete_btn()" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                        -->
                    </td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        </tbody>
    </table>
</div>