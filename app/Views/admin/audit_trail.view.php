<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-striped table-hover">
    <thead class="table-red" style="position: sticky;top: 0; background-color: #f94449;">
        <tr>
            <th style="color: black;">Date | Time</th>
            <th style="color: black;">Initiator(User)</th>
            <th style="color: black;">Source</th>
            <th style="color: black;">Action</th>
            <th style="color: black;">Details</th>
        </tr>
        </thead>
        <tbody>
        <?php if (!empty($audit_trails)):?>
            <?php foreach ($audit_trails as $audit_trail):?>
                <tr>
                    <td><?=date("M j, Y, h:i a",strtotime($audit_trail['date']))?></td>

                    <?php 
                        $user = get_user_by_id($audit_trail['user_id']);
                        if(empty($user)){
                            $name = "Unknown";
                            $namelink = "#";
                        }else{
                            $name = $user['username'];
                            $namelink = "index.php?pg=profile&id=".$user['id'];
                        }
                    ?>
                    <td>
                        <a href="<?=$namelink?>">
                            <?=esc($name)?>
                        </a>
                    </td>
                    <td><?=esc($audit_trail['source'])?></td>
                    <td><?=esc($audit_trail['action'])?></td>
                    <td style="width:50%"><?=nl2br(esc($audit_trail['details']))?></td>

                    
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        </tbody>
    </table>
</div>