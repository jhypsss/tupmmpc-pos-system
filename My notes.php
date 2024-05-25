Guide to create new Menu Dashboard
	1. Views/(view name folder)/(name.view.php) front end or html / css view
	2. Controller/(controller name.php) class
	3. Model/(model name.php) class extends model
	4. Views/admin/(filename.php) back end of html/css view
	
	5. \app\Core\model.php if it needs crud queries in db
	6. \app\Controllers\admin.php if it needs output queries in db


Access Roles
✅ admin = Admin Panel (All access), POS System
- supervisor = Admin Panel (Categories, Products, Sales, Suppliers, Refunded Items, Audit Trail)
- manager = Admin Panel (Categories, Products, Sales, Suppliers, Refunded Items), Points-of-sale
✅ cashier = Points-of-sale
✅ user (default) = no access in any parts of system functionalities (new user)


issues or bugs found.
- Access roles
- Quick Search in Products/Inventory = table header is hiding when searching
✅ Quick Search in Suppliers
- Pagination
✅ receipt no in print receipt. not accurate to the db
- input tags autocomplete="off"
- print receipt no (not accurate receipt #)
- barcode must be unique... when adding/editing product, need check to database if the barcode is already exist


System Functions to do
✅ Product Categories
✅ Audit Trail
- Back Buttons when clicking Forms (add, edit, delete forms)
✅ Notification nav = Critical Stocks, Out of Stock 
✅ Deleted Items Functionality
✅ Product Stocks must not be edited... Rather just Append or Add new Stocks
- Manage Roles (access roles)
- Refunded Items
✅ Supplier Informations
- date_modified : Users, Products, 
✅ Receipt Preview
✅ Not Available Items must also show in POS
✅ orange color if low stocks in POS 
✅ Generate Sales Report


System Checking
✅ Receipt = need to show who's the encoder with date and time (will fix and modify soon)
✅ Generate Sales Report = Today's, Monthly, Annual (made by third party programmer - will migrate it to dashboard panel)

New Ideas:
- Tallying Today's Sales per User/Cashier

AUDIT TRAIL:
USERS = ADD✅, UPDATE✅, DELETE✅
CATEGORIES = ADD✅, UPDATE✅, DELETE✅
PRODUCTS = ADD✅, UPDATE✅, DELETE✅
SUPPLIERS INFO = ADD✅, UPDATE✅, DELETE✅
SALES to REFUNDED ITEMS

Llyle:
✅ POS : deleted items is showed and searched.
✅ POS : Limit by 20
✅ Clear All Items ("Please Enter A Code to Clear Items")
✅ UPDATE: Click VOID msg: "Please Enter a Code."
✅ Delete Item (Deleted at Products but not deleted at POS)
✅ Sales Time ("not accurate")