<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>real estate web application</title>
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/simple-line-icons.css" rel="stylesheet">
<link href="css/fullscreen-slider.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/app.css" rel="stylesheet" id="app">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body class="notransition no-hidden">

	<!-- Hero -->

	<div id="hero-container">
		<ul class="cb-slideshow">
			<li><span></span></li>
			<li><span></span></li>
			<li><span></span></li>
			<li><span></span></li>
			<li><span></span></li>
			<li><span></span></li>
		</ul>
		<div class="home-header">
			<div class="home-logo osLight">
				<span class="glyphicon glyphicon-home" aria-hidden="true"></span>iWebEstate
			</div>
			<a href="#" class="home-navHandler visible-xs"><span
				class="fa fa-bars"></span></a>
			<div class="home-nav">
				<ul>
					<li><a href='<spring:url value="/"/>'
						class="btn btn-green isThemeBtn">Home</a></li>
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href='<spring:url value="/admin.html"/>'
							class="btn btn-green isThemeBtn">Admin</a></li>
					</security:authorize>
					<security:authorize
						access="hasAnyRole('ROLE_BUYER', 'ROLE_SELLER')">
						<li><a href='<spring:url value="/account.html"/>'
							class="btn btn-green isThemeBtn">Account</a></li>
					</security:authorize>
					<security:authorize access="! isAuthenticated()">
						<li><a href='<spring:url value="/register.html"/>'
							class="btn btn-green isThemeBtn">Register</a></li>
						<li><a href='<spring:url value="/login.html"/>'
							class="btn btn-green isThemeBtn">Login</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li><a href='<spring:url value="/logout"/>'
							class="btn btn-green isThemeBtn">Logout</a></li>
					</security:authorize>
					<li></li>

				</ul>
			</div>
		</div>
		<div class="home-caption">
			<div class="home-title">Easily Find your home</div>
			<div class="home-subtitle">With iWebEstate</div>
		</div>
		<div class="search-panel">
			<form class="form-inline" role="form" action='/search.html'
				method="post">
				<div class="form-group">
					<input type="text" name="city" class="form-control" id="city"
						placeholder="City" autocomplete="off">
				</div>
				<div class="form-group hidden-xs adv">
					<a href="#" data-toggle="dropdown"
						class="btn btn-white dropdown-toggle"> <span
						class="dropdown-label">Bedrooms</span> <span class="caret"></span>
					</a>
					<ul class="dropdown-menu dropdown-select">
						<li class="active"><input type="radio" name="bedno"
							checked="checked" value="0"><a href="#">Bedroom</a></li>
						<li><input type="radio" name="bedno" value="1"><a
							href="#">1</a></li>
						<li><input type="radio" name="bedno" value="2"><a
							href="#">2</a></li>
						<li><input type="radio" name="bedno" value="3"><a
							href="#">3</a></li>
						<li><input type="radio" name="bedno" value="4"><a
							href="#">4</a></li>
					</ul>
				</div>
				<div class="form-group hidden-xs adv">
					<a href="#" data-toggle="dropdown"
						class="btn btn-white dropdown-toggle"> <span
						class="dropdown-label">Bathrooms</span> <span class="caret"></span>
					</a>
					<ul class="dropdown-menu dropdown-select">
						<li class="active"><input type="radio" name="bathno"
							checked="checked" value="0"><a href="#">Bathroom</a></li>
						<li><input type="radio" name="bathno" value="1"><a
							href="#">1</a></li>
						<li><input type="radio" name="bathno" value="2"><a
							href="#">2</a></li>
						<li><input type="radio" name="bathno" value="3"><a
							href="#">3</a></li>
						<li><input type="radio" name="bathno" value="4"><a
							href="#">4</a></li>
					</ul>
				</div>
				<div class="form-group hidden-xs adv">
					<a href="#" data-toggle="dropdown"
						class="btn btn-white dropdown-toggle"> <span
						class="dropdown-label">Nearby Facilities</span> <span
						class="caret"></span>
					</a>
					<ul class="dropdown-menu dropdown-select">
						<li class="active"><input type="radio" name="facility"
							checked="checked"><a href="#">Facilities</a></li>
						<li><input type="radio" name="facility" value="shopping"><a
							href="#">Shopping centers</a></li>
						<li><input type="radio" name="facility" value="metro"><a
							href="#">Metro</a></li>
						<li><input type="radio" name="facility" value="bus"><a
							href="#">Bus</a></li>
						<li><input type="radio" name="facility" value="schools"><a
							href="#">Schools</a></li>
						<li><input type="radio" name="facility" value="hospitals"><a
							href="#">Hospitals</a></li>
					</ul>
				</div>
				<div class="form-group hidden-xs adv">
					<div class="input-group">
						<div class="input-group-addon">$</div>
						<input class="form-control price" type="text" placeholder="From"
							name="priceFrom">
					</div>
				</div>
				<div class="form-group hidden-xs adv">
					<div class="input-group">
						<div class="input-group-addon">$</div>
						<input class="form-control price" type="text" placeholder="To"
							name="priceTo">
					</div>
				</div>
				<div class="form-group hidden-xs adv">
					<a href="#" data-toggle="dropdown"
						class="btn btn-white dropdown-toggle"> <span
						class="dropdown-label">Type</span> <span class="caret"></span>
					</a>
					<ul class="dropdown-menu dropdown-select">
						<li class="active"><input type="radio" name="type"
							checked="checked"><a href="#">Type</a></li>
						<li><input type="radio" name="type" value="resident"><a
							href="#">Residential</a></li>
						<li><input type="radio" name="type" value="condo"><a
							href="#">Condo</a></li>
					</ul>
				</div>
				<div class="form-group">
					<input type="submit" value="Search"
						class="btn btn-green isThemeBtn">
				</div>
			</form>
		</div>
	</div>

	<!-- Content -->
	<div class="home-wrapper">
		<div class="home-content">
			<h2 class="osLight">Recently Listed Properties</h2>
			<div class="row pb40">
				<c:forEach items="${propertyList}" var="property">
					<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							<a href='<spring:url value="/property/${property.id}.html"/>'
							class="propWidget-2">
							<div class="fig">
								<c:choose>
									<c:when test="${property.sold == 1}">
									<img id ="soldImage" src="images/sold/${property.id}-1.png" alt="${property.name}">
									</c:when>
									<c:otherwise>
									<img src="images/prop/${property.id}-1.png" alt="${property.name}">
									<img class="blur" src="images/prop/${property.id}-1.png" alt="${property.name}">
									<div class="opac"></div>
									<div class="priceCap osLight">
										<span>$${property.price}</span>
									</div>
									<div class="figType">FOR ${property.type}</div>
									<h3 class="osLight">${property.name}</h3>
									<div class="address">${property.address}</div>
									</c:otherwise>
								</c:choose>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<ul class="pagination">
			<li><a href="/index.html?page=0">1</a></li>
			<li><a href="/index.html?page=1">2</a></li>
			<li><a href="/index.html?page=2">3</a></li>
			<li><a href="/index.html?page=3">4</a></li>
			<li><a href="/index.html?page=4">5</a></li>
		</ul>
	</div>

	<!-- Footer -->

	<div class="home-footer">
		<div class="home-wrapper">
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
					<div class="osLight footer-header">Real Estate Information</div>
					<ul class="footer-nav pb20">
						<li><a href="#">About</a></li>
						<li><a href="#">Team</a></li>
						<li><a href="#">Terms & Privacy</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3"></div>
				<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
					<div class="osLight footer-header">Get in Touch: Dipesh Walia</div>
					<ul class="footer-nav pb20">
						<li class="footer-phone"><span
							class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
							438 402 52 02</li>
						<li class="footer-address osLight">
							<p>7141 Sherbrooke Street West</p>
							<p>Montreal, Quebec H4B 1R6</p>
							<p>Canada</p>
						</li>
					</ul>
				</div>

			</div>
			<div class="copyright">
				iWebEstate Real estate Online application<br> &copy; CoolBreeze
				2015
			</div>
		</div>
	</div>

	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery-ui-touch-punch.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<script src="js/jquery.placeholder.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.touchSwipe.min.js"></script>
	<script
		src="http://maps.googleapis.com/maps/api/js?sensor=true&amp;libraries=geometry&amp;libraries=places"
		type="text/javascript"></script>
	<script src="js/infobox.js"></script>
	<script src="js/jquery.visible.js"></script>
	<script src="js/home.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input.checkbox').on('change', function() {
				$('input.checkbox').not(this).prop('checked', false);
			});

			// for active pagination
			var url = window.location;

			$('ul.pagination a').filter(function() {
				return this.href == url;
			}).parent().addClass('active');
			
			
		});
	</script>



</body>
</html>