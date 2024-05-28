<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-striped table-hover">
    <thead class="table-red" style="position: sticky;top: 0; background-color: #f94449;">
        <tr>
            <th style="color: black;">Date Restored</th>
            <th style="color: black;">From:</th>
            <th style="color: black;">Restored Info</th>
            <th style="color: black;" colspan="2">Restored by:</th>
        </tr>
        </thead>
        <tbody>
        <?php if (!empty($restored_items)):?>
            
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
        <?php endif;?>
        </tbody>
    </table>
</div>

<script>
function restore_btn() {
  let text = "Restore ?.";
  if (confirm(text) == true) {
    text = "You pressed OK!";
  } else {
    text = "You canceled!";
  }
  document.getElementById("demo").innerHTML = text;
}
</script>