var cartItems;

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
        cartItems = JSON.parse(xmlHttp.responseText);
        saveCart(cartItems);
        cartItems.forEach(function(cartItem) {
            // You can access each cart item here
            console.log(cartItem);
            addRowToTable(cartItem);
        });
    }
}


function addRowToTable(cartItem) {
    var table = document.querySelector('.cart-table tbody');

    var newRow = document.createElement('tr');
    newRow.className = 'table-body-row';

    newRow.innerHTML = `
        <td class="product-remove"><i id="remove-${cartItem.id}" class="far fa-window-close"></i></a></td>
        <td class="product-image"><img src="app/assets/img/products/product-img-2.jpg" alt=""></td>
        <td class="product-name">${cartItem.product.productName}</td>
        <td class="product-price">$${cartItem.product.price}</td>
        <td class="product-quantity"><input type="number" id="quantity-${cartItem.id}" value=${cartItem.quantity} min="1" max="${cartItem.product.stockCount}"></td>
        <td id="total-${cartItem.id}" class="product-total">$${cartItem.quantity * cartItem.product.price}</td>
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
        var total = quantity * cartItem.product.price;
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
    var shipping = 30;

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
    document.getElementById('progress-bar').style.display = 'block';

});

document.getElementById('check-out-cart-btn').addEventListener('click', function() {
    console.log('update cart button clicked');
    updateCartItemsRequest();
    saveCart(cartItems);
    window.location.href = 'checkout.jsp';
});


function updateCartItemsRequest(){
    console.log('update cart button clicked');
    var xmlHttp2 = new XMLHttpRequest();
    xmlHttp2.onreadystatechange = function() {
        if (xmlHttp2.readyState == 4 && xmlHttp2.status == 200){
            console.log("response: " + xmlHttp2.responseText);
            document.getElementById('progress-bar').style.display = 'none';
        }
    }

    xmlHttp2.open("POST", "app/Cart?type=2", true);
    xmlHttp2.setRequestHeader("Content-Type", "application/json");
    console.log(" before sending cartItems= "+JSON.stringify(cartItems));
    xmlHttp2.send(JSON.stringify(cartItems));
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
