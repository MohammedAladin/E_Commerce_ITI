// Get the loader element
var loader = document.querySelector('.loader');

let productName = document.getElementById('productName');
let price = document.getElementById('price');
let stockCount = document.getElementById('stockCount');
let categorySelector = document.getElementById('select-category');
let description = document.getElementById('desc');
let pictureInput = document.getElementById('add-product-picture');
let createBtn = document.getElementById('createBtn');

let tableBody = document.getElementById('tableBody');

let temp;
var mood = "create";

let dataPro = [];


window.onload = function () {
        showLoader();
        console.log("loaded");
        sendRequestToGetProducts();
        sendRequestToGetCategories();
}


createBtn.onclick = function () {
    console.log(mood);
    if(validateInputs()){
        if (mood == 'create') {
            let file = pictureInput.files[0];
            if(file){
                let reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function () {
                    const imageData = reader.result;
                    let newProduct = {
                        productName: productName.value,
                        price: price.value,
                        stockCount: stockCount.value,
                        categoryName: categorySelector.value,
                        productDescription: description.value,
                        productImage: imageData
                    }
                    console.log(newProduct);
                    
                        console.log(mood);
                        sendRequestToAddProduct(newProduct);
                        
                    
                };
            }else{
                alert("you need to select image");
            }
        }else{
            dataPro.forEach(function(product) {
                if(product.productId === temp){
                    console.log("found product to update in dataPro");
                    let file = pictureInput.files[0];
                    if (file) {
                        let reader = new FileReader();
                        reader.readAsDataURL(file);
                        reader.onload = function () {
                            const imageData = reader.result;
                            product.productName = productName.value;
                            product.price = price.value;
                            product.stockCount = stockCount.value;
                            product.categoryName = categorySelector.value;
                            product.productDescription = description.value;
                            product.productImage = imageData;
                            
                            sendRequestToUpdateProduct(product);
                    
                        };
                    } else {
                        alert("you need to select image");
                    }
                    
                }
            });

        }
    }
}


function addProduct(product) {
    let newRow = document.createElement('tr');
    newRow.id = `row${product.productId}`; // Add an ID to the row for easy deletion

    newRow.innerHTML = `
            <td><img src="data:image/jpeg;base64,${product.productImage}" width="40" height="40" alt="${product.productName}"></td>
            <td>${product.productId}</td>
            <td>${product.productName}</td>
            <td>${product.price}</td>
            <td>${product.stockCount}</td>
            <td>${product.productDescription}</td>
            <td>${product.categoryName}</td>
            <td><button onclick="updateProduct(${product.productId})" id="update${product.productId}">update</button></td>
            <td><button class="delete" onclick="deleteProduct(${product.productId})" id="delete${product.productId}">delete</button></td>
        `
    tableBody.appendChild(newRow);
}

//delete
function deleteProduct(productId) {
    // Find the row with the matching product ID
    let rowToDelete = document.querySelector(`#row${productId}`);

    // Ask for confirmation before deleting
    if (confirm("Are you sure you want to delete this product?")) {
        // If the user clicked "OK", remove the row from the table
        if (rowToDelete) {
            sendRequestToDeleteProduct(productId);
        } else {
            console.error(`Couldn't find row with ID row${productId}`);
        }
    }
}




//update
function updateProduct(id) {
    let product = findProductById(id);
    temp = id;
    productName.value = product.productName;
    price.value = product.price;
    stockCount.value = product.stockCount;
    categorySelector.value = product.categoryName;
    description.value = product.productDescription;
    createBtn.innerHTML = 'Update';
    mood = 'update';
    scroll({
        left: 0,
        top: 0,
        behavior: "smooth"
    })
}

//find product by id
function findProductById(id){
    let foundProduct = {};
    dataPro.forEach(function(product) {
        if(product.productId === id){
            foundProduct = product;
        }
    });
    console.log("found product "+ foundProduct)
    return foundProduct;
}



//requests

