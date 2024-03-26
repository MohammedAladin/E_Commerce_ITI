var loader = document.querySelector('.loader');
window.onload = function() {
    console.log("begin of js");
    console.log(document.getElementById('productId').value);
    goToSingleProductPage(document.getElementById('productId').value);
    goToRelatedProduct();
}

function goToSingleProductPage(productId) {
    console.log("inside goToSingleProductPage");
        var req = new XMLHttpRequest();
        // Set up the request
        var timestamp = new Date().getTime();
        req.open("GET", "app/singleProduct" + "?productId=" + productId + "&date="+timestamp, true);
        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        // Set up the callback function to handle the response
        req.onreadystatechange = function() {
            if (req.readyState == 4 && req.status == 200) {
                // Parse the JSON response
                var data = JSON.parse(req.responseText);
                // Call a function to update the product list
                updateSingleProduct(data);
            }
        };
        // Send the request with the current timestamp as data
        console.log("before sending parameters");
        req.send(null);
        console.log("Product Id : "+productId);
        console.log("after sending parameters");
}

function updateSingleProduct(data) {

//    var productCategoryDiv = document.createElement('div');
//    productCategoryDiv.value = data.category;
//    console.log(data.category);
    // Get the existing container by its ID
    var singleProductContainer = document.getElementById('singleProductContainer');

    // Create a container within the product container
    var container = document.createElement('div');
    container.className = 'container';
    singleProductContainer.appendChild(container);

    // Create a row within the container
    var row = document.createElement('div');
    row.className = 'row';
    container.appendChild(row);

    // Create the left column for product image
    var imgColumn = document.createElement('div');
    imgColumn.className = 'col-md-5';
    row.appendChild(imgColumn);

    // Create the product image
    var productImgDiv = document.createElement('div');
    productImgDiv.className = 'single-product-img';
    var productImg = document.createElement('img');
    productImg.src =  'data:image/jpeg;base64,' + data.productImage; // You can set a default image source here
    productImg.alt = data.productName;
    productImgDiv.appendChild(productImg);
    imgColumn.appendChild(productImgDiv);

    // Create the right column for product content
    var contentColumn = document.createElement('div');
    contentColumn.className = 'col-md-7';
    row.appendChild(contentColumn);

    // Create the product content
    var productContentDiv = document.createElement('div');
    productContentDiv.className = 'single-product-content';
    contentColumn.appendChild(productContentDiv);

    // Set the product name
    var productName = document.createElement('h3');
    productName.textContent = data.productName;
    productContentDiv.appendChild(productName);

    // Set the product pricing
    var productPrice = document.createElement('p');
    productPrice.className = 'single-product-pricing';
    productPrice.innerHTML = '<span>Per Kg</span> $' + data.price;
    productContentDiv.appendChild(productPrice);

    // Set the product description
    var productDescription = document.createElement('p');
    productDescription.textContent = data.productDescription;
    productContentDiv.appendChild(productDescription);

    // Create the product form
    var productForm = document.createElement('div');
    productForm.className = 'single-product-form';
    productContentDiv.appendChild(productForm);

    // Create the form element
    var form = document.createElement('form');
    form.action = 'index.jsp';
    productForm.appendChild(form);

    // Create the input element for quantity
    var quantityInput = document.createElement('input');
    quantityInput.type = 'number';
    quantityInput.placeholder = '0';
    quantityInput.max = data.stockCount;
    form.appendChild(quantityInput);

    // Create the add to cart button
    var addToCartLink = document.createElement('a');
    //addToCartLink.href = 'cart.html';
    addToCartLink.className = 'cart-btn';
    addToCartLink.innerHTML = '<i class="fas fa-shopping-cart"></i> Add to Cart';
    addToCartLink.addEventListener('click', function(event) {
                    event.preventDefault(); // Prevent the default behavior of the <a> element
                    addToCart(document.getElementById('productId').value,quantityInput); // Call the addToCart function with the productId
                });
    productForm.appendChild(addToCartLink);

    // Set the product categories
    var productCategories = document.createElement('p');
    productCategories.innerHTML = '<strong>Categories: </strong>'+data.category+', Organic';
    productForm.appendChild(productCategories);

    // Set the share section
    var shareSection = document.createElement('div');
    productContentDiv.appendChild(shareSection);

    // Set the share heading
    var shareHeading = document.createElement('h4');
    shareHeading.textContent = 'Share:';
    shareSection.appendChild(shareHeading);

    // Set the share links list
    var shareLinksList = document.createElement('ul');
    shareLinksList.className = 'product-share';
    shareSection.appendChild(shareLinksList);

    // Create and set each share link
    var shareLinks = ['fab fa-facebook-f', 'fab fa-twitter', 'fab fa-google-plus-g', 'fab fa-linkedin'];
    shareLinks.forEach(function(iconClass) {
        var listItem = document.createElement('li');
        var link = document.createElement('a');
        link.href = '#'; // Set the default href
        var icon = document.createElement('i');
        icon.className = iconClass;
        link.appendChild(icon);
        listItem.appendChild(link);
        shareLinksList.appendChild(listItem);
    });
}

