window.onload = function() {

    //history.pushState({}, null, "home");

    // Get the sign-in and logout buttons
const signInButton = document.getElementById("signIn-button");
const logoutButton = document.getElementById("logOut-button");

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

