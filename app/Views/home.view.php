<?php
$conn = new Database();
// Retrieve void_code values from the database
$sql = "SELECT void_code FROM users";
$results = $conn->query($sql);

// Initialize an array to store void_code values
$void_codes = array();

if (!empty($results)) {
    // Fetch each row and store void_code in the array
    foreach($results as $result){
        $void_codes[] = $result['void_code'];
    }
}
?>

<?php require views_path('partials/header');?>
	<style>
		
		.hide{
			display: none;
		}

		@keyframes appear{

			0%{opacity: 0;transform: translateY(-100px);}
			100%{opacity: 1;transform: translateY(0px);}
		}
		#confirmModal, #confirmModal2{
			animation: appear .5s ease;
			background-color: #000000bb; 
			width: 100%;
			height: 100%;
			position: fixed;
			left:0px;
			top:0px;
			z-index: 1000;
		}

		#confirmdiv {
			width:600px;
			min-height:200px;
			background-color:white;
			padding:20px;
			margin:auto;
			margin-top:100px
		}

	</style>

	<input type="hidden" id="username" value="<?php echo $_SESSION['USER']['username']; ?>">

	<div class="d-flex">
		<div style="max-height:800px;" class="shadow-sm col-7 p-4">
			
			<div class="input-group mb-3"><h3> Items </h3>
			  <input onkeyup="check_for_enter_key(event)" oninput="search_item(event)" type="text" class="ms-4 form-control js-search" placeholder="Search" aria-label="Search" aria-describedby="basic-addon1" autocomplete="off">
			  <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
			</div>

			<div onclick="add_item(event)" class="js-products d-flex" style="flex-wrap: wrap;height: 90%;overflow-y: scroll;">
				
				
			</div>
		</div>
		
		<div class="col-5 bg-light p-3 pt-4">
			
			<div><center><h3>Cart <div class="js-item-count badge bg-primary rounded-circle">0</div></h3>
			</center>
			
			</div>
			
			<div class="table-responsive bg-light" style="height:450px;overflow-y: scroll;">
				<table class="table table-striped table-hover">
					<tr>
						<th>Image</th><th>Description</th><th>Stock</th><th>Amount</th>
						<th><button onclick="showConfirmModal('void_item')" class="btn btn-btn btn-danger btn-sm">Void</button></th>
					</tr>
					
					<tbody class="js-items">

  	 			 
	 				</tbody>
				</table>
			</div>

			<div class="js-gtotal alert alert-danger" style="font-size:25px; font-weight:bold;">Total: ₱0.00</div>
			<div class="">
				<button onclick="show_modal('amount-paid')" class="btn btn-success my-2 w-100 py-3">Checkout</button>
				<button onclick="showConfirmModal('clear_all')" class="btn btn-primary my-2 w-100">Clear All</button>
			</div>
		</div>
	</div>	