function addToCart(productId,quantityInput) {

        if (!quantityInput.value) {
                showNotification('Please enter the quantity of products first.');
                return; // Stop execution if quantityInput is null or empty
            }
        if (parseInt(quantityInput.value) > parseInt(quantityInput.max)) {
                quantityInput.value = quantityInput.max; // Set value to max if it exceeds max
                showNotification('Please Enter Quantity<='+quantityInput.max);
                return; // Stop execution
            }

        var timestamp = new Date().getTime();
        var url = 'app/addFrom-shop?productId=' + encodeURIComponent(productId) +"&quantity="+quantityInput.value+"&date="+timestamp;

        var xhr = new XMLHttpRequest();
            xhr.open('POST', url, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        var data = xhr.responseText;
                        if (data === 'Product added to cart successfully.') {
                        showNotification('Product added to cart successfully.');
                    } else {
                        showNotification('Please sign in to add products to your cart.');
                        // Redirect user after showing the notification
                        setTimeout(function() {
                            window.location.href = "Login.jsp";
                        }, 5000); // Redirect after 5 seconds
                    }
                    } else {
                        console.error('Failed to add product to cart.');
                    }
                }
            };
            xhr.send(); // No need to send data in the body for a simple POST request

}
function showNotification(message) {
        var notification = document.getElementById('notification');
        notification.textContent = message;
        notification.style.display = 'block';
        setTimeout(function() {
            notification.style.display = 'none';
        }, 5000); // Hide after 5 seconds
    }

function goToRelatedProduct() {
    console.log("inside goToRelatedProduct");
        var req = new XMLHttpRequest();
        // Set up the request
        var timestamp = new Date().getTime();
        req.open("GET", "app/relatedProducts" + "?date="+timestamp, true);
        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        // Set up the callback function to handle the response
        req.onreadystatechange = function() {
            if (req.readyState == 4 && req.status == 200) {
                // Parse the JSON response
                var data = JSON.parse(req.responseText);
                // Call a function to update the product list
                updateRelatedProducts(data);
            }
            hideLoader();
        };
        // Send the request with the current timestamp as data
        console.log("before sending parameters");
        req.send(null);
        console.log("after sending parameters");
}
function updateRelatedProducts(data) {
    let index = 0;
    // Iterate over the retrieved product data
    data.forEach(function(product, index) {
        // Get the related product container div by its ID
        var relatedProductContainer = document.getElementById('firstRelatedProduct');
        if (index === 1) {
            relatedProductContainer = document.getElementById('secondRelatedProduct');
        } else if (index === 2) {
            relatedProductContainer = document.getElementById('thirdRelatedProduct');
        }

        // Create the single product item div
        var singleProductItemDiv = document.createElement('div');
        singleProductItemDiv.className = 'single-product-item';

        // Create the product image div
        var productImageDiv = document.createElement('div');
        productImageDiv.className = 'product-image';
        var imageLink = document.createElement('a');
        imageLink.href = 'single-product.html';
        var productImg = document.createElement('img');
        productImg.src =  'data:image/jpeg;base64,' + product.productImage; // Set the default image source
        productImg.alt = '';
        imageLink.appendChild(productImg);
        productImageDiv.appendChild(imageLink);
        singleProductItemDiv.appendChild(productImageDiv);

        // Create the product name
        var productName = document.createElement('h3');
        productName.textContent = product.productName;
        singleProductItemDiv.appendChild(productName);

        // Create the product price
        var productPrice = document.createElement('p');
        productPrice.className = 'product-price';
        productPrice.innerHTML = '<span>Per Kg</span> ' + product.price + '$';
        singleProductItemDiv.appendChild(productPrice);

        // Create the add to cart button
        var addToCartLink = document.createElement('a');
        addToCartLink.href = 'cart.html';
        addToCartLink.className = 'cart-btn';
        addToCartLink.innerHTML = '<i class="fas fa-shopping-cart"></i> Add to Cart';
        singleProductItemDiv.appendChild(addToCartLink);

        // Append the single product item to the related product container
        relatedProductContainer.appendChild(singleProductItemDiv);
        index++;
    });
}

// Function to show the loader
function showLoader() {
    loader.style.display = 'block';
}

// Function to hide the loader
function hideLoader() {
    loader.style.display = 'none';
}
