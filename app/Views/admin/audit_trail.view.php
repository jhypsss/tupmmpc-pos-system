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
    .icon {
        font-size: 4em;
    }
    .btn-primary {
        border: none;
        color: white;
        width: 100px;
    }
    .btn-success {
        border: none;
        color: white;
        padding: 10px;
    }
    .btn-danger {
        border: none;
        color: white;
        padding: 10px;
    }
</style>
<?php if (!empty($audit_trails)):?>
    <input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;"><br><br>
<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
    <!-- Table section -->
    <table class="table table-striped table-hover">
    <thead class="table-red" style="position: sticky;top: 0; background-color: #C23540;">
        <tr>
            <th>Date | Time</th>
            <th>Initiator(User)</th>
            <th>Source</th>
            <th>Action</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        
            <?php foreach ($audit_trails as $audit_trail):?>
                <tr>
                    <td><?=date("M j, Y, h:ia",strtotime($audit_trail['date']))?></td>

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
        </tbody>
    </table>
    <?php else:?>
        <div class="task-roll-up">
            <i class="icon fas fa-file-alt"></i>
            <p class="no-items-message"> There's no record yet.</p>
        </div>
    <?php endif;?>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var searchInput = document.getElementById('searchInput');
        var tableRows = document.querySelectorAll('.table tbody tr');

        // Search functionality
        searchInput.addEventListener('keyup', function(event) {
            var query = event.target.value.toLowerCase();

            tableRows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                var found = false;

                Array.from(cells).forEach(function(cell) {
                    var cellText = cell.textContent.toLowerCase();
                    if (cellText.indexOf(query) > -1) {
                        found = true;
                    }
                });

                row.style.display = found ? '' : 'none';
            });
        });
    });
</script>