<!--modals-->

	<!--enter amount modal-->
	<div role="close-button" onclick="hide_modal(event,'amount-paid')" class="js-amount-paid-modal hide" style="animation: appear .5s ease;background-color: #000000bb; width: 100%;height: 100%;position: fixed;left:0px;top:0px;z-index: 4;">

		<div style="width:500px;min-height:200px;background-color:white;padding:10px;margin:auto;margin-top:100px">
			<h4>Checkout <button role="close-button" onclick="hide_modal(event,'amount-paid')" class="btn btn-danger float-end p-0 px-2">X</button></h4>
			<br>
				<h4>Payment</h4 >
				<input onkeyup="if(event.keyCode == 13)validate_amount_paid(event)" type="number" class="js-amount-paid-input form-control" placeholder="Enter amount paid">
				<br>
				<!--<h4>Payment Method</h4 >
					<select class="js-method-paid-input form-control" name="payment_status" id="payment_status">

						<option value ="CASH">CASH</option>
						<option value ="G-CASH">G-CASH</option>

					</select>
				<br>
				<h4>Reference Number for G-CASH</h4 >
				
				<input id="reference_number" onkeyup="if(event.keyCode == 13)validate_amount_paid(event)" type="label" class="js-amount-ref-input form-control" placeholder="Enter last 6 reference number ">
				<br>-->
				<button role="close-button" onclick="hide_modal(event,'amount-paid')" class="btn btn-secondary">Cancel</button>
				<button onclick="validate_amount_paid(event)" class="btn btn-primary float-end">Next</button>
		</div>
	</div>
	<!--end enter amount modal-->

	<!--change modal-->
	<div role="close-button" onclick="hide_modal(event,'change')" class="js-change-modal hide" style="animation: appear .5s ease;background-color: #000000bb; width: 100%;height: 100%;position: fixed;left:0px;top:0px;z-index: 4;">

		<div style="width:500px;min-height:200px;background-color:white;padding:10px;margin:auto;margin-top:100px">
			<h4>Change: <button role="close-button" onclick="hide_modal(event,'change')" class="btn btn-danger float-end p-0 px-2">X</button></h4>
			<br>
			<div class="js-change-input form-control text-center" style="font-size:60px">0.00</div>
			<br>
			<center><button role="close-button" onclick="hide_modal(event,'change')" class="js-btn-close-change btn btn-lg btn-secondary">Continue</button></center>
		</div>
	</div>
	<!--end change modal-->
	<!--clear all void modal-->
	<div id="confirmModal" class="clear_all" style="display:none">
		<div id="confirmdiv">
			<div class="mb-3">
				<h5 id="confirmMessage">Are you sure you want to clear all items? <br> Please enter a code.</h5>
				<label class="form-label">Void Code:</label>
				<input class="form-control" type="password" id="codeInput" placeholder="••••••••••">
			</div>
			<button onclick="confirmClearAll(true)" class="btn btn-danger float-end">Confirm</button>
			<button role="close-button"  onclick="confirmClearAll(false)" class="btn btn-secondary">Cancel</button>
		</div>
	</div>
	<!--clear all void modal-->
	<div id="confirmModal2" style="display:none">
		<div id="confirmdiv">
			<div class="mb-3">
				<h5 id="confirmMessage">Please enter a code.</h5>
				<label class="form-label">Void Code:</label>
				<input class="form-control" type="password" id="codeInput2" placeholder="••••••••••">
			</div>
			<button onclick="void_button(true)" class="btn btn-danger float-end">Confirm</button>
			<button role="close-button" onclick="void_button(false)" class="btn btn-secondary">Cancel</button>
		</div>
	</div>

	
<!--end modals-->

