<style>
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
	
	.add-button {
	padding: 10px 20px;
	background-color: #0078d7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
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



<?php if (!empty($suppliers)):?>
    <input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;"><br><br>
<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
        <?php foreach ($suppliers as $supplier):?>
    <!-- Table section -->
    <table class="table table-striped table-hover">
        <thead class="table-light" style="position: sticky;top: 0">
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
        </thead>
        <tbody>
        
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
        </tbody>
    </table>
    <?php endforeach;?>
    <?php else:?>
        <div class="task-roll-up">
            <i class="fa fa-truck fa-fw icon"></i>
            <p class="no-items-message"> There are no suppliers to show.</p>
            <a href="index.php?pg=supplier-new">
                <button class="btn btn-primary btn"><i class="fa fa-plus fa-fw"></i> Add Supplier</button>
            </a>
        </div>
    <?php endif;?>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

