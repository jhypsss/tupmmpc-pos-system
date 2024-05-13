<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="my-4">Supplier Management</h1>
        <a href="../../../public/index.php?pg=admin&tab=products"><button class="btn btn-secondary mb-3" id="">Dashboard</button></a>
        <button class="btn btn-primary mb-3" id="addBtn">Add Supplier</button>
        <table class="table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Contact Person</th>
                    <th>Contact Number</th>
                    <th>Email</th>
                    <th>Business Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="supplierTable">
                <!-- Supplier data will be inserted here -->
            </tbody>
        </table>
    </div>

    <!-- Modal for Add/Edit Supplier -->
    <div class="modal fade" id="supplierModal" tabindex="-1" aria-labelledby="supplierModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Content will be loaded dynamically using AJAX -->
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            // Load supplier list on page load
            loadSupplierList();

            // Function to load supplier list
            function loadSupplierList() {
                $.ajax({
                    url: 'get_suppliers.php',
                    type: 'GET',
                    success: function(data) {
                        $('#supplierTable').html(data);
                    }
                });
            }

            // Add Supplier Modal
            $('#addBtn').click(function() {
                $('#supplierModal .modal-content').load('add_edit_supplier_form.php', function() {
                    $('#supplierModal').modal('show');
                });
            });

            // Edit Supplier Modal
            $('#supplierTable').on('click', '.editBtn', function() {
                var id = $(this).data('id');
                $('#supplierModal .modal-content').load('add_edit_supplier_form.php?id=' + id, function() {
                    $('#supplierModal').modal('show');
                });
            });

            // Handle form submission for adding and updating suppliers
            $(document).on('submit', '#supplierForm', function(event) {
                event.preventDefault();
                var formData = $(this).serialize();
                $.ajax({
                    url: 'add_edit_supplier.php',
                    type: 'POST',
                    data: formData,
                    success: function(response) {
                        alert(response);
                        $('#supplierModal').modal('hide');
                        loadSupplierList();
                    }
                });
            });

            // Delete Supplier
            $('#supplierTable').on('click', '.deleteBtn', function() {
                if (confirm('Are you sure you want to delete this supplier?')) {
                    var id = $(this).data('id');
                    $.ajax({
                        url: 'delete_supplier.php?id=' + id,
                        type: 'GET',
                        success: function(data) {
                            loadSupplierList();
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
