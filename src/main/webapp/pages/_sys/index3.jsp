<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
<title>WebCam</title>
<meta charset="utf-8">
<meta content="text/html; charset=UTF-8" http-equiv="content-type">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="Taimax"  name="author">
<meta content="Tourism" name="description">
<meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
<link rel="icon" 		href="../resources/images/favicon.png" type="image/x-icon" />
<link rel="stylesheet" 	href="../resources/js/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" 	href="../resources/fonts/font-awesome/css/font-awesome.min.css">
<!--[if lt IE 9]>
<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<link rel="stylesheet" href="../resources/js/angular-module/ngSlider/dist/rg-slider.min.css">
<link rel="stylesheet" href="../resources/css/styles.css">
</head>
<body ng-app="webcamApp">
	<div class="wrapper">
		<div class="box">
			<div class="row">
				<div class="column col-sm-3" id="sidebar">
					<a class="logo" href="#/">
						<span class="logo-start">W</span>
						<span class="logo-name">EBCAM</span>
					</a>

					<ul class="nav">
						<li class="active"><a href="#/PhotoViewer">Photo</a></li>
						<li><a href="#/SettingsEdit">Settings</a></li>
						<c:if test="${debug}">
							<li><a href="#/standart_layout">Main</a></li>
							<li><a href="#/pricingPage">Pricing page</a></li>
						</c:if>
					</ul>
					<ul class="nav visible-xs-inline-block">
						<li><a href="../login?logout">Logout</a></li>
					</ul>
					<ul class="nav hidden-xs" id="sidebar-footer">
						<li><a href="../login?logout">Logout</a></li>
					</ul>
				</div>

				<div class="column col-sm-9" id="main">
					<div class="padding">
						<div class="full col-sm-9">
							<toaster-container toaster-options="{ 'position-class': 'toast-top-full-width' }"></toaster-container>
							<!-- <div class="row"> -->
							    <div class="col-md-2 col-md-offset-5" ng-show="loading">
									<i class="glyphicon glyphicon-refresh fa-spin fa-3x"></i>
							    </div>
							<!-- </div> -->
							<!-- 
							<div ng-show="loading" class="app-content-loading">
							</div>
							-->
							<ng-view ng-cloak class="app-content" ng-if="!loading"></ng-view>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/bootstrap/js/bootstrap.min.js"></script>
	-->
</body>
<jsp:include page="footer.jsp" />
</html>