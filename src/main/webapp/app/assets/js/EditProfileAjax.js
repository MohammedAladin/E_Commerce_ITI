window.onload = function() {

    loadProfilePicture();

}
function loadProfilePicture() {

    console.log('Load profile picture');
    var profilePic = document.getElementById('profilePic');

    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'app/ProfileImage', true);
    xhr.responseType = 'arraybuffer';
    xhr.send(null);

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const arrayBufferView = new Uint8Array(xhr.response);
            console.log(arrayBufferView)

            const blob = new Blob([arrayBufferView], {type: "image/jpeg"});
            const urlCreator = window.URL || window.webkitURL;
            profilePic.src = urlCreator.createObjectURL(blob);
        }
        else {
            profilePic.src = 'app/assets/img/default.jpg';
        }
    }
}

function editCustomer(){

    event.preventDefault();


    const form = document.getElementById('infoForm');

    const formData = new FormData(form);

    let currentPassword = formData.get('currentPassword');
    let password = formData.get('newPassword');
    let confirmPassword = formData.get('confirmPassword');

    let currentUserPassword = localStorage.getItem('password');
    // if(currentPassword !== "" || password !== "" || confirmPassword !== ""){
    //     if (currentPassword !== currentUserPassword) {
    //         customAlert('Current password is incorrect');
    //         return;
    //     }
    //     if (password !== confirmPassword) {
    //         customAlert('Passwords do not match');
    //         return;
    //     }
    // }


    // Create a JSON object
    var data = {
        customerName: formData.get('username'),
        email: formData.get('email'),
        password: (password !=="") ? password : currentUserPassword,
        dob: formData.get('dob'),
        //country: formData.get('country')
        // blogNotifications: blogNotifications,
        // newsvarterNotifications: newsvarterNotifications,
        // personalOffersNotifications: personalOffersNotifications
    };

    console.log(data);
    // Send the form data to the server using an AJAX request
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'app/EditProfile', true);
    xhr.setRequestHeader('Content-Type', 'application/json');


    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            console.log('Profile updated successfully');
            customAlert('Profile updated successfully');
            //window.location.href = 'index.jsp';
        }

    }

    xhr.send(JSON.stringify(data));

}
function changePhoto() {
    console.log('Change photo');
    // Create an input element
    var input = document.createElement('input');

    console.log(input);

    // Set its type to 'file'
    input.setAttribute('type', 'file');

    console.log("type set to file");

    // Set the accepted file types
    input.setAttribute('accept', 'image/*');

    console.log("accepted file types set");

    // Listen for changes in the input's value
    input.addEventListener('change', function() {


        // If no file was selected, return
        if (!this.files || this.files.length === 0) {
            return;
        }


        // Create a new FileReader
        var reader = new FileReader();

        // Listen for the 'load' event
        reader.addEventListener('load', function() {

            // The result attribute contains the data as a base64 encoded string
            var base64String = reader.result;
            
            // Send the base64 string to the server using an AJAX request
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'app/ProfileImage', true);

            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            console.log('Sending photo to server: ' + base64String.length );
            
            // Send the base64 string as a parameter in the POST request
            xhr.send('image=' + encodeURIComponent(base64String));

            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        console.log('Photo changed successfully');
                    } else {
                        console.log('Failed to change photo. Status: ' + xhr.status);
                    }
                }
            }
        });

        // Read the selected file as a data URL
        reader.readAsDataURL(this.files[0]);
    });

    // Programmatically click the input to open the file dialog
    input.click();
}

