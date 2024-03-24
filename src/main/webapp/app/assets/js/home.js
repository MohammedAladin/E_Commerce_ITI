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