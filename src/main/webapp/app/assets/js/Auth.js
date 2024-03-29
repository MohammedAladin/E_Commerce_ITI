
var loader = document.querySelector('.loader');
hideLoader();
function signUp(){
    event.preventDefault();
    showLoader();
    var username = document.getElementById('username').value;
    var password = document.getElementById('password-up').value;
    var email = document.getElementById('Email-up').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var phoneNumber = document.getElementById('phoneNumber').value;
    var dob = document.getElementById('dob').value;

    var signUpData = {
        customerName: username,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        dob: dob
    };

    console.log(signUpData);

    // Add validations for the fields
    if (!username || !password || !email || !confirmPassword || !phoneNumber || !dob) {
        document.getElementById("error-message-up").innerText = "Please fill in all the fields";
        console.log("Please fill in all the fields.");
        hideLoader();
        return;
    }
    // Add validation for password
    if (password.length < 8) {
        document.getElementById("error-message-up").innerText = "Password must be at least 8 characters long";
        hideLoader();
        return;
    }
  
    if (!/[a-z]/.test(password)) {
        document.getElementById("error-message-up").innerText = "Password must contain at least one lowercase letter";
        hideLoader();
        return;
    }

    // Add validation for Egypt phone number
    const egyptPhoneNumberRegex = /^(01)(0|1|2|5)\d{8}$/;
    if (!egyptPhoneNumberRegex.test(phoneNumber)) {
        document.getElementById("error-message-up").innerText = "Invalid phone number";
        hideLoader();
        return;
    }

    if (password !== confirmPassword) {
        document.getElementById("error-message-up").innerText = "Passwords do not match";
        console.log("Passwords do not match.");
        hideLoader();
        return;
    }

    if (!validateEmail(email)) {
        document.getElementById("error-message-up").innerText = "Invalid email address";
        hideLoader();
        return;
    }

    // Function to validate email address
    function validateEmail(email) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        hideLoader();
        return emailRegex.test(email);
    }

    
    let xhr = new XMLHttpRequest();

    
    xhr.open('POST', 'app/Register', true);
    xhr.setRequestHeader('Content-Type', 'application/json');

    xhr.onreadystatechange = function() {
        console.log("readyState: " + xhr.readyState);
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log("success");
            console.log(xhr.responseText);
            localStorage.setItem('user', xhr.responseText);
            window.location.href = "index.jsp";
        }
        if(xhr.status === 401){
            document.getElementById("error-message-up").innerText = "Email already exists";
            hideLoader();
            console.log("Email already exists");
        }
    }
    xhr.send(JSON.stringify(signUpData));
    
}

function signIn() {
    event.preventDefault();

    showLoader();
    var email = document.getElementById('Email-in').value;
    var password = document.getElementById('password-in').value;

    // Add validation for email and password
    if (!email || !password) {
        document.getElementById("error-message-in").innerText = "Please enter your email and password.";
        console.log("Please enter your email and password.");
        hideLoader();
        return;
    }

    console.log(email, password)

    var signInData = {
        email: email,
        password: password
    };

    let xhr = new XMLHttpRequest();

    xhr.open('POST', 'app/Login', true);
    xhr.setRequestHeader('Content-Type', 'application/json');


    xhr.onreadystatechange = function() {
        console.log("readyState: " + xhr.readyState);
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log("success");
            console.log(xhr.responseText);
            localStorage.setItem('user', xhr.responseText);
            window.location.href = "index.jsp";
            return;
        }
        else if(xhr.status === 401){
            setTimeout(() => {
                document.getElementById("error-message-in").innerText = "";
            }, 5000);
            hideLoader();
            return;
        }
    }
    xhr.send(JSON.stringify(signInData));

}

// Function to show the loader
function showLoader() {
    loader.style.display = 'block';
}

// Function to hide the loader
function hideLoader() {
    loader.style.display = 'none';
}