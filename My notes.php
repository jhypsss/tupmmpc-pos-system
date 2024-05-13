Guide to create new Menu Dashboard
	1. Views/(view name folder)/(name.view.php) front end or html / css view
	2. Controller/(controller name.php) class
	3. Model/(model name.php) class extends model
	4. Views/admin/(filename.php) back end of html/css view
	
	5. \app\Core\model.php if it needs crud queries in db
	6. \app\Controllers\admin.php if it needs output queries in db


Access Roles
- admin = Admin Panel (All access), POS System
- supervisor = Admin Panel (Account Management, Categories, Products, Sales, Void Items, Audit Trail), Points-of-sale
- manager = Admin Panel (Categories, Products, Sales, Void Items), Points-of-sale
- cashier = Points-of-sale
- user (default) = no access in any parts of system functionalities (new user)


issues or bugs found.
- Access roles
- Quick Search in Products/Inventory = table header is hiding when searching
- Pagination


System Functions to do
- Product Categories✅
- Audit Trail✅
- Back Buttons when clicking Forms (add, edit, delete forms)
- Notification nav = Critical Stocks, Out of Stock
- Product Stocks must not be edited... Rather just Append or Add new Stocks
- Manage Roles (access roles)
- Void Items
- Supplier Informations

System Checking
- Receipt = need to show who's the encoder with date and time (will fix and modify soon)
- Generate Sales Report = Today's, Monthly, Annual (made by third party programmer - will migrate it to dashboard panel)

AUDIT TRAIL
USERS = ADD✅, UPDATE✅, DELETE✅
CATEGORIES = ADD✅, UPDATE✅, DELETE✅
PRODUCTS = ADD✅, UPDATE✅, DELETE✅
SUPPLIERS INFO = ADD, UPDATE, DELETE
SALES to VOID ITEMS



Categories
	<option>School Supplies</option>
	<option>Clothing</option>
	<option>Baked Goods</option>
	<option>Beverages</option>
	<option>Canned Goods</option>
	<option>Dairy Products</option>
	<option>Desserts</option>
	<option>Detergent</option>
	<option>Frozen Foods</option>
	<option>Fruits</option>
	<option>Grains</option>
	<option>Meat & Poultry</option>
	<option>Pasta & Noodles</option>
	<option>Sauces</option>
	<option>Seafood</option>
	<option>Snacks</option>
	<option>Vegetables</option>

	<!-- Add more options as needed -->