<script>
	
	var PRODUCTS 	= [];
	var ITEMS 		= [];
	var BARCODE 	= false;
	var AMOUNT 		= 0;
	var GTOTAL  	= 0;
	var CHANGE  	= 0;
	var RECEIPT_WINDOW = null;

	var main_input = document.querySelector(".js-search");
	main_input.focus();

	function search_item(e){

		var text = e.target.value.trim();
	 
		var data = {};
		data.data_type = "search";
		data.text = text;

		send_data(data);
	}

	function send_data(data)
	{
		//data.payment_status = document.getElementById('payment_status').value;
		//data.payment_reference = document.getElementById('reference_number').value;
		
		var ajax = new XMLHttpRequest();

		ajax.addEventListener('readystatechange',function(e){

			if(ajax.readyState == 4){

				
				if(ajax.status == 200)
				{
					
					if(ajax.responseText.trim() != ""){
						handle_result(ajax.responseText);
					}else{
						if(BARCODE){
							//alert("that item was not found");
							handle_result(ajax.responseText);
						}
					}
				}else{
					console.log("An error occured. Err Code:"+ajax.status+" Err message:"+ajax.statusText);
					console.log(ajax);
				}

				//clear main input if enter was pressed
				if(BARCODE){
					main_input.value = "";
					main_input.focus();
				}

				BARCODE = false;

			}
			
		});

		ajax.open('post','index.php?pg=ajax',true);
		ajax.send(JSON.stringify(data));
	}

	function handle_result(result){
		//console.log(result);
		var obj = JSON.parse(result);
		if(typeof obj != "undefined"){

			//valid json
			if(obj.data_type == "search")
			{

				var mydiv = document.querySelector(".js-products");

				mydiv.innerHTML = "";
				PRODUCTS = [];

				var mydiv = document.querySelector(".js-products");
				if(obj.data != "")
				{
					
					PRODUCTS = obj.data;
					for (var i = 0; i < obj.data.length; i++) {
						
						mydiv.innerHTML += product_html(obj.data[i],i);
					}

					if(BARCODE && PRODUCTS.length == 1){
						add_item_from_index(0);
					}
				}
			} else if (obj.data_type == "print_checkout"){
				
				var RECEIPT_NO = obj.receipt_no;
				var DATE = obj.date;
				print_receipt({
					store: '<?= esc(APP_NAME) ?>',
					address: 'Ayala Blvd., Ermita, Manila, 1000, Philippines',
					date: DATE,
					amount: AMOUNT,
					change: CHANGE,
					gtotal: GTOTAL,
					receiptno: RECEIPT_NO,
					staffid: '<?= auth('userid') ?>',
					staff: '<?= auth('username') ?>',
					data: ITEMS,
				});
				//clear items
				ITEMS = [];
				refresh_items_display();

				//reload products
				send_data({
					data_type:"search",
					text:""
				});
			}
		}
	}

	function product_html(data,index)
	{

		if (data.stock > 20) {
			return `
			<!--card-->
			<div class="card m-2 border-0 mx-auto" style="min-width: 190px;max-width: 190px;">
				<a href="#">
				<img index="${index}" src="${data.image}" style="width: 100%;max-width:175px" class="w-100 rounded border border-2">
				</a>
				<div class="p-2">
				<div class="text-muted"><b>${data.description}</b></div>
				<div class="" style="font-size:20px"><b>₱${data.amount}</b></div>
				<div class="" style="font-size:15px;color:green;">Available: <b>${data.stock}</b></div>
				</div>
			</div>
			<!--end card-->
			`;
		} else if (data.stock > 5 && data.stock <= 20) {
			return `
			<!--card-->
			<div class="card m-2 border-0 mx-auto" style="min-width: 190px;max-width: 190px;">
				<a href="#">
				<img index="${index}" src="${data.image}" style="width: 100%;max-width:175px" class="w-100 rounded border border-2">
				</a>
				<div class="p-2">
				<div class="text-muted"><b>${data.description}</b></div>
				<div class="" style="font-size:20px"><b>₱${data.amount}</b></div>
				<div class="" style="font-size:15px;color:#D68910;">Available: <b>${data.stock}</b></div>
				</div>
			</div>
			<!--end card-->
			`;

		} else if (data.stock > 0 && data.stock <= 5) {
			return `
			<!--card-->
			<div class="card m-2 border-0 mx-auto" style="min-width: 190px;max-width: 190px;">
				<a href="#">
				<img index="${index}" src="${data.image}" style="width: 100%;max-width:175px" class="w-100 rounded border border-2">
				</a>
				<div class="p-2">
				<div class="text-muted"><b>${data.description}</b></div>
				<div class="" style="font-size:20px"><b>₱${data.amount}</b></div>
				<div class="" style="font-size:15px;color:red;">Available: <b>${data.stock}</b></div>
				</div>
			</div>
			<!--end card-->
			`;

		} else if (data.stock == 0){
			return `
			<!--card-->
			<div class="card m-2 border-0 mx-auto" style="min-width: 190px;max-width: 190px; color:red;">
				<a href="#">
				<img index="${index}" src="${data.image}" style="width: 100%;max-width:175px" class="w-100 rounded border border-3 border-danger">
				</a>
				<div class="p-2">
				<div class="text-muted text-decoration-line-through"><b>${data.description}</b></div>
				<div class="text-decoration-line-through" style="font-size:20px"><b>₱${data.amount}</b></div>
				<div class="" style="font-size:15px;font-weight:bold;">Not Available</div>
				</div>
			</div>
			<!--end card-->
			`;
		} else {
			return ""; // Return empty	
		}
	}

	function item_html(data,index)
	{
		
		return `
			<!--item-->
			<tr>
				<td style="width:110px;"><img src="${data.image}" class="rounded border" style="width:100px;height:100px"></td>
				<td class="text-primary">
					${data.description}

					<div class="input-group my-3" style="max-width:150px">
					  <span index="${index}" onclick="change_qty('down',event)" class="input-group-text" style="cursor: pointer;"><i class="fa fa-minus text-primary"></i></span>
					  <input index="${index}" onblur="validate_qty(this, ${index})" onkeydown="check_enter_key(event, this, ${index})" type="text" class="form-control text-primary" placeholder="1" value="${data.qty}">
					  <span index="${index}" onclick="change_qty('up',event)" class="input-group-text" style="cursor: pointer;"><i class="fa fa-plus text-primary"></i></span>
					</div>

				</td>
				<td>
				${data.stock}
				</td>
				<td style="font-size:20px">
					<b>₱${data.amount}</b>
				</td>
				<td><button onclick="clear_item(${index})" class="float-end btn btn-danger btn-sm remove_btn" style="display:none"><i class="fa fa-times"></i></button>
				</td>
			</tr>
			<!--end item-->
			`;
				
	}

	
	function add_item_from_index(index)
	{
		//check if items exists
		if(PRODUCTS[index].stock > 0){

			for (var i = ITEMS.length - 1; i >= 0; i--) {
				
				if(ITEMS[i].id == PRODUCTS[index].id)
				{
					if (ITEMS[i].qty < PRODUCTS[index].stock) {
						ITEMS[i].qty += 1;
						let updatedItem = ITEMS.splice(i, 1)[0];
                    	ITEMS.push(updatedItem);
					}
					refresh_items_display();
					return;
				}
			}

		var temp = PRODUCTS[index];
		temp.qty = 1;

		ITEMS.push(temp);
		
		} else if (PRODUCTS[index].stock == 0){
			alert(PRODUCTS[index].description + " is out of stocks!");
		}
		refresh_items_display();
	}

	function add_item(e)
	{

		if(e.target.tagName == "IMG"){
			var index = e.target.getAttribute("index");

			add_item_from_index(index);
		}
	}

	function refresh_items_display() {
		var item_count = document.querySelector(".js-item-count");
		item_count.innerHTML = ITEMS.length;

		var items_div = document.querySelector(".js-items");
		items_div.innerHTML = "";
		var grand_total = 0;

		for (var i = ITEMS.length - 1; i >= 0; i--) {
			items_div.innerHTML += item_html(ITEMS[i], i);
			grand_total += (ITEMS[i].qty * ITEMS[i].amount);
		}
		
		var gtotal_div = document.querySelector(".js-gtotal");
		gtotal_div.innerHTML = "Total: ₱" + grand_total.toFixed(2);
		GTOTAL = grand_total;
		main_input.value = "";
		search_item({ target: { value: "" } });
	}


	var voidCodes = <?php echo json_encode($void_codes); ?>;
	var reload = false;

	document.addEventListener('keydown', function(event) {
		if (document.getElementById('confirmModal').style.display === 'block') {
			if (event.key === 'Enter') {
				confirmClearAll(true);
			} else if (event.key === 'Escape') {
				confirmClearAll(false);
			}
		} else if (document.getElementById('confirmModal2').style.display === 'block') {
			if (event.key === 'Enter') {
				void_button(true);
			} else if (event.key === 'Escape') {
				void_button(false);
			}
		}
	});

	function showConfirmModal(voiding) {
		if (ITEMS.length == 0)
			alert("No items in cart!");
		else{
			if (voiding == 'void_item'){
				document.getElementById('confirmModal2').style.display = 'block';
				document.getElementById('codeInput2').focus();
			}
			else if (voiding == 'clear_all'){
				document.getElementById('confirmModal').style.display = 'block';
				document.getElementById('codeInput').focus();
			}
		}
	}

	function confirmClearAll(confirm) {
		const modal = document.getElementById('confirmModal');
		const code = document.getElementById('codeInput').value.trim();

		if (confirm) {
			if (code === null || code.trim() === '') {
				alert("Incorrect code.");
			} else if (voidCodes.includes(code)) {
				ITEMS = [];
				refresh_items_display();
				document.getElementById('codeInput').value='';
				modal.style.display = 'none';
			} else {
				alert("Incorrect code.");
			}
		}else{
			modal.style.display = 'none';
		}
	}

	
	// Function to Void Button
	function void_button(confirm){
		const modal = document.getElementById('confirmModal2');
		const code = document.getElementById('codeInput2').value.trim();
		//var code = prompt("Please enter a code.");
		// Check if the code matches
		if (confirm) {
			if (code === null || code.trim() === '') {
				alert("Incorrect code.");
				return;
			} else if (voidCodes.includes(code.trim())) {
				var x = document.getElementsByClassName("remove_btn");
				//console.log(x);
				for (i=0; i<x.length; i++){
					x[i].style.display = "block";
				}
				document.getElementById('codeInput2').value='';
				modal.style.display = 'none';
			} else {
				alert("Incorrect code.");
			}
		} else {
			modal.style.display = 'none';
		}
	}

	/* old codes
	function clear_all()
	{
		var code = prompt("Are you sure you want to clear all items in the list?!\nPlease enter a code.");
	
		// Check if the code matches
		if (code === null || code.trim() === '') {
			alert("Incorrect code.");
			return false; // User canceled or entered empty code
		} else if (voidCodes.includes(code.trim())) {
			ITEMS = [];
			refresh_items_display();
			return true;
		} else {
			alert("Incorrect code.");
			return false;
		}
	}*/

	/* OLD codes Function to clear item
	function clear_item(index) {
		var code = prompt("Please enter the code to remove the item:");

		// Check if the code matches
		if (code === null || code.trim() === '') {
			return; // User canceled or entered empty code
		} else if (voidCodes.includes(code.trim())) {
			ITEMS.splice(index, 1);
			refresh_items_display();
		} else {
			alert("Incorrect code. Item not removed.");
		}
	}
	*/
	function clear_item(index)
	{

		if(!confirm("Confirm Remove this Item?!"))
			return;

		ITEMS.splice(index,1);
		refresh_items_display();
	}

	function change_qty(direction,e)
	{

		var index = e.currentTarget.getAttribute("index");
		var product = PRODUCTS.find((item) => item.id === ITEMS[index].id);
    	var stock = product.stock;

		if(direction == "up")
		{
			if (ITEMS[index].qty < stock) {
				ITEMS[index].qty += 1;
			}
		}else
		if(direction == "down")
		{
			ITEMS[index].qty -= 1;
		}else{

			ITEMS[index].qty = parseInt(e.currentTarget.value);
		}
	
		//make sure its not less than 1
		if(ITEMS[index].qty < 1)
		{
			ITEMS[index].qty = 1;
		}
		refresh_items_display();
	}

	function validate_qty(input, index) {
		var quantity = parseInt(input.value);
		var product = PRODUCTS.find((item) => item.id === ITEMS[index].id);
		var availableStock = product.stock;

		if (quantity > availableStock) {
			alert('Quantity exceeds available stock!');
			input.value = availableStock; // Reset the input value to the previous quantity
		} else if (quantity < 1) {
			input.value = 1 // Reset the input value to the previous quantity
		} else if (!quantity) {
			input.value = ITEMS[index].qty;
		} else {
			ITEMS[index].qty = quantity;
			refresh_items_display();
		}
	}

	function check_enter_key(event, input, index) {
		if (event.key === "Enter" || event.key === "13" ) {
			validate_qty(input, index);
			event.preventDefault(); // Prevent the default Enter key behavior (e.g., form submission)
		}
	}

	function check_for_enter_key(e)
	{
		if(e.keyCode == 13)
		{
			BARCODE = true;
			search_item(e);
			refresh_items_display();
		}
	}

	function show_modal(modal)
	{
		if(modal == "amount-paid"){

			if(ITEMS.length == 0){

				alert("Please add at least one item to the cart");
				return;
			}
			var mydiv = document.querySelector(".js-amount-paid-modal");
			mydiv.classList.remove("hide");

			mydiv.querySelector(".js-amount-paid-input").value = "";
			mydiv.querySelector(".js-amount-paid-input").focus();
		}
		else if(modal == "change"){
 
			var mydiv = document.querySelector(".js-change-modal");
			mydiv.classList.remove("hide");

			mydiv.querySelector(".js-change-input").innerHTML = CHANGE;
			mydiv.querySelector(".js-btn-close-change").focus();
		}
	}
	
	function hide_modal(e,modal)
	{
		
		if(e == true || e.target.getAttribute("role") == "close-button")
		{
			if(modal == "amount-paid"){
				var mydiv = document.querySelector(".js-amount-paid-modal");
				mydiv.classList.add("hide");
			}
			else if(modal == "change"){
				var mydiv = document.querySelector(".js-change-modal");
				mydiv.classList.add("hide");
				main_input.focus();
			}
		}	
	}

	function validate_amount_paid(e)
	{

		var amount = e.currentTarget.parentNode.querySelector(".js-amount-paid-input").value.trim();
		AMOUNT = amount;
		if(amount == "")
		{
			alert("Please enter a valid amount");
			document.querySelector(".js-amount-paid-input").focus();
			return;
		}

		amount = parseFloat(amount);
		if(amount < GTOTAL){
			let difference = GTOTAL - AMOUNT;
			alert("Total Amount Required: "+GTOTAL+". You need to add "+difference+" more.");
			return;
		}

		CHANGE = AMOUNT - GTOTAL ;
		CHANGE = CHANGE.toFixed(2);
		

		hide_modal(true,'amount-paid');
		show_modal('change');

		
		//remove unwanted information
		var ITEMS_NEW = [];
		for (var i = 0; i < ITEMS.length; i++) {
			
			var tmp = {};
			tmp.id = ITEMS[i]['id'];
			tmp.qty = ITEMS[i]['qty'];
			
			ITEMS_NEW.push(tmp);
		}

		//send cart data through ajax
		send_data({
			data_type:"checkout",
			text:ITEMS_NEW
		});
	}

	function print_receipt(obj)
	{
		var vars = JSON.stringify(obj);

		RECEIPT_WINDOW = window.open('index.php?pg=print&vars='+vars,'printpage',"width=80%;");

		setTimeout(close_receipt_window,2000);
		
	}
 
 	function close_receipt_window()
 	{
 		RECEIPT_WINDOW.close();
 	}

	send_data({
		data_type:"search",
		text:""
	});

	//prevents reload
	document.addEventListener('keydown', function (event) {
		// Check for F5 key (key code 116)
		if (event.key === 'F5' || (event.ctrlKey && event.key === 'r')) {
			event.preventDefault();
			if (ITEMS.length != 0){
				showConfirmModal('clear_all');
			}
		}
	});

</script>

<?php require views_path('partials/footer');?>