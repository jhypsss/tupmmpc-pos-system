<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-striped table-hover">
        <thead class="table-light" style="position: sticky;top: 0">
        <tr>
            <th>Date | Time</th>
            <th>Initiator(User)</th>
            <th>Source</th>
            <th>Action</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        <?php if (!empty($audit_trails)):?>
            <?php foreach ($audit_trails as $audit_trail):?>
                <tr>
                    <td><?=date("M j, Y \n H:i:s",strtotime($audit_trail['date']))?></td>

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
                    <td><?=nl2br(esc($audit_trail['details']))?></td>

                    
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        </tbody>
    </table>
</div>