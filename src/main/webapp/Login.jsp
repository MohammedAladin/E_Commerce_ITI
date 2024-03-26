<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Weekly Coding Challenge #1 -  Double slider Sign in/up Form - Desktop Only</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'><link rel="stylesheet" href="app/assets/css/style.css">
  <link rel="stylesheet" href="app/assets/css/progressbar.css">

</head>
<body>

	<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle"></div>
        </div>
    </div>
    <!--PreLoader Ends-->
<!-- partial:index.partial.jsp -->
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form id="registrationForm">
			<h1>Create Account</h1>

			<span>or use your email for registration</span>
			<input type="text" placeholder="Name" id="username" />
			<input type="email" placeholder="Email" id="Email-up"/>
			<input type="password" placeholder="Password" id="password-up"/>
			<input type="password" placeholder="Confirm Password" id="confirmPassword"/>
			<input type="tel" placeholder="Phone Number" id="phoneNumber" />
			<input type="date" placeholder="Date of Birth" id="dob" />
			<div id="error-message-up" style="color: red;"></div>
			<br>
			<button onclick="signUp()">Sign UP</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form id="signInForm">
			<h1>Sign in</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>or use your account</span>
			<input type="email" placeholder="Email" id="Email-in" />
			<input type="password" placeholder="Password" id="password-in" />
			<a href="#">Forgot your password?</a>
			<div id="error-message-in" style="color: red;"></div>
			<br>
			<button onclick="signIn()">Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
				<a href="/e_commerce/app/Shop">
                    <button class="ghost" id="guest">Guest</button>
                </a>
				<a href="admin.jsp">
                    <button class="ghost" id="admin">Admin</button>
                </a>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
                <a href="/e_commerce/app/Shop">
                    <button class="ghost" id="guest">Guest</button>
                </a>
				<a href="admin.jsp">
                    <button class="ghost" id="admin">Admin</button>
                </a>
			</div>
		</div>
	</div>
</div>
  <script src="app/assets/js/script.js"></script>
  <script src="app/assets/js/Auth.js"></script>
</body>
</html>
