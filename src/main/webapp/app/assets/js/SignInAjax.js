
document.getElementById('registrationForm').addEventListener('submit', function() {

    event.preventDefault();
    
    var username = document.getElementById('username').value;
    var password = document.getElementById('password-in').value;
    var email = document.getElementById('Email-in').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var phoneNumber = document.getElementById('phoneNumber').value;
    var dob = document.getElementById('dob').value;

    console.log("username: " + username);
 

    var signUpData = {
        username: username,
        password: password,
        email: email,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber,
        dob: dob
    };
    
    let xhr = new XMLHttpRequest();
    
    xhr.open('POST', 'app/Register', true);
    xhr.setRequestHeader('Content-Type', 'application/json');

    xhr.onreadystatechange = function() {
        console.log("readyState: " + xhr.readyState);
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log("success");
            console.log(xhr.responseText);
            window.location.href = "app/Home";
        }
    }

    xhr.send(JSON.stringify(signUpData));

    
    
});