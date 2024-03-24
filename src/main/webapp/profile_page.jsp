<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">


    <title>bs4 edit profile page - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="app/assets/css/customAlert.css">

    <style type="text/css">
        body {
            margin-top: 20px;
            background: #f8f8f8
        }
    </style>

</head>

<body>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    
    <div class="container">
        <div class="row flex-lg-nowrap">
          
            <div class="col">
                <div class="row">
                    <div class="col mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="e-profile">
                                    <div class="row">
                                        
                                        <div class="col-12 col-sm-auto mb-3">
                                            <div class="mx-auto" style="width: 140px;">
                                                <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                    <img id="profilePic" src="" alt="Profile Picture" style="width: 100%; height: 100%; object-fit: cover;">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                            <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">John Smith</h4>
                                                <p class="mb-0">@johnny.s</p>
                                                <div class="text-muted"><small>Last seen 2 hours ago</small></div>
                                                <div class="mt-2">
                                                    <button class="btn btn-primary" type="button" onclick="changePhoto()">
                                                        <i class="fa fa-fw fa-camera"></i>
                                                        <span>Change Photo</span>
                                                    </button>
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </div>
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a href class="active nav-link">Settings</a></li>
                                    </ul>
                                    <form id="infoForm">
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <div class="row">
                                                    <!-- Personal Information Section -->
                                                    <div class="col">
                                                       
                                                        <div class="form-group">
                                                            <label>Username</label>
                                                            <input class="form-control" type="text" name="username" placeholder="johnny.s" value="johnny.s">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Email</label>
                                                            <input class="form-control" type="text" placeholder="user@example.com">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Phone Number</label>
                                                            <input class="form-control" type="text" name="phone" placeholder="Phone Number">
                                                        </div>
                                                
                                                        <div class="form-group">
                                                            <label>Interests</label>
                                                            <input class="form-control" type="text" name="interests" placeholder="Interests">
                                                        </div>
                                                       
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Date of Birth</label>
                                                                    <input class="form-control" type="date" name="dob" placeholder="Date of Birth">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Country</label>
                                                            <input class="form-control" type="text" name="country" placeholder="Country">
                                                        </div>
                                                    </div>
                                                    <!-- Change Password Section -->
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label>Current Password</label>
                                                            <input class="form-control" type="password">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>New Password</label>
                                                            <input class="form-control" type="password">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Confirm Password</label>
                                                            <input class="form-control" type="password">
                                                        </div>
                                                    </div>
                                                    <!-- Email Notifications Section -->
                                                    <div class="col">
                                                        <div class="mb-2"><b>Keeping in Touch</b></div>
                                                        <label>Email Notifications</label>
                                                        <div class="custom-controls-stacked px-2">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="notifications-blog" checked>
                                                                <label class="custom-control-label" for="notifications-blog">Blog posts</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="notifications-news" checked>
                                                                <label class="custom-control-label" for="notifications-news">Newsletter</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="notifications-offers" checked>
                                                                <label class="custom-control-label" for="notifications-offers">Personal Offers</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Save Changes Button -->
                                                <div class="row">
                                                    <div class="col d-flex justify-content-end">
                                                        <button class="btn btn-primary" type="submit" onclick="editCustomer()">Save Changes</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="app/assets/js/EditProfileAjax.js"></script>
    <script src="app/assets/js/CustomAlert.js"></script>

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
    

    </script>
</body>

</html>