function sendRequestToGetProducts() {
    console.log("start send request");
    xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", "/e_commerce/admin?type=1", true);
    xmlHttp.send(null);
}

function handleStateChange() {
    if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
        console.log("response: " + xmlHttp.responseText);
        
        hideLoader();
       dataPro = JSON.parse(xmlHttp.responseText);
       dataPro.forEach(function(product) {
           console.log(product);
           addProduct(product);
       });
    }
}


function sendRequestToGetCategories(){
    console.log("start send categories request");
    let xmlHttpCategories = new XMLHttpRequest();
    xmlHttpCategories.onreadystatechange = function(){
        if (xmlHttpCategories.readyState == 4 && xmlHttpCategories.status == 200){
            // Parse the JSON response
            let categories = JSON.parse(xmlHttpCategories.responseText);

            // Log each category to the console
            categories.forEach(category => {
                console.log(" my catttt  "+category);
                appendOption(category);
            });
        }
    };
    xmlHttpCategories.open("GET", "/e_commerce/admin?type=5", true);
    xmlHttpCategories.send(null);
}

function appendOption(categoryName){
    // Get the select element
    let categorySelector = document.getElementById('select-category');

    let option = document.createElement('option');
    option.textContent = categoryName;
    categorySelector.appendChild(option);
}


function sendRequestToDeleteProduct(id){
    let rowToDelete = document.querySelector(`#row${id}`);

    console.log("start send request");
    let xmlHttpdelete = new XMLHttpRequest();
    xmlHttpdelete.onreadystatechange = function(){
        if (xmlHttpdelete.readyState == 4 && xmlHttpdelete.status == 200){
            console.log("deleted "+ xmlHttpdelete.responseText);
            if(xmlHttpdelete.responseText == "false"){
                alert("Cannot delete this item because it's used in some carts.");
            }else{
                rowToDelete.remove();
            }
        }
    };
    xmlHttpdelete.open("GET", "/e_commerce/admin?type=2&id="+id, true);
    xmlHttpdelete.send(null);
}

function sendRequestToAddProduct(product){

    let xmlHttpAdd = new XMLHttpRequest();
    xmlHttpAdd.onreadystatechange = function(){
        if (xmlHttpAdd.readyState == 4 && xmlHttpAdd.status == 200){
            console.log("added "+ xmlHttpAdd.responseText);
            clearInputs();
            tableBody.innerHTML = '';
            sendRequestToGetProducts();
        }
    };
    xmlHttpAdd.open("POST", "/e_commerce/admin?type=3", true);
    console.log("send product "+ JSON.stringify(product));

    xmlHttpAdd.send(JSON.stringify(product));
}



//update product request 
function sendRequestToUpdateProduct(product){

    console.log("start send request");
    let xmlHttpupdate = new XMLHttpRequest();
    xmlHttpupdate.onreadystatechange = function(){
        if (xmlHttpupdate.readyState == 4 && xmlHttpupdate.status == 200){
            console.log("updated "+ xmlHttpupdate.responseText);
            clearInputs();
            mood = 'create';
            tableBody.innerHTML = '';
            sendRequestToGetProducts();
            //you need to update product in views or relod
        }
    };
    xmlHttpupdate.open("POST", "/e_commerce/admin?type=4", true);
    console.log(product);
    xmlHttpupdate.send(JSON.stringify(product));
}




// Function to show the loader
function showLoader() {
    loader.style.display = 'block';
}

// Function to hide the loader
function hideLoader() {
    loader.style.display = 'none';
}


//validation
function validateInputs() {

    // Check if all inputs have values
    if (!productName.value || !price.value || !stockCount.value || !categorySelector.value || !description.value || !pictureInput.files.length) {
        alert("Please fill out all fields and select a picture");
        return false;
    }

    return true;
}

function clearInputs() {
    // Clear all inputs
    productName.value = '';
    price.value = '';
    stockCount.value = '';
    categorySelector.value = 'Category';
    description.value = '';
    pictureInput.value = '';
}