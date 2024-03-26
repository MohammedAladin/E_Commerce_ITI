<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Cart</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="app/assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="app/assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="app/assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="app/assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="app/assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="app/assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="app/assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="app/assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="app/assets/css/responsive.css">

</head>
<body>

	<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle"></div>
        </div>
    </div>
    <!--PreLoader Ends-->

    <!-- start notification div -->
    	<div class="notification" id="notification"></div>
    <!-- end notification div -->

	<!-- header -->
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo">
							<a href="index.jsp">
								<img src="app/assets/img/logo.png" alt="">
							</a>
						</div>
						<!-- logo -->

						<!-- menu start -->
						<nav class="main-menu">
							<ul>
								<li><a href="index.jsp">Home</a>
								</li>
								<li><a href="about.jsp">About</a></li>
								<!-- <li><a href="#">Pages</a>
									<ul class="sub-menu">
										<li><a href="404.jsp">404 page</a></li>
										<li><a href="about.jsp">About</a></li>
										<li><a href="cart.jsp">Cart</a></li>
										<li><a href="checkout.jsp">Check Out</a></li>
										<li><a href="contact.jsp">Contact</a></li>
										<li><a href="news.jsp">News</a></li>
										<li><a href="shop.jsp">Shop</a></li>
									</ul>
								</li> -->
								<li><a href="news.jsp">News</a>
									<ul class="sub-menu">
										<li><a href="news.jsp">News</a></li>
										<li><a href="single-news.jsp">Single News</a></li>
									</ul>
								</li>
								<li><a href="contact.jsp">Contact</a></li>
								<li><a href="/e_commerce/app/Shop">Shop</a>
									<!-- <ul class="sub-menu">
										<li><a href="shop.jsp">Shop</a></li>
										<li><a href="checkout.jsp">Check Out</a></li>
										<li><a href="single-product.jsp">Single Product</a></li>
										<li><a href="cart.jsp">Cart</a></li>
									</ul> -->
								</li>
								<li class="current-list-item">
									<div class="header-icons">
										<a class="shopping-cart" href="#"><i class="fas fa-shopping-cart"></i></a>
									</div>
								</li>
							</ul>
						</nav>
						<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
						<div class="mobile-menu"></div>
						<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->

	<!-- search area -->
	<div class="search-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<span class="close-btn"><i class="fas fa-window-close"></i></span>
					<div class="search-bar">
						<div class="search-bar-tablecell">
							<h3>Search For:</h3>
							<input type="text" placeholder="Keywords">
							<button type="submit">Search <i class="fas fa-search"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end search arewa -->

	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Fresh and Organic</p>
						<h1>Cart</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- cart -->
	<div class="cart-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-12">
					<div class="cart-table-wrap">
						<table class="cart-table">
							<thead class="cart-table-head">
								<tr class="table-head-row">
									<th class="product-remove"></th>
									<th class="product-image">Product Image</th>
									<th class="product-name">Name</th>
									<th class="product-price">Price</th>
									<th class="product-quantity">Quantity</th>
									<th class="product-total">Total</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="total-section">
						<table class="total-table">
							<thead class="total-table-head">
								<tr class="table-total-row">
									<th>Total</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<tr class="total-data">
									<td><strong>Subtotal: </strong></td>
									<td id="cart-sub-total">$0</td>
								</tr>
								<tr class="total-data">
									<td><strong>Shipping: </strong></td>
									<td id="cart-shipping" >$50</td>
								</tr>
								<tr class="total-data">
									<td><strong>Total: </strong></td>
									<td id="cart-total" >$50</td>
								</tr>
							</tbody>
						</table>
						<div class="cart-buttons">
							<a id="update-cart-btn" class="boxed-btn">Update Cart</a>
							<a id="check-out-cart-btn" class="boxed-btn black">Check Out</a>
						</div>
					</div>

					<div class="coupon-section">
						<h3>Apply Coupon</h3>
						<div class="coupon-form-wrap">
							<form action="index.jsp">
								<p><input type="text" placeholder="Coupon"></p>
								<p><input type="submit" value="Apply"></p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end cart -->

	<!-- logo carousel -->
	<div class="logo-carousel-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="logo-carousel-inner">
						<div class="single-logo-item">
							<img src="app/assets/img/company-logos/1.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="app/assets/img/company-logos/2.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="app/assets/img/company-logos/3.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="app/assets/img/company-logos/4.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="app/assets/img/company-logos/5.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end logo carousel -->

		<!-- footer -->
		<div class="footer-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="footer-box about-widget">
							<h2 class="widget-title">About us</h2>
							<p>Youssef, Mohamed, and Hassan form a dynamic team driving an e-commerce project forward. With diverse expertise in development, design, and marketing, we're poised to revolutionize online shopping.</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="footer-box get-in-touch">
							<h2 class="widget-title">Get in Touch</h2>
							<ul>
								<li>Giza, Smart Village, ITI, JETS, EWD TRACK.</li>
								<li>support@fruitkha.com</li>
								<li>01010467364</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="footer-box pages">
							<h2 class="widget-title">Pages</h2>
							<ul>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="services.jsp">Shop</a></li>
								<li><a href="news.jsp">News</a></li>
								<li><a href="contact.jsp">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="footer-box subscribe">
							<h2 class="widget-title">Subscribe</h2>
							<p>Subscribe to our mailing list to get the latest updates.</p>
							<form action="index.jsp">
								<input type="email" placeholder="Email">
								<button type="submit"><i class="fas fa-paper-plane"></i></button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end footer -->
		
		<!-- copyright -->
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<p>Copyrights &copy; 2023 - <a href="https://github.com/MohammedAladin/E_Commerce_ITI">Github</a>,  All Rights Reserved.</p>
					</div>
					<div class="col-lg-6 text-right col-md-12">
						<div class="social-icons">
							<ul>
								<li><a href="https://www.facebook.com/yousif.hossam10" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
								<li><a href="https://twitter.com/Yousif_AlAhly" target="_blank"><i class="fab fa-twitter"></i></a></li>
								<li><a href="https://www.instagram.com/yousifhossam/" target="_blank"><i class="fab fa-instagram"></i></a></li>
								<li><a href="https://www.linkedin.com/in/hassankamalv/" target="_blank"><i class="fab fa-linkedin"></i></a></li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end copyright -->

	<!-- jquery -->
	<script src="app/assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="app/assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="app/assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="app/assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="app/assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="app/assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="app/assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="app/assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="app/assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="app/assets/js/main.js"></script>
	<script src="app/assets/js/cartAjax.js"></script>

</body>
</html>