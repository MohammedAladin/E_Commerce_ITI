<!DOCTYPE html>
<html lang="en">
<head>

    <style>
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #f28123;
            color: #fff;
            padding: 20px 30px; /* Increased padding for bigger size */
            border-radius: 5px;
            display: none;
            z-index: 9999; /* Ensure it appears on top of other elements */
            font-size: 18px; /* Increased font size */
            font-weight: bold; /* Added font weight */
        }
    </style>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Single Product</title>

	<!-- favicon -->

	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->

	<link rel="stylesheet" href="assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="assets/css/responsive.css">

</head>
<body>
	
	<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle"></div>
        </div>
    </div>
    <!--PreLoader Ends-->
	
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
								<li><a href="../index.jsp">Home</a>
								</li>
								<li><a href="../about.jsp">About</a></li>
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
								<li><a href="../news.jsp">News</a>
									<ul class="sub-menu">
										<li><a href="news.jsp">News</a></li>
										<li><a href="single-news.jsp">Single News</a></li>
									</ul>
								</li>
								<li><a href="../contact.jsp">Contact</a></li>
								<li  class="current-list-item"><a href="/e_commerce/app/Shop">Shop</a>
									<!-- <ul class="sub-menu">
										<li><a href="shop.jsp">Shop</a></li>
										<li><a href="checkout.jsp">Check Out</a></li>
										<li><a href="single-product.jsp">Single Product</a></li>
										<li><a href="cart.jsp">Cart</a></li>
									</ul> -->
								</li>

								<li>
                                    <div class="header-icons">
                                        <a class="profile-icon" href="../profile_page.jsp"><i class="fas fa-user"></i></a>
                                    </div>
                                </li> 

								<li>
									<div class="header-icons">
										<a class="shopping-cart" href="../cart.jsp"><i class="fas fa-shopping-cart"></i></a>
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
						<p>See more Details</p>
						<h1>Single Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- single product -->


	        <input type="hidden" value="${requestScope.productId}" id="productId">

            <div class="single-product mt-150 mb-150" id="singleProductContainer">

            </div>
    <!-- end single product -->
    <!--
	<div class="single-product mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="single-product-img">

						<img src="assets/img/products/product-img-5.jpg" alt="">
					</div>
				</div>
				<div class="col-md-7">
					<div class="single-product-content">
						<h3>Green apples have polyphenols</h3>
						<p class="single-product-pricing"><span>Per Kg</span> $50</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Tempora, earum.</p>
						<div class="single-product-form">
							<form action="index.jsp">
								<input type="number" placeholder="0">
							</form>

							<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>

							<p><strong>Categories: </strong>${requestScope.categoryName}, Organic</p>
						</div>
						<h4>Share:</h4>
						<ul class="product-share">
							<li><a href=""><i class="fab fa-facebook-f"></i></a></li>
							<li><a href=""><i class="fab fa-twitter"></i></a></li>
							<li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
							<li><a href=""><i class="fab fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

    -->
	<!-- end single product -->

	<!-- more products -->
	<div class="notification" id="notification"></div>
	<div class="more-products mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">	
						<h3><span class="orange-text">Related</span> Products</h3>

						<p>Products with category : ${requestScope.categoryName}</p>
					</div>
				</div>
			</div>
			<div class="row">

				<div class="col-lg-4 col-md-6 text-center" id="firstRelatedProduct">

                				</div>
                				<div class="col-lg-4 col-md-6 text-center" id="secondRelatedProduct">

                				</div>
                				<div class="col-lg-4 col-md-6 offset-lg-0 offset-md-3 text-center" id="thirdRelatedProduct">

                				</div>
			</div>
		</div>
	</div>
	<!-- end more products -->

	<!-- logo carousel -->
	<div class="logo-carousel-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="logo-carousel-inner">
						<div class="single-logo-item">

							<img src="assets/img/company-logos/1.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/company-logos/2.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/company-logos/3.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/company-logos/4.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/company-logos/5.png" alt="">
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
								<li><a href="../index.jsp">Home</a></li>
								<li><a href="../about.jsp">About</a></li>
								<li><a href="/e_commerce/app/Shop">Shop</a></li>
								<li><a href="../news.jsp">News</a></li>
								<li><a href="../contact.jsp">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="footer-box subscribe">
							<h2 class="widget-title">Subscribe</h2>
							<p>Subscribe to our mailing list to get the latest updates.</p>
							<form action="../index.jsp">
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
	<script src="assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>
	<!-- products javascript -->
    <script src="assets/js/singleProduct.js"></script>

</body>
</html>