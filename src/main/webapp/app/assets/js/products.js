window.onload = function() {
    console.log("begin of js");
    var countOfPages = document.getElementById('countOfPages');
    var currentPage = document.getElementById('currentPage');
    var nextBtn = document.getElementById('nextBtn');
    var prevBtn = document.getElementById('prevBtn');
    console.log("begin of onload");
    displayProducts(1);
}

prevBtn.addEventListener("click", (e) => {
    currentPage.value = parseInt(currentPage.value) - 1;
    displayProducts(currentPage.value);
})

nextBtn.addEventListener("click", (e) => {
    currentPage.value = parseInt(currentPage.value) + 1;
    displayProducts(currentPage.value);
})

function handleButtons(num) {
    if (num === "1") {
        prevBtn.classList.add("disabled");
        prevBtn.disabled = true; // Disable the button
    } else {
        prevBtn.classList.remove("disabled");
        prevBtn.disabled = false; // Enable the button
    }
    if (num === countOfPages.value || countOfPages.value === "0") {
        nextBtn.classList.add("disabled");
        nextBtn.disabled = true; // Disable the button
    } else {
        nextBtn.classList.remove("disabled");
        nextBtn.disabled = false; // Enable the button
    }
}




function displayProducts(pageNumber) {
    console.log("inside displayProducts");
    var req = new XMLHttpRequest();
    // Set up the request
    var timestamp = new Date().getTime();
    req.open("GET", "app/product" + "?pageNumber=" + pageNumber + "&date="+timestamp, true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    // Set up the callback function to handle the response
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            // Parse the JSON response
            var data = JSON.parse(req.responseText);
            // Call a function to update the product list
            updateProductList(data);
        }
    };
    // Send the request with the current timestamp as data
    console.log("before sending parameters");
    req.send(null);
    console.log("Page number : "+pageNumber);
    console.log("after sending parameters");
}

