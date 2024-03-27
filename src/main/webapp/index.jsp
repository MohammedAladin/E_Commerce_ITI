<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Fruitkha</title>

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
								<li class="current-list-item"><a href="#">Home</a>
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

								<li><a id="signIn-button">SignIn</a>
								<li><a id="logOut-button">Logout</a>

								<li>
                                    <div class="header-icons">
                                        <a class="profile-icon" href="profile_page.jsp"><i class="fas fa-user"></i></a>
                                    </div>
                                </li>

								<li>
									<div class="header-icons">
										<a class="shopping-cart" href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
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
	<!-- end search area -->

	<!-- hero area -->
	<div class="hero-area hero-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 offset-lg-2 text-center">
					<div class="hero-text">
						<div class="hero-text-tablecell">
							<p class="subtitle">Fresh & Organic</p>
							<h1>Delicious Seasonal Fruits</h1>
							<div class="hero-btns">

								<a href="/e_commerce/app/Shop" class="boxed-btn">Fruit Collection</a>
								<a href="contact.jsp" class="bordered-btn">Contact Us</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end hero area -->

	<!-- features list section -->
	<div class="list-section pt-80 pb-80">
		<div class="container">

			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="list-box d-flex align-items-center">
						<div class="list-icon">
							<i class="fas fa-shipping-fast"></i>
						</div>
						<div class="content">
							<h3>Free Shipping</h3>
							<p>When order over $75</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="list-box d-flex align-items-center">
						<div class="list-icon">
							<i class="fas fa-phone-volume"></i>
						</div>
						<div class="content">
							<h3>24/7 Support</h3>
							<p>Get support all day</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="list-box d-flex justify-content-start align-items-center">
						<div class="list-icon">
							<i class="fas fa-sync"></i>
						</div>
						<div class="content">
							<h3>Refund</h3>
							<p>Get refund within 3 days!</p>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- end features list section -->

	<!-- product section -->
	<div class="product-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">	
						<h3><span class="orange-text">Our</span> Products</h3>
						<p>Indulge in the freshest bounty of nature with our exquisite selection of fruits and vegetables. Sourced directly from local farms and orchards, our products bring the essence of nature to your table. From crisp apples to succulent tomatoes, each item is handpicked to ensure premium quality and flavor. Elevate your culinary experience with our diverse range of seasonal delights, and savor the goodness of nature with every bite.</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="/e_commerce/app/Shop"><img src="app/assets/img/products/product-img-1.jpg" alt=""></a>
						</div>
						<h3>Strawberry</h3>
						<p class="product-price"><span>Per Kg</span> 85$ </p>
						<a href="/e_commerce/app/Shop" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="/e_commerce/app/Shop"><img src="app/assets/img/products/product-img-2.jpg" alt=""></a>
						</div>
						<h3>Berry</h3>
						<p class="product-price"><span>Per Kg</span> 70$ </p>
						<a href="/e_commerce/app/Shop" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="/e_commerce/app/Shop"><img src="app/assets/img/products/product-img-3.jpg" alt=""></a>
						</div>
						<h3>Lemon</h3>
						<p class="product-price"><span>Per Kg</span> 35$ </p>
						<a href="/e_commerce/app/Shop" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end product section -->

	<!-- cart banner section -->
	<section class="cart-banner pt-100 pb-100">
    	<div class="container">
        	<div class="row clearfix">
            	<!--Image Column-->
            	<div class="image-column col-lg-6">
                	<div class="image">
                    	<div class="price-box">
                        	<div class="inner-price">
                                <span class="price">
                                    <strong>30%</strong> <br> off per kg
                                </span>
                            </div>
                        </div>
                    	<img src="app/assets/img/a.jpg" alt="">
                    </div>
                </div>
                <!--Content Column-->
                <div class="content-column col-lg-6">
					<h3><span class="orange-text">Deal</span> of the month</h3>
                    <h4>Hikan Strwaberry</h4>
                    <div class="text">
						"Introducing our 'Deal of the Month': a limited-time offer packed with unbeatable savings and exclusive perks to elevate your shopping experience."</div>
                    <!--Countdown Timer-->
                    <div class="time-counter"><div class="time-countdown clearfix" data-countdown="2020/2/01"><div class="counter-column"><div class="inner"><span class="count">00</span>Days</div></div> <div class="counter-column"><div class="inner"><span class="count">00</span>Hours</div></div>  <div class="counter-column"><div class="inner"><span class="count">00</span>Mins</div></div>  <div class="counter-column"><div class="inner"><span class="count">00</span>Secs</div></div></div></div>
                	<a href="/e_commerce/app/Shop" class="cart-btn mt-3"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                </div>
            </div>
        </div>
    </section>
    <!-- end cart banner section -->

	<!-- testimonail-section -->
	<div class="testimonail-section mt-80 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1 text-center">
					<div class="testimonial-sliders">
						<div class="single-testimonial-slider">
							<div class="client-avater">
								<img src="app/assets/img/avaters/avatar1.png" alt="">
							</div>
							<div class="client-meta">
								<h3>Hassan Kamal <span>Software Engineer</span></h3>
								<p class="testimonial-body">
									" Passionate about Java software engineering, our candidate brings a fervent dedication to mastering the intricacies of the language, coupled with a relentless drive to innovate and solve complex problems. Their enthusiasm for Java extends beyond mere coding; it's a commitment to crafting elegant solutions and pushing the boundaries of what's possible in software development "
								</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
						<div class="single-testimonial-slider">
							<div class="client-avater">
								<img src="app/assets/img/avaters/avatar2.png" alt="">
							</div>
							<div class="client-meta">
								<h3>Mohamed Alaa <span>Software Engineer</span></h3>
								<p class="testimonial-body">
									" With a deep-seated passion for Java, our candidate consistently seeks out opportunities to deepen their expertise, whether through personal projects, online courses, or active participation in developer communities. Their relentless pursuit of knowledge fuels their desire to stay ahead of industry trends and adopt best practices, ensuring that their skills remain cutting-edge and adaptable to evolving technology landscapes. "
								</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
						<div class="single-testimonial-slider">
							<div class="client-avater">
								<img src="app/assets/img/avaters/avatar3.png" alt="">
							</div>
							<div class="client-meta">
								<h3>Yousif Hossam <span>Software Engineer</span></h3>
								<p class="testimonial-body">
									" Beyond technical proficiency, our Java software engineer is fueled by an unwavering passion for building impactful software solutions that resonate with end-users. They understand that behind every line of code lies the potential to create meaningful experiences, and they approach their work with a sense of purpose and dedication, striving to leave a lasting positive impact on the projects they undertake "
								</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end testimonail-section -->
	
	<!-- advertisement section -->
	<div class="abt-section mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12">
					<div class="abt-bg">
						<a href="https://www.youtube.com/watch?v=DBLlFWYcIGQ" class="video-play-btn popup-youtube"><i class="fas fa-play"></i></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-12">
					<div class="abt-text">
						<p class="top-sub">Since Year 2024</p>
						<h2>We are <span class="orange-text">Fruitkha</span></h2>
						<p>At Fruitkha, we're passionate about bringing you the freshest and most delicious fruits straight from the orchard to your table. Our commitment to quality ensures that every bite bursts with flavor and nutrients, making every moment a delightful experience.</p>
                            <p>Discover a world of taste sensations with our carefully curated selection of seasonal fruits sourced from trusted growers around the globe. From succulent strawberries to exotic mangos, we offer a wide array of choices to tantalize your taste buds and inspire healthy living.</p>
						<a href="about.jsp" class="boxed-btn mt-4">know more</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end advertisement section -->
	
	<!-- shop banner -->
	<section class="shop-banner">
    	<div class="container">
        	<h3>December sale is on! <br> with big <span class="orange-text">Discount...</span></h3>
            <div class="sale-percent"><span>Sale! <br> Upto</span>50% <span>off</span></div>
            <a href="/e_commerce/app/Shop" class="cart-btn btn-lg">Shop Now</a>
        </div>
    </section>
	<!-- end shop banner -->

	<!-- latest news -->
	<div class="latest-news pt-150 pb-150">
		<div class="container">

			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">	
						<h3><span class="orange-text">Our</span> News</h3>
						<p>Company Fruitkha, a leading provider of innovative solutions in the tech industry, has just released its financial report for the first quarter of the year, revealing record-breaking profits. Despite challenges posed by the ongoing global pandemic, Company X managed to surpass market expectations...</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
						<a href="single-news.jsp"><div class="latest-news-bg news-bg-1"></div></a>
						<div class="news-text-box">
							<h3><a href="single-news.jsp">You will vainly look for fruit on it in autumn.</a></h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Admin</span>
								<span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
							</p>
							<p class="excerpt">This article discusses the importance of planning for the future and the consequences of neglecting responsibilities.</p>
							<a href="single-news.jsp" class="read-more-btn">read more <i class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
						<a href="single-news.jsp"><div class="latest-news-bg news-bg-2"></div></a>
						<div class="news-text-box">
							<h3><a href="single-news.jsp">A man's worth has its season, like tomato.</a></h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Admin</span>
								<span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
							</p>
							<p class="excerpt">This piece explores the concept of appreciating things in their prime and how value can change over time.</p>
							<a href="single-news.jsp" class="read-more-btn">read more <i class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
					<div class="single-latest-news">
						<a href="single-news.jsp"><div class="latest-news-bg news-bg-3"></div></a>
						<div class="news-text-box">
							<h3><a href="single-news.jsp">Good thoughts bear good fresh juicy fruit.</a></h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Admin</span>
								<span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
							</p>
							<p class="excerpt">This news item highlights the positive outcomes of positive thinking and its impact on achieving goals.</p>
							<a href="single-news.jsp" class="read-more-btn">read more <i class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<a href="news.jsp" class="boxed-btn">More News</a>
				</div>
			</div>
		</div>
	</div>
	<!-- end latest news -->

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
								<li><a href="/e_commerce/app/Shop">Shop</a></li>
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

	<!-- trial script by yousif -->
    <script src="assets/js/home.js"></script>
	
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
	<script src="app/assets/js/home.js"></script>



</body>
</html>