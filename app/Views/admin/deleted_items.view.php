<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-striped table-hover">
    <thead class="table-red" style="position: sticky;top: 0; background-color: #f94449;">
        <tr>
            <th style="color: black;">Date Deleted</th>
            <th style="color: black;">From:</th>
            <th style="color: black;">Deleted Info</th>
            <th style="color: black;">Removed by:</th>
            <th style="color: black;">Action</th>
        </tr>
        </thead>
        <tbody>
        <?php if (!empty($deleted_items)):?>
            
            <?php foreach ($deleted_items as $deleted_item):?>
                <tr>
                    <td><?=date("M j, Y - h:i a",strtotime($deleted_item['date_deleted'])) ?></td>
                    <td><?=strtoupper(esc($deleted_item['from_table']))?></td>
                    <?php
                        $deleted_details = get_details($deleted_item['deleted_id'], $deleted_item['from_table']);
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
                        $deleter_id = get_user_by_id($deleted_item['user_id']);
                        if(empty($deleter_id)){
                            $deleter = "Unknown User";
                            $namelink = "#";
                        }else{
                            $deleter = $deleter_id['username'];
                            $namelink = "index.php?pg=profile&id=".$deleter_id['id'];
                        }
                    ?>
                    <td><a href="<?=esc($namelink)?>"><?=esc($deleter)?></a></td>
                    <td>
                        <a href="index.php?pg=<?=strtolower($deleted_item['from_table'])?>-restore&id=<?=$deleted_item['deleted_id']?>">
                        <button class="btn btn-success btn-sm"><i class="fas fa-trash-restore-alt"></i></button>
                        </a>
                    </td>
                            
                        <!--
                            <button onclick="delete_btn()" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                        -->
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        </tbody>
    </table>
</div>