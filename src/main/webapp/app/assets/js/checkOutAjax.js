window.onload = function() {

    event.preventDefault();
    var orderDetailsBody = document.querySelector('.order-details-body');

    orderDetailsBody.innerHTML = '';

    console.log('Load cart data');


    // Load cart data from local storage
    var cartData = JSON.parse(localStorage.getItem('userCart')) || [];


    console.log('cartData: ' + cartData);

    // Clear the table body

    // Calculate totals
    var subtotal = 0;
    var shipping = 50; // Set a fixed shipping cost

    // Loop through each item in the cart data
    cartData.forEach(function(item) {
        // Create a new table row and populate it with the item's details
        var row = document.createElement('tr');

        var productName = document.createElement('td');
        productName.textContent = item.productName;

        var totalPrice = document.createElement('td');
        totalPrice.textContent = '$' + item.price * item.quantity;

        row.appendChild(productName);
        row.appendChild(totalPrice);

        // Append the new row to the order details table
        orderDetailsBody.appendChild(row);

        // Update the subtotal
        subtotal += item.price * item.quantity;
    });

    // Add subtotal, shipping, and total rows
    orderDetailsBody.appendChild(createTableRow('Subtotal', subtotal));
    orderDetailsBody.appendChild(createTableRow('Shipping', shipping));
    orderDetailsBody.appendChild(createTableRow('Total', subtotal + shipping));
};

function createTableRow(label, value) {
    var row = document.createElement('tr');

    var labelCell = document.createElement('td');
    labelCell.textContent = label;

    var valueCell = document.createElement('td');
    valueCell.textContent = '$' + value;

    row.appendChild(labelCell);
    row.appendChild(valueCell);

    return row;
}

function placeOrder() {

    event.preventDefault();


    console.log('Place Order');
    
    if(localStorage.getItem('user') == null){
        document.getElementById("error-message-in").innerText = "Please login to place an order.";
        return
      
    }
    console.log('You are logged in');

    // Get the form inputs
    var name = document.querySelector('.billing-address-form input[type="text"]').value;
    var email = document.querySelector('.billing-address-form input[type="email"]').value;
    var address = document.querySelector('.billing-address-form input[type="text"]').value;
    var phone = document.querySelector('.billing-address-form input[type="tel"]').value;
    var message = document.querySelector('.billing-address-form textarea').value;

    console.log('name: ' + name);
    console.log('email: ' + email);
    console.log('address: ' + address);
    console.log('phone: ' + phone);
    console.log('message: ' + message);

    // Create an object to hold the form data
    var formData = {
        name: name,
        email: email,
        address: address,
        phone: phone,
        message: message
    };

    // Send the form data to the server
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'app/CheckOut', true);
    xhr.setRequestHeader('Content-Type', 'application/json');

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            localStorage.removeItem('userCart');
            window.location.href = 'index.jsp';
        }
        else{
            console.log('Error: ' + xhr.responseText);
        }
    };
    xhr.send(JSON.stringify(formData));
}
