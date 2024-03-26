<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Shop</title>

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
    .filter-checkboxes {
        margin-bottom: 5px; /* Decreased margin-bottom */
        text-align: center; /* Center horizontally */
    }
    .filter-checkboxes label {
        display: inline-block;
        padding: 3px 8px; /* Decreased padding */
        border: 1px solid #ccc;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 5px; /* Added margin-right */
    }
    .filter-checkboxes input[type="checkbox"] {
        display: none;
    }
    .filter-checkboxes input[type="checkbox"]:checked + label {
        background-color: #f28123;
        color: #fff;
    }

    .filter-buttons {
        margin-top: 10px;
        display: flex;
        justify-content: center;
    }
    .filter-buttons button {
        padding: 10px 40px; /* Decreased padding */
        background-color: #f28123;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 10px;
    }
    .filter-buttons button:hover {
        background-color: #d15f00;
    }
</style>


     <!-- <link rel="stylesheet" href="assets/css/priceStyle.css"> -->


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
							<a href="../index.jsp">

								<img src="assets/img/logo.png" alt="">
							</a>
						</div>
						<!-- logo -->

						<!-- menu start -->
						<nav class="main-menu">
							<ul>
								<li ><a href="../index.jsp">Home</a>
								</li>
								<li><a href="../about.jsp">About</a></li>
								<!-- <li><a href="#">Pages</a>
									<ul class="sub-menu">
										<li><a href="404.jsp">404 page</a></li>
										<li><a href="about.jsp">About</a></li>
										<li><a href="cart.jsp">Cart</a></li>
										<li><a href="cart.jsp">Check Out</a></li>
										<li><a href="contact.jsp">Contact</a></li>
										<li><a href="news.jsp">News</a></li>
										<li><a href="/e_commerce/app/Shop">Shop</a></li>
									</ul>
								</li> -->
								<li><a href="../news.jsp">News</a>
									<ul class="sub-menu">
										<li><a href="../news.jsp">News</a></li>
										<li><a href="../single-news.jsp">Single News</a></li>
									</ul>
								</li>
								<li><a href="../contact.jsp">Contact</a></li>
								<li class="current-list-item"><a href="#">Shop</a>
								</li>
								<li>
									<div class="header-icons">

										<a class="shopping-cart" href="../cart.jsp"><i class="fas fa-shopping-cart"></i></a>
										<!-- <a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a> -->
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
						<h1>Shop</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->



    <!-- products -->
    <div class="notification" id="notification"></div>
    <div class="product-section mt-100 mb-100">
        <div class="container">

             <div class="row">
                <div class="col-md-12">
                    <div class="product-filters">

                                <!--
                                <ul>
                                <li class="active" data-filter="*">All</li>
                                <li data-filter=".strawberry">Strawberry</li>
                                <li data-filter=".berry">Berry</li>
                                <li data-filter=".lemon">Lemon</li>
                                <li style="display: inline-block;" onmouseover="this.style.backgroundColor='#f28123'" onmouseout="this.style.backgroundColor=''">Vegetables</li>
                                <li style="display: inline-block;" onmouseover="this.style.backgroundColor='#f28123'" onmouseout="this.style.backgroundColor=''">Summer Fruits</li>
                                <li style="display: inline-block;" onmouseover="this.style.backgroundColor='#f28123'" onmouseout="this.style.backgroundColor=''">Winter Fruits</li></br>
                                <li style="display: inline-block;" onmouseover="this.style.backgroundColor='#f28123'" onmouseout="this.style.backgroundColor=''">All</li>
                                <li style="display: inline-block;" onmouseover="this.style.backgroundColor='#f28123'" onmouseout="this.style.backgroundColor=''">Up to 50 EGP</li>
                                <li style="display: inline-block;" onmouseover="this.style.backgroundColor='#f28123'" onmouseout="this.style.backgroundColor=''">50 to 100 EGP</li>
                                <li style="display: inline-block;" onmouseover="this.style.backgroundColor='#f28123'" onmouseout="this.style.backgroundColor=''">100 to 200 EGP</li>
                                <li style="display: inline-block;" onmouseover="this.style.backgroundColor='#f28123'" onmouseout="this.style.backgroundColor=''">200 EGP & Above</li>
                                </ul>
                                -->
                        <div class="filter-checkboxes" id="categoriesDiv">
                        <!--
                                <input type="checkbox" id="vegetables" name="filter" value="vegetables">
                                <label for="vegetables">Vegetables</label>

                                <input type="checkbox" id="summer-fruits" name="filter" value="summerFruits">
                                <label for="summer-fruits">Summer Fruits</label>

                                <input type="checkbox" id="winter-fruits" name="filter" value="winterFruits">
                                <label for="winter-fruits">Winter Fruits</label>
                        -->
                        </div>

                        <div class="filter-checkboxes">
                            <input type="checkbox" id="up-to-50-egp" name="price-filter" value="upTo50">
                            <label for="up-to-50-egp">Up to 50 EGP</label>

                            <input type="checkbox" id="50-to-100-egp" name="price-filter" value="50To100">
                            <label for="50-to-100-egp">50 to 100 EGP</label>

                            <input type="checkbox" id="100-to-200-egp" name="price-filter" value="100To200">
                            <label for="100-to-200-egp">100 to 200 EGP</label>

                            <input type="checkbox" id="above-200-egp" name="price-filter" value="above200">
                            <label for="above-200-egp">200 EGP & above</label>
                        </div>

                        <div class="filter-buttons">
                                <button onclick="applyFilter(document.getElementById('currentPage').value)">Filter</button>
                                <button onclick="clearFilter()">Clear Filters</button>
                        </div>


                        <!--
                        <div class="price-slider">
                            <div class="price-range" id="price-range">
                                PRICE FROM <span id="min-value">0</span> TO <span id="max-value">200</span></br>
                            </div>
                            <input id="price-input" type="range" min="0" max="1000" value="200" step="1" onchange="updateRangeValue(this.value)">
                        </div>

                        <div class="filter-buttons">
                                <button onclick="applyFilter()">Filter</button>
                                <button onclick="displayProducts(document.getElementById('currentPage').value)">Clear Filters</button>
                        </div>
                        -->

                        <!--
                        <div class="slider-container">
                            <div class="headerr"><h2 class="projtitle">Price Range</h2></div>
                            <span>Minimum Price</span><input type="number" id="min-price" placeholder="Min Price" min="0"></br>
                            <span>Maximum Price</span><input type="number" id="max-price" placeholder="Max Price" min="1" max="1000">
                            <div class="slider" id="slider">
                                <div class="slider-thumb left" id="slider-thumb left"></div>
                                <div class="slider-thumb right" id="slider-thumb right"></div>
                            </div>
                        </div>

                        -->




                        <!--
                        <div class="custom-wrapperr">

                                    <div class="headerr">
                                        <h2 class="projtitle">
                                              Price Range
                                          </h2>
                                    </div>

                                    <div class="price-input-container">
                                        <div class="price-input">
                                            <div class="price-field">
                                                <span>Minimum Price</span>
                                                <input type="number"
                                                       class="min-input"
                                                       value="250">
                                            </div>
                                            <div class="price-field">
                                                <span>Maximum Price</span>
                                                <input type="number"
                                                       class="max-input"
                                                       value="850">
                                            </div>
                                        </div>
                                        <div class="slider-container">
                                            <div class="price-slider">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="range-input">
                                        <input type="range"
                                               class="min-range"
                                               min="0"
                                               max="1000"
                                               value="250"
                                               step="1">
                                        <input type="range"
                                               class="max-range"
                                               min="0"
                                               max="1000"
                                               value="850"
                                               step="1">
                                    </div>
                        </div>
                        -->

                    </div>
                </div>
            </div>

            <div class="row product-lists" id="productListtt">
            </div>

            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="pagination-wrap">
                    <input type="hidden" value="${requestScope.countOfPages}" id="countOfPages">
                    <input type="hidden" value="1" id="currentPage">
                        <ul>
                             <li><a  id="prevBtn" class="btn">Prev</a></li>
                                           <!-- <button id="prevBtn">Prev</button> -->
                                           <!-- <li><a href="#">1</a></li> -->
                                           <!--	<li><a class="active" href="#">2</a></li> -->
                                           <!--	<li><a href="#">3</a></li> -->
                             <li><a  id="nextBtn" class="btn">Next</a></li>
                                            <!-- <button id="nextBtn">Next</button> -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end products -->

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

						<p>Yousif Hossam Mohamed Salah
						 Hassan Kamal ElDien Mahmoud
						  Mohamed Alaa ElDien Ibrahim</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box get-in-touch">
						<h2 class="widget-title">Get in Touch</h2>
						<ul>

							<li>34/8, East Banha, Qaluybia, Egypt.</li>
							<li>support@fruitkha.com</li>
							<li>+2 01001083571</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box pages">
						<h2 class="widget-title">Pages</h2>
						<ul>
							<li><a href="../index.jsp">Home</a></li>

							<li><a href="../about.jsp">About</a></li>
							<li><a href="#">Shop</a></li>
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

							<input name="emailll" id="emailll" type="email" placeholder="Email">
