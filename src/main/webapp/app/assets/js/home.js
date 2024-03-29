var loader = document.querySelector('.loader');
window.onload = function() {

    
    
    const signInButton = document.getElementById("signIn-button");
    const logoutButton = document.getElementById("logOut-button");

    hideLoader();
    if (localStorage.getItem('user')) {
        console.log('Email exists');
        console.log(localStorage.getItem('user'));
        signInButton.style.display = "none";
        logoutButton.style.display = "block";
        // Email exists, show logout button
    
    } else {
        console.log('Email does not exist');
        signInButton.style.display = "block";
        logoutButton.style.display = "none";
        // Email doesn't exist, show sign-in button
        
    }

    // Add event listener to the logout button
    logoutButton.addEventListener('click', function() {
        localStorage.removeItem('user');
        signInButton.style.display = "block";
        logoutButton.style.display = "none";
        showNotification("logged out successfuly");
        sendRequestToDeleteCustomerFromSession();
        sessionStorage.clear();
    });

    // Add event listener to the sign-in button
    signInButton.addEventListener('click', function() {
        window.location.href = 'Login.jsp';
    });
}
function showAllProducts() {
            console.log("inside showAllProducts");
            if (window.XMLHttpRequest) {
                req = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            }
            req.onreadystatechange = handleReq;
            var timestamp = new Date().getTime();
            var email = "yousif@gmail.com";
            var url = "app/Hom2?date=" + timestamp + "&email=" + encodeURIComponent(email);
            req.open("GET", url, true);
            req.send(null);
        }

        function handleReq() {
            console.log("inside handleReq");
            if (req.readyState == 4 &&req.status == 200)
                {
                    var valuee = req.responseText;
                    document.getElementById("emailll").value = valuee;
                    console.log("email value = "+valuee);
                }
                else{
                document.getElementById("emailll").value = "error code  " + req.status;
                }
        }

// Function to show the loader
function showLoader() {
    loader.style.display = 'block';
}

// Function to hide the loader
function hideLoader() {
    loader.style.display = 'none';
}


function showNotification(message) {
    console.log("second")
    var notification = document.getElementById('notification');
    notification.textContent = message;
    notification.style.display = 'block';
    setTimeout(function() {
        notification.style.display = 'none';
    }, 3000); // Hide after 5 seconds

}

function sendRequestToDeleteCustomerFromSession() {
    console.log('deleteCartItemFromServer');
    let xmlHttp3 = new XMLHttpRequest();
    xmlHttp3.onreadystatechange = function() {
        if (xmlHttp3.readyState == 4 && xmlHttp3.status == 200){
            console.log("response: " + deleted);
        }
    }

    xmlHttp3.open("GET", "app/Cart?type=5", true);
    xmlHttp3.send(null);
}