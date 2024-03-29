var cartItems = [];
var loader = document.querySelector('.loader');
showLoader();
sendRequestToCart();
// Save cart to localStorage
function saveCart(cart) {
    localStorage.setItem('userCart', JSON.stringify(cart));
}

function sendRequestToCart() {
    console.log("start send request");
    xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", "app/Cart?type=1", true);
    xmlHttp.send(null);
}

function handleStateChange() {
    if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
        console.log("response: " + xmlHttp.responseText);
        if(xmlHttp.responseText ==="null"){
            window.location.href = "Login.jsp";
        }else{
            cartItems = JSON.parse(xmlHttp.responseText);
            saveCart(cartItems);
            cartItems.forEach(function(cartItem) {
                // You can access each cart item here
                console.log(cartItem);
                addRowToTable(cartItem);
            });
            hideLoader();
        }

        
    }
}


function addRowToTable(cartItem) {
    var table = document.querySelector('.cart-table tbody');

    var newRow = document.createElement('tr');
    newRow.className = 'table-body-row';
    // let base64String = btoa(String.fromCharCode(...new Uint8Array(cartItem.productImage)));

    // console.log("imagee" + base64String);
    
    newRow.innerHTML = `
        <td class="product-remove"><i id="remove-${cartItem.id}" class="far fa-window-close"></i></a></td>
        <td><img src="data:image/jpeg;base64,${cartItem.productImage}" width="40" height="40" alt="${cartItem.productName}"></td>
        <td class="product-name">${cartItem.productName}</td>
        <td class="product-price">$${cartItem.price}</td>
        <td class="product-quantity"><input type="number" id="quantity-${cartItem.id}" value=${cartItem.quantity} min="1" max="${cartItem.productStockCount}"></td>
        <td id="total-${cartItem.id}" class="product-total">$${cartItem.quantity * cartItem.price}</td>
    `;
    // Append the new row to the table
    table.appendChild(newRow);
    calculateTotalPrice();

    // Add event listener to the remove button
    document.getElementById(`remove-${cartItem.id}`).addEventListener('click', function() {
        console.log('remove button clicked' + cartItem.id);
        cartItems.forEach(function(item, index) {
            if (item.id === cartItem.id) {
                cartItems.splice(index, 1);
                deleteCartItemFromServer(cartItem.id);
            }
        });
        newRow.remove();
        calculateTotalPrice();
    });

    document.getElementById(`quantity-${cartItem.id}`).addEventListener('change', function() {
        console.log('quantity changed' + cartItem.id);
        var quantity = document.getElementById(`quantity-${cartItem.id}`).value;
        var total = quantity * cartItem.price;
        document.getElementById(`total-${cartItem.id}`).innerHTML = `$${total}`;

        cartItems.forEach(function(item) {
            if (item.id === cartItem.id) {
                    item.quantity = quantity;
                    console.log(cartItems);
            }
        });

        calculateTotalPrice();
    });
}


function calculateTotalPrice() {
    // Select all the rows in the table
    var rows = document.querySelectorAll('.table-body-row');

    // Initialize the total price
    var totalPrice = 0;
    var shipping = 50;

    // Loop through each row
    rows.forEach(function(row) {
        // Get the quantity and price from the appropriate cells
        var quantity = parseInt(row.querySelector('.product-quantity input').value);
        var price = parseFloat(row.querySelector('.product-price').textContent.slice(1)); // Remove the dollar sign

        // Calculate the total for this row and add it to the total price
        totalPrice += quantity * price;
    });

    // Display the total price for the cart

    let total = totalPrice + shipping;
    document.getElementById('cart-sub-total').textContent = '$' + totalPrice.toFixed(2);
    document.getElementById('cart-shipping').textContent = '$' + shipping;
    document.getElementById('cart-total').textContent = '$' + total.toFixed(2) ;
}

document.getElementById('update-cart-btn').addEventListener('click', function() {
    console.log('update cart button clicked');
    updateCartItemsRequest();
});

document.getElementById('check-out-cart-btn').addEventListener('click', function() {
    if(cartItems.length > 0){

        console.log('update cart button clicked' + cartItems.length);
        updateCartItemsRequest();
        saveCart(cartItems);
        window.location.href = 'checkout.jsp';
    }else{
        showNotification("Please add Item To CheckOut");
    }
});


function updateCartItemsRequest(){
    console.log('update cart button clicked');
        if(cartItems.length > 0){
        var xmlHttp2 = new XMLHttpRequest();
        xmlHttp2.onreadystatechange = function() {
            if (xmlHttp2.readyState == 4 && xmlHttp2.status == 200){
                console.log("response: " + xmlHttp2.responseText);
                showNotification("Cart Updated");
            }
        }

        xmlHttp2.open("POST", "app/Cart?type=2", true);
        xmlHttp2.setRequestHeader("Content-Type", "application/json");
        console.log(" before sending cartItems= "+JSON.stringify(cartItems));
        xmlHttp2.send(JSON.stringify(cartItems));
    }else{
        showNotification("Please add Item To Update Cart");
    }
}


function deleteCartItemFromServer(cartItemId) {
    console.log('deleteCartItemFromServer');
    var xmlHttp3 = new XMLHttpRequest();
    xmlHttp3.onreadystatechange = function() {
        if (xmlHttp3.readyState == 4 && xmlHttp3.status == 200){
            console.log("response: " + xmlHttp3.responseText);
        }
    }

    xmlHttp3.open("GET", "app/Cart?type=3&cartItemId="+cartItemId, true);
    xmlHttp3.send(null);
}


// Function to show the loader
function showLoader() {
    loader.style.display = 'block';
}

// Function to hide the loader
function hideLoader() {
    loader.style.display = 'none';
}

function showCouponNotification(){
    showNotification("Coupon not valid");
}
function showNotification(message) {
    var notification = document.getElementById('notification');
    notification.textContent = message;
    notification.style.display = 'block';
    setTimeout(function() {
        notification.style.display = 'none';
    }, 3000); // Hide after 5 seconds

}