//function updateProductList(data) {
//    // Get the div where you want to display the products
//
//    var productList = document.getElementById('productListtt');
//    // Clear any existing content in the div
//            productList.innerHTML = '';
//
//    // Check if data is an array
//    if (data != null) {
//        // Loop through the product data and generate HTML for each product
//
//            data.forEach(function(product) {
//            // Create elements for product container, columns, etc.
//            var productCol = document.createElement('div');
//            productCol.className = 'col-lg-4 col-md-6 text-center ' + product.category;
//
//            var singleProductItem = document.createElement('div');
//            singleProductItem.className = 'single-product-item';
//            //newwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
//            // Add product ID as data attribute
//            var productId = product.productId;
//            console.log("the product id = "+productId);
//            singleProductItem.setAttribute('productId', productId);
//
//            // Add click event listener to single product item
//            singleProductItem.addEventListener('click', function() {
//                goToSingleProductPage(productId);
//            });
//            //newwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
//            var productImage = document.createElement('div');
//            productImage.className = 'product-image';
//            var imageLink = document.createElement('a');
////            imageLink.href = 'single-product.html';
//            var productImg = document.createElement('img');
//            productImg.src = 'data:image/jpeg;base64,' + product.productImage;
//            productImg.alt = '';
//            imageLink.appendChild(productImg);
//            productImage.appendChild(imageLink);
//
//            var productName = document.createElement('h3');
//            productName.textContent = product.productName;
//
//            var productPrice = document.createElement('p');
//            productPrice.className = 'product-price';
//            productPrice.innerHTML = '<span>Per Kg</span> ' + product.price + '$';
//
//            var addToCartLink = document.createElement('a');
////            addToCartLink.href = 'cart.html';
//            addToCartLink.className = 'cart-btn';
//            addToCartLink.innerHTML = '<i class="fas fa-shopping-cart"></i> Add to Cart';
//
//            addToCartLink.addEventListener('click', function(event) {
//                event.preventDefault(); // Prevent the default behavior of the <a> element
//                addToCart(); // Call the addToCart function with the productId
//            });
//
//            // Append all elements together
//            singleProductItem.appendChild(productImage);
//            singleProductItem.appendChild(productName);
//            singleProductItem.appendChild(productPrice);
//            singleProductItem.appendChild(addToCartLink);
//
//            productCol.appendChild(singleProductItem);
//
//            // Append the product column to the productList div
//            productList.appendChild(productCol);
//
//        });
//            handleButtons(currentPage.value);
//    } else {
//        // Display an error message if data is not an array
//        productList.innerHTML = 'ERROR';
//    }
//}
function updateProductList(data) {
    // Get the div where you want to display the products
    var productList = document.getElementById('productListtt');
    // Clear any existing content in the div
    productList.innerHTML = '';

    // Check if data is an array
    if (data != null) {
        // Loop through the product data and generate HTML for each product
        data.forEach(function(product) {
            // Create elements for product container, columns, etc.
            var productCol = document.createElement('div');
            productCol.className = 'col-lg-4 col-md-6 text-center ' + product.category;

            var singleProductItem = document.createElement('div');
            singleProductItem.className = 'single-product-item';
            // Add product ID as data attribute
            var productId = product.productId;
            singleProductItem.setAttribute('productId', productId);

            // Add click event listener to single product item
            singleProductItem.addEventListener('click', function(event) {
                // Check if the click occurred on the image
                if (event.target.tagName.toLowerCase() === 'img') {
                    goToSingleProductPage(productId);
                }
            });

            var productImage = document.createElement('div');
            productImage.className = 'product-image';
            var imageLink = document.createElement('a');
            var productImg = document.createElement('img');
            productImg.src = 'data:image/jpeg;base64,' + product.productImage;
            productImg.alt = '';
            imageLink.appendChild(productImg);
            productImage.appendChild(imageLink);

            // Add click event listener to product image
            productImage.addEventListener('click', function() {
                goToSingleProductPage(productId);
            });

            var productName = document.createElement('h3');
            productName.textContent = product.productName;

            var productPrice = document.createElement('p');
            productPrice.className = 'product-price';
            productPrice.innerHTML = '<span>Per Kg</span> ' + product.price + '$';

            var addToCartLink = document.createElement('a');
            addToCartLink.className = 'cart-btn';
            addToCartLink.innerHTML = '<i class="fas fa-shopping-cart"></i> Add to Cart';

            addToCartLink.addEventListener('click', function(event) {
                event.preventDefault(); // Prevent the default behavior of the <a> element
                addToCart(productId); // Call the addToCart function with the productId
            });

            // Append all elements together
            singleProductItem.appendChild(productImage);
            singleProductItem.appendChild(productName);
            singleProductItem.appendChild(productPrice);
            singleProductItem.appendChild(addToCartLink);

            productCol.appendChild(singleProductItem);

            // Append the product column to the productList div
            productList.appendChild(productCol);
        });
        handleButtons(currentPage.value);
    } else {
        // Display an error message if data is not an array
        productList.innerHTML = 'ERROR';
    }
}




function addToCart(productId) {

//        event.preventDefault();
//        var productId = this.closest('.single-product-item').getAttribute('productId');
        // Construct the URL with productId as a query parameter
        var timestamp = new Date().getTime();
        var url = 'app/addFrom-shop?productId=' + encodeURIComponent(productId) +"&quantity=1&date="+timestamp;

        var xhr = new XMLHttpRequest();
            xhr.open('POST', url, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        var data = xhr.responseText;
                        if (data === 'Product added to cart successfully.') {
                            alert('Product added to cart successfully.');
                        } else {
                            alert('Please sign in to add products to your cart.');
                            window.location.href = "http://localhost:9090/e_commerce/Login.jsp";
                        }
                    } else {
                        console.error('Failed to add product to cart.');
                    }
                }
            };
            xhr.send(); // No need to send data in the body for a simple POST request

}

function goToSingleProductPage(productId) {
            // Construct the URL with the productId parameter
            var url = "http://localhost:9090/e_commerce/app/singlePage?productId=" + productId;
            // Navigate to the server URL
            window.location.href = url;
}







