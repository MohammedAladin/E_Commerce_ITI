var loader = document.querySelector('.loader');
window.onload = function() {
//    addCategory("hasan");
//    addCategory("yusif");
    console.log("begin of js");
    var countOfPages = document.getElementById('countOfPages');
    var currentPage = document.getElementById('currentPage');
    var nextBtn = document.getElementById('nextBtn');
    var prevBtn = document.getElementById('prevBtn');
    console.log("begin of onload");
    sendReqToGetCategories();
    displayProducts(1);
}

//prevBtn.addEventListener("click", (e) => {
//    currentPage.value = parseInt(currentPage.value) - 1;
//    displayProducts(currentPage.value);
//})

prevBtn.addEventListener("click", (e) => {

    currentPage.value = parseInt(currentPage.value) - 1;
    // Check if any checkboxes are checked
    let filterCheckboxes = document.querySelectorAll('input[name="filter"]:checked');
    let priceFilterCheckboxes = document.querySelectorAll('input[name="price-filter"]:checked');

    if (filterCheckboxes.length > 0 || priceFilterCheckboxes.length > 0) {
        // If any checkboxes are checked, call applyFilter instead of displayProducts
        applyFilter(currentPage.value);
    } else {
        // If no checkboxes are checked, call displayProducts
        displayProducts(currentPage.value);
    }
});

//nextBtn.addEventListener("click", (e) => {
//    currentPage.value = parseInt(currentPage.value) + 1;
//    displayProducts(currentPage.value);
//})

nextBtn.addEventListener("click", (e) => {

    currentPage.value = parseInt(currentPage.value) + 1;
    // Check if any checkboxes are checked
    let filterCheckboxes = document.querySelectorAll('input[name="filter"]:checked');
    let priceFilterCheckboxes = document.querySelectorAll('input[name="price-filter"]:checked');

    if (filterCheckboxes.length > 0 || priceFilterCheckboxes.length > 0) {
        // If any checkboxes are checked, call applyFilter instead of displayProducts
        applyFilter(currentPage.value);
    } else {
        // If no checkboxes are checked, call displayProducts
        displayProducts(currentPage.value);
    }
});

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
        hideLoader();
    };
    // Send the request with the current timestamp as data
    console.log("before sending parameters");
    req.send(null);
    console.log("Page number : "+pageNumber);
    console.log("after sending parameters");
}


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
                        showNotification('Product added to cart successfully.');
                    } else {
                        showNotification('Please sign in to add products to your cart.');
                        
                
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
            var url = "app/singlePage?productId=" + productId;
            // Navigate to the server URL
            window.location.href = url;
}
function showNotification(message) {
        var notification = document.getElementById('notification');
        notification.textContent = message;
        notification.style.display = 'block';
        setTimeout(function() {
            notification.style.display = 'none';
        }, 3000); // Hide after 5 seconds
    }


function getPriceRangeValues(selectedPriceRanges) {
    let minValues = [];
    let maxValues = [];

    selectedPriceRanges.forEach(priceRange => {
        switch (priceRange) {
            case 'upTo50':
                minValues.push(0);
                maxValues.push(50);
                break;
            case '50To100':
                minValues.push(50);
                maxValues.push(100);
                break;
            case '100To200':
                minValues.push(100);
                maxValues.push(200);
                break;
            case 'above200':
                minValues.push(200);
                maxValues.push(Number.POSITIVE_INFINITY);
                break;
            default:
                break;
        }
    });

    let minValue = minValues.length > 0 ? Math.min(...minValues) : 0;
    let maxValue = maxValues.length > 0 ? Math.max(...maxValues) : Number.POSITIVE_INFINITY;

    return { minValue, maxValue };
}

function applyFilter(pageNo) {
    let selectedPriceRanges = [];
    let pricecheckboxes = document.querySelectorAll('input[name="price-filter"]:checked');

    // Push the values of checked checkboxes to the selectedPriceRanges array
    pricecheckboxes.forEach(checkbox => {
        selectedPriceRanges.push(checkbox.value);
    });

    // Call the getPriceRangeValues function with the selectedPriceRanges array
    let priceRangeValues = getPriceRangeValues(selectedPriceRanges);

    // Output the minimum and maximum values
    console.log("Minimum Value:", priceRangeValues.minValue);
    console.log("Maximum Value:", priceRangeValues.maxValue);

    let selectedCategories = [];
    // Get all checked checkboxes with the name "filter"
    let categorycheckboxes = document.querySelectorAll('input[name="filter"]:checked');

    // Push the values of checked checkboxes to the selectedCategories array
    categorycheckboxes.forEach(checkbox => {
        selectedCategories.push(checkbox.value);
    });

    // Output the array of selected categories
    console.log("Selected Categories:", selectedCategories);
    console.log("Current page = ", currentPage.value);

    // Create a new XMLHttpRequest object
        var req = new XMLHttpRequest();
        // Set up the request
        var timestamp = new Date().getTime();
        var url = "app/filterProducts" + "?minPrice=" + priceRangeValues.minValue + "&maxPrice=" + priceRangeValues.maxValue + "&categories=" + selectedCategories.join(',') + "&pageNumber=" + pageNo + "&date=" + timestamp;
        req.open("GET", url, true);
        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        // Set up the callback function to handle the response
        req.onreadystatechange = function() {
            if (req.readyState == 4 && req.status == 200) {
                // Parse the JSON response

                var data = JSON.parse(req.responseText);

                updateProductList(data);
            }
        };
        // Send the request with the current timestamp as data
        console.log("before sending parameters");
        req.send(null);
        console.log("after sending parameters");
}



// Function to show the loader
function showLoader() {
    loader.style.display = 'block';
}

// Function to hide the loader
function hideLoader() {
    loader.style.display = 'none';
}

function addCategory(name) {
    // Create checkbox element
    var checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    checkbox.id = name;
    checkbox.name = 'filter';
    checkbox.value = name;

    // Create label element
    var label = document.createElement('label');
    label.htmlFor = name;
    label.appendChild(document.createTextNode(name));

    // Append checkbox and label to a container div
    var container = document.getElementById('categoriesDiv');
    //    container.className = 'filter-checkboxes';
    container.appendChild(checkbox);
    container.appendChild(label);
}

function sendReqToGetCategories(){
    console.log("start send categories request");
    let xmlHttpCategories = new XMLHttpRequest();
    xmlHttpCategories.onreadystatechange = function(){
        if (xmlHttpCategories.readyState == 4 && xmlHttpCategories.status == 200){
            // Parse the JSON response
            let categories = JSON.parse(xmlHttpCategories.responseText);

            // Log each category to the console
            categories.forEach(category => {
                console.log(" my catttt  "+category);
                addCategory(category);
            });
        }
    };
    xmlHttpCategories.open("POST", "app/product", true);
    xmlHttpCategories.send("");
}


function clearFilter() {
        displayProducts(1);
        deselectPriceCheckboxes();
        deselectCategoryCheckboxes();
}

function deselectPriceCheckboxes() {
    var checkboxes = document.getElementsByName('price-filter');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = false;
    }
}

function deselectCategoryCheckboxes() {
    var checkboxes = document.getElementsByName('filter');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = false;
    }
}