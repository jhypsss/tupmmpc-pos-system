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

    // Add/Edit Supplier Modal
    $('#addBtn').click(function() {
        $('#supplierModal .modal-content').load('add_edit_supplier_form.php', function() {
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
