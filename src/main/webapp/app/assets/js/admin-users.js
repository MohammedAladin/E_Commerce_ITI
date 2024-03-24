// Get the loader element
var loader = document.querySelector('.loader');


let tableBody = document.getElementById('tableBody');
var xmlHttp;


let dataPro = [];


window.onload = function () {
        showLoader();
        console.log("loaded");
        sendRequestToGetUsers();
}


function sendRequestToGetUsers() {
    console.log("start send request");
    xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", "/e_commerce/admin?type=6", true);
    xmlHttp.send(null);
}

function handleStateChange() {
    if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
        console.log("response: " + xmlHttp.responseText);
        hideLoader();
       dataPro = JSON.parse(xmlHttp.responseText);
       dataPro.forEach(function(customer) {
           console.log(customer);
           addCustomer(customer);
       });
    }
}




function addCustomer(customer) {
    let newRow = document.createElement('tr');
    newRow.id = `row${customer.id}`; // Add an ID to the row for easy deletion

    newRow.innerHTML = `
            <td>${customer.id}</td>
            <td>${customer.customerName}</td>
            <td>${customer.dob}</td>
            <td>${customer.email}</td>
            <td>${customer.phoneNumber}</td>
            <td>${customer.creditLimit}</td>
        `
    tableBody.appendChild(newRow);
}





// Function to show the loader
function showLoader() {
    loader.style.display = 'block';
}

// Function to hide the loader
function hideLoader() {
    loader.style.display = 'none';
}



