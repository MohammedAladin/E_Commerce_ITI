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
    xmlHttp.open("GET", "/e_commerce/admin?type=7", true);
    xmlHttp.send(null);
}

function handleStateChange() {
    if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
        console.log("response: " + xmlHttp.responseText);
        hideLoader();
       dataPro = JSON.parse(xmlHttp.responseText);
       dataPro.forEach(function(order) {
           console.log(order);
           addOrder(order);
       });
    }
}




function addOrder(order) {
    let newRow = document.createElement('tr');
    newRow.id = `row${order.id}`; // Add an ID to the row for easy deletion

    newRow.innerHTML = `
            <td>${order.id}</td>
            <td>${order.date}</td>
            <td>${order.orderStatus}</td>
            <td>${order.totalPrice}$</td>
            <td>${order.customerName}</td>
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



