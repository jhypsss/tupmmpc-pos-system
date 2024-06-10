<div class="table-responsive row justify-content-center p-3">
    <?php if (Auth::access('Admin')):?>
    <div class="col-md-3 border rounded p-4 my-2 m-2 text-center dashboard-card blue-gradient">
        <i class="fa fa-user icon"></i>
        <h4>Total Users:</h4>
        <h1><?=number_format($total_users)?></h1>
    </div>
    
    <?php else:?>
    <div class="col-md-3 border rounded p-4 my-2 m-2 text-center dashboard-card green-gradient">
        <i class="fa fa-table icon"></i>
        <h4>Categories:</h4>
        <h1><?=number_format($total_category)?></h1>
    </div>
    <div class="col-md-3 border rounded p-4 my-2 m-2 text-center dashboard-card cyan-gradient">
        <i class="fa fa-truck icon"></i>
        <h4>Suppliers:</h4>
        <h1><?=number_format($total_suppliers)?></h1>
    </div> 
    <div class="col-md-3 border rounded p-4 my-2 m-2 text-center dashboard-card yellow-gradient">
        <i class="fa fa-hamburger icon"></i>
        <h4>Total Products:</h4>
        <h1><?=number_format($total_products)?></h1>
    </div>
    <div class="col-md-3 border rounded p-4 my-2 m-2 text-center dashboard-card red-gradient">
        <i class="fa fa-money-bill-wave icon"></i>
        <h4>Total Sales:</h4>
        <h1>₱<?=number_format($total_sales)?></h1>
    </div>
    <?php endif; ?>
</div>


<style>
    .dashboard-card {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s, box-shadow 0.2s;
        color: black; /* Ensure text color is black */
    }
    .dashboard-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }
    .dashboard-card i {
        margin-bottom: 10px;
        font-size: 30px;
        color: black; /* Ensure icon color is black */
    }
    .dashboard-card h4, .dashboard-card h1 {
        color: black; /* Ensure headings color is black */
    }
    .dashboard-card h4 {
        font-size: 1.2rem;
        margin-top: 10px;
    }
    .dashboard-card h1 {
        font-size: 2.5rem;
        margin-top: 5px;
    }

    /* Gradient backgrounds for cards */
    .blue-gradient {
        background: linear-gradient(135deg, #007bff, #00c6ff);
    }
    .green-gradient {
        background: linear-gradient(135deg, #28a745, #7dffa4);
    }
    .yellow-gradient {
        background: linear-gradient(135deg, #ffc107, #ffd971);
    }
    .red-gradient {
        background: linear-gradient(135deg, #dc3545, #ff6b6b);
    }
    .cyan-gradient {
        background: linear-gradient(135deg, #17a2b8, #71d6e5);
    }
</style>