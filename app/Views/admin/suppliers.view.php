<input type="text" class="form-control" id="searchInput" placeholder="Search..." style="width: 50%; float: right;"><br><br>
<div class="table-responsive" style="height: 650px;overflow-y: scroll;">
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
        </tbody>
    </table>
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

