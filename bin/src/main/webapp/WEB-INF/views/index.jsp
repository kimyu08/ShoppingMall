<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <li><a class="nav-link scrollto active" href="home.do">Home</a></li>
          <c:choose>
          	<c:when test="${empty sessionScope.s_id}">
          		<li><a class="nav-link scrollto" href="login.do">LOGIN</a></li>
          		<li><a class="nav-link scrollto" href="join.do">JOIN</a></li>
          		<li><a class="nav-link scrollto " href="cart.do">CART</a></li>
         		 <li><a class="nav-link scrollto" href="checkorder.do">ORDER</a></li>
         		 <li><a class="nav-link scrollto" href="login.do">MY PAGE</a></li>
          	</c:when>
          	<c:when test="${not empty sessionScope.s_id}">
          		<li><a class="nav-link scrollto" href="logout.do">LOGOUT</a></li>   
          		<li><a class="nav-link scrollto " href="cart.do">CART</a></li>
          		<li><a class="nav-link scrollto" href="checkorder.do">ORDER</a></li>
          		<c:if test="${sessionScope.s_rights eq 1}">
          			<li><a class="nav-link scrollto" href="mypage.do">MY PAGE</a></li>
          		</c:if>
          		<c:if test="${sessionScope.s_rights eq 2}">
          			<li><a class="nav-link scrollto" href="mypage.do">Manager</a></li>
          		</c:if>     		
          	</c:when>         	
          </c:choose>
          <li><a class="nav-link scrollto" href="notice.do">NOTICE</a></li>
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
    <div align="right" style="margin-right: 150px">
		<form class="searchForm" action="search.do">
			<input type="text" name="search" id="search">
			<input type="image" src="storage/search.png" style="width: 20px">
		</form>    
	</div>
    <div align="center">
    	<ul class="mainmenu" >
          <li><a href="productList.do?list=best">Best</a></li>
          <li><a href="productList.do?list=new">New</a></li>
          <li><a href="productList.do?list=outer">OUTER</a></li>
          <li><a href="productList.do?list=top">TOP</a></li>
          <li><a href="productList.do?list=pants">PANTS</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
    
    <!-- End Header -->

  <!-- ======= 메인 사진 Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(assets/img/mainphoto.png); height:auto;" onclick="location.href='home.do'" >
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">안녕하세요 5조 쇼핑몰 LOGO입니다~</h2>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(assets/img/mainphoto1.jpg); background-size:auto;" onclick="location.href='productDetail.do?pcode=t4004'"></div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(assets/img/mainphoto2.jpg); background-size:auto;" onclick="location.href='productDetail.do?pcode=p3010'"></div>

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
              <img src="assets/img/photo1.gif" class="img-fluid"  onclick="location.href='productDetail.do?pcode=t3001'">
              <h4 class="title"><a href="productDetail.do?pcode=t3001">반집업 니트 맨투맨 &nbsp;</a>21,900원</h4>
              <p class="description">F/W시즌에 잘 어울리는 편안한 맨투맨21,900원</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box">
              <img src="assets/img/photo2.gif" class="img-fluid" onclick="location.href='productDetail.do?pcode=o2005'">
              <h4 class="title"><a href="productDetail.do?pcode=o2005">베스트 더블 점퍼 &nbsp;</a>59,900원</h4>
              <p class="description">데일리하게 입기좋은 더블 점퍼59,900원</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box">
              <img src="assets/img/photo3.gif" class="img-fluid" onclick="location.href='productDetail.do?pcode=p3008'">
              <h4 class="title"><a href="productDetail.do?pcode=p3008">기모 밴딩 팬츠 &nbsp;</a>39,900원</h4>
              <p class="description">탄탄한 발열 기모팬츠39,900원</p>
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
              <img src="assets/img/photo1.gif" class="img-fluid" alt="" onclick="location.href='productDetail.do?pcode=t3001'">
              <div class="portfolio-info">
                <h4>반집업 니트 맨투맨</h4>
                <p>21,900원</p>
                <div class="portfolio-links">
                  <a href="assets/img/photo1.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="반집업 니트 맨투맨"><i class="bx bx-plus"></i></a>
                  <a href="productDetail.do?pcode=t3001" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-top">
            <div class="portfolio-wrap">
              <img src="/storage/제인트 브이넥 니트.gif" class="img-fluid" alt="" onclick="location.href='productDetail.do?pcode=t4002'">
              <div class="portfolio-info">
                <h4>제인트 브이넥 니트</h4>
                <p>27,000원</p>
                <div class="portfolio-links">
                  <a href="/storage/제인트 브이넥 니트.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="제인트 브이넥 니트"><i class="bx bx-plus"></i></a>
                  <a href="productDetail.do?pcode=t4002" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-outer">
            <div class="portfolio-wrap">
              <img src="assets/img/photo2.gif" class="img-fluid" alt="" onclick="location.href='productDetail.do?pcode=o2005'">
              <div class="portfolio-info">
                <h4>베스트 더블 점퍼</h4>
                <p>59,900원</p>
                <div class="portfolio-links">
                  <a href="assets/img/photo2.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="베스트 더블 점퍼"><i class="bx bx-plus"></i></a>
                  <a href="productDetail.do?pcode=o2005" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-outer">
            <div class="portfolio-wrap">
              <img src="/storage/퀄리티 면 무스탕.gif" class="img-fluid" alt="" onclick="location.href='productDetail.do?pcode=o2010'">
              <div class="portfolio-info">
                <h4>퀄리티 면 무스탕</h4>
                <p>59,900원</p>
                <div class="portfolio-links">
                  <a href="/storage/퀄리티 면 무스탕.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="퀄리티 면 무스탕"><i class="bx bx-plus"></i></a>
                  <a href="productDetail.do?pcode=o2010" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-pants">
            <div class="portfolio-wrap">
              <img src="assets/img/photo3.gif" class="img-fluid" alt="" onclick="location.href='productDetail.do?pcode=p3008'">
              <div class="portfolio-info">
                <h4>기모 밴딩 팬츠</h4>
                <p>32,900원</p>
                <div class="portfolio-links">
                  <a href="assets/img/photo3.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="기모 밴딩 팬츠"><i class="bx bx-plus"></i></a>
                  <a href="productDetail.do?pcode=p3008" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>        
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-pants">
            <div class="portfolio-wrap">
              <img src="/storage/트레이닝 팬츠.gif" class="img-fluid" alt="" onclick="location.href='productDetail.do?pcode=p3010'">
              <div class="portfolio-info">
                <h4>트레이닝 팬츠</h4>
                <p>18,900원</p>
                <div class="portfolio-links">
                  <a href="/storage/트레이닝 팬츠.gif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="트레이닝 팬츠"><i class="bx bx-plus"></i></a>
                  <a href="productDetail.do?pcode=p3010" title="More Details"><i class="bx bx-link"></i></a>
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