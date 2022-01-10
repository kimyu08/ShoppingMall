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
  <link href="assets/css/button.css" rel="stylesheet">

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
    	<a href="/home.do"><img src="storage/logo.png"></a>
    	<br><br>
    </div><!-- 로고 End -->
    
    
    <!-- End Header -->