<!--							<button type="submit"><i class="fas fa-paper-plane"></i></button>-->
							<button onclick="showAllProducts()"><i class="fas fa-paper-plane"></i></button>
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

					<p>Copyrights &copy; 2024 - <a href="https://www.linkedin.com/in/yousif-hossam/">Yousif Hossam</a>,  All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 text-right col-md-12">
					<div class="social-icons">
						<ul>

							<li><a href="https://www.facebook.com/yousif.hossam10" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="https://twitter.com/Yousif_AlAhly" target="_blank"><i class="fab fa-twitter"></i></a></li>
							<li><a href="https://www.instagram.com/yousifhossam/" target="_blank"><i class="fab fa-instagram"></i></a></li>
							<li><a href="https://www.linkedin.com/in/yousif-hossam/" target="_blank"><i class="fab fa-linkedin"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
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
	  <!-- <script src="assets/js/jquery.isotope-3.0.6.min.js"></script> -->

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
	<!-- trial script by yousif -->
    <script src="assets/js/home.js"></script>
	<!-- products javascript -->
    <script src="assets/js/products.js"></script>
    <!--
    <script>
    function updateRangeValue(value) {
                document.getElementById('min-value').innerText = 0;
                document.getElementById('max-value').innerText = value;
            }
    document.addEventListener("DOMContentLoaded", function(event) {
            var initialValue = document.getElementById('price-input').value;
            updateRangeValue(initialValue);
        });

    </script>
    -->

    <!--
    <script>
            const minPriceInput = document.getElementById('min-price');
            const maxPriceInput = document.getElementById('max-price');
            const slider = document.getElementById('slider');
            const leftThumb = document.getElementById('slider-thumb left');
            const rightThumb = document.getElementById('slider-thumb right');

            // Update the slider when the min or max price inputs change
            minPriceInput.addEventListener('input', updateSlider);
            maxPriceInput.addEventListener('input', updateSlider);

            // Update the slider position based on the inputs
            function updateSlider() {
                const min = parseInt(minPriceInput.value);
                const max = parseInt(maxPriceInput.value);
                const sliderWidth = slider.clientWidth;

                // Calculate the left and right thumb positions
                const leftPosition = (min / max) * sliderWidth;
                const rightPosition = sliderWidth - ((max / max) * sliderWidth);

                // Update the thumb positions
                leftThumb.style.left = `${leftPosition}px`;
                rightThumb.style.left = `${rightPosition}px`;
            }
    </script>
    -->


         <!-- <script src="assets/js/priceScript.js"></script> -->

</body>
</html>