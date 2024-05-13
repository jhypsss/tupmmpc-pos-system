<?php
// If editing, fetch supplier details
$id = isset($_GET['id']) ? $_GET['id'] : '';
$supplier_name = '';
$contact_person = '';
$contact_number = '';
$email = '';
$business_type = '';

if ($id != '') {
    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'pos_db');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Fetch supplier details from database
    $sql = "SELECT * FROM supplier WHERE id = $id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $supplier_name = $row['supplier_name'];
        $contact_person = $row['contact_person'];
        $contact_number = $row['contact_number'];
        $email = $row['email'];
        $business_type = $row['business_type'];
    }

    $conn->close();
}
?>

<div class="modal-header">
    <h5 class="modal-title" id="supplierModalLabel"><?php echo ($id != '') ? 'Edit Supplier' : 'Add Supplier'; ?></h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <form id="supplierForm">
        <input type="hidden" name="id" value="<?php echo $id; ?>">
        <div class="form-group">
            <label for="supplier_name">Supplier Name</label>
            <input type="text" class="form-control" id="supplier_name" name="supplier_name" value="<?php echo $supplier_name; ?>" required>
        </div>
        <div class="form-group">
            <label for="contact_person">Contact Person</label>
            <input type="text" class="form-control" id="contact_person" name="contact_person" value="<?php echo $contact_person; ?>" required>
        </div>
        <div class="form-group">
            <label for="contact_number">Contact Number</label>
            <input type="text" class="form-control" id="contact_number" name="contact_number" value="<?php echo $contact_number; ?>" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<?php echo $email; ?>" required>
        </div>
        <div class="form-group">
            <label for="business_type">Business Type</label>
            <select class="form-control" id="business_type" name="business_type" required>
                <option value="Distributor" <?php if ($business_type == 'Distributor') echo 'selected'; ?>>Distributor</option>
                <option value="Wholesale" <?php if ($business_type == 'Wholesale') echo 'selected'; ?>>Wholesale</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary"><?php echo ($id != '') ? 'Update' : 'Add'; ?></button>
    </form>
</div>
