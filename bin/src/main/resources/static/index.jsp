<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>5조 쇼핑몰</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Green - v4.7.0
  * Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
<header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="/home.do">Logo</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="login.do">LOGIN</a></li>
          <li><a class="nav-link scrollto" href="join.do">JOIN</a></li>
          <li><a class="nav-link scrollto " href="cart.do">CART</a></li>
          <li><a class="nav-link scrollto" href="order.do">ORDER</a></li>
          <li><a class="nav-link scrollto" href="mypage.do">MY PAGE</a></li>
          <li><a class="nav-link scrollto" href="notice.do">NOTICE</a></li>
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>    
  
  </header>
  
  	<!-- 로고 시작 -->
    <div align="center">
    	<a href="/home.do"><img src="./assets/img/logo.png"></a>
    	<br><br>
    </div><!-- 로고 End -->
    
    <!-- 메인 메뉴 시작 -->
    <div> 
    	<ul style="text-align:center;" >
          <li style="display:inline-block; border-bottom: 1px solid #000000;"><a class="nav-link" style="color:black;" href="/best.do">Best</a></li>
          <li style="display:inline-block; border-bottom: 1px solid #000000;"><a class="nav-link" style="color:black;" href="/new.do">New</a></li>
          <li style="display:inline-block; border-bottom: 1px solid #000000;"><a class="nav-link" style="color:black;" href="/outer.do">OUTER</a></li>
          <li style="display:inline-block; border-bottom: 1px solid #000000;"><a class="nav-link" style="color:black;" href="/top.do">TOP</a></li>
          <li style="display:inline-block; border-bottom: 1px solid #000000;"><a class="nav-link" style="color:black;" href="/pants.do">PANTS</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
    
    <!-- End Header -->

  <!-- ======= 메인 사진 Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(assets/img/mainphoto.png)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">안녕하세요 5조 쇼핑몰 LOGO입니다~</h2>
              <p class="animate__animated animate__fadeInUp">슬라이드 됩니다!!! 사진 링크 걸어야함.</p>
              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Read More</a>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(assets/img/mainphoto1.jpg)"></div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(assets/img/mainphoto2.jpg)"></div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section><!-- End 메인 사진 -->

  <main id="main">
		
    <!-- ======= Weekly Best Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <br>
      <div class="container">
		<div class="section-title">
          <h2>Weekly Best</h2>
        </div>
        
        <div class="row no-gutters">
          <div class="col-lg-4 col-md-6">
            <div class="icon-box">
              <img src="assets/img/photo1.gif" class="img-fluid">
              <h4 class="title"><a href="">반집업 니트 맨투맨 &nbsp;</a>21,900원</h4>
              <p class="description">상품 간단한 설명21,900원</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box">
              <img src="assets/img/photo2.gif" class="img-fluid">
              <h4 class="title"><a href="">숏패딩 &nbsp;</a>59,900원</h4>
              <p class="description">상품 간단한 설명59,900원</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box">
              <img src="assets/img/photo3.gif" class="img-fluid">
              <h4 class="title"><a href="">와이트 트임 슬랙스 &nbsp;</a>39,900원</h4>
              <p class="description">상품 간단한 설명39,900원</p>
            </div>
          </div>      
        </div>
      </div>
    </section><!-- End Weekly Best Section -->

	<!-- ======= 카테고리별 Best상품 Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>카테고리별 Best 상품</h2>
          <p> ajax는 나중에 따로 추가해야함.</p>
        </div>

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-top">TOP</li>
              <li data-filter=".filter-outer">OUTER</li>
              <li data-filter=".filter-pants">PANTS</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-top">
            <div class="portfolio-wrap">
              <img src="assets/img/photo1.gif" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>반집업 니트 맨투맨</h4>
                <p>21,900원</p>
                <div class="portfolio-links">
                  <a href="assets/img/photo1.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-outer">
            <div class="portfolio-wrap">
              <img src="assets/img/photo2.gif" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>숏패딩</h4>
                <p>59,900원</p>
                <div class="portfolio-links">
                  <a href="assets/img/photo1.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-pants">
            <div class="portfolio-wrap">
              <img src="assets/img/photo3.gif" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>와이드 트임 슬랙스</h4>
                <p>39,900원</p>
                <div class="portfolio-links">
                  <a href="assets/img/photo1.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>        

        </div>

      </div>
    </section><!-- End 카테고리별 Best상품 Section -->
</main>

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <h3>5조 쇼핑몰</h3>
      <p>사진 출처: 로댄티 상업용X 단순 공부용 페이지</p>
      <div class="social-links">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
      <div class="copyright">
        &copy; Copyright <strong><span>Green</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/green-free-one-page-bootstrap-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>