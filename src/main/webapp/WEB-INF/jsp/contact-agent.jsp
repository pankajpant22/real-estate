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

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="url">${pageContext.request.requestURL}</c:set>
<base
	href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />


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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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


<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.contactForm')
								.validate(
										{
											rules : {
												email : {
													required : true,
													email : true
												},
												username : {
													required : true
												}
											}
										});

					});
</script>

</head>
<body class="notransition no-hidden">

	<div>
		<div class="home-header">
			<a href='<spring:url value="/"/>'>
        	<div class="home-logo osLight">
				<span class="glyphicon glyphicon-home" aria-hidden="true"></span>iWebEstate
			</div>
			</a>
			<a href="#" class="home-navHandler visible-xs"><span
				class="fa fa-bars"></span></a>
			<div class="home-nav">
				<ul>
					<li style="font-size: 200%; color: red;">Welcome ${name}</li>

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
	</div>

	<!-- Content -->

	<div class="home-wrapper">
		<br> <br>
		<h2>Contact Seller</h2>
		<span style="color:green; font-weight: bold;">${message}</span>
		
		<hr>
		<!--Start Contact form -->
		<form role="form" class = "contactForm" method="post">
    		<div class="form-group">
      			<label for="name">Property Name:</label>
      			&nbsp;&nbsp;
      			<label for="name">${property.name}</label>
      		</div>
    		<div class="form-group">
      			<label for="address">Property Address:</label>
      			&nbsp;&nbsp;
      			<label for="address">${property.address}</label>
      		</div>
      		<div class="form-group">
      			<label for="price">Property Price:</label>
      			&nbsp;&nbsp;
      			<label for="price">$ ${property.price}</label>
      		</div>
      		<div class="form-group">
      			<label for="username">Contact User Name (Required):</label>
      			<input type="username" class="form-control" id="username" name = "username" placeholder="Enter User Name">
    		</div>
    		<div class="form-group">
      			<label for="email">Contact Email:</label>
      			<input type="email" class="form-control" id="email" name = "email" placeholder="Enter email">
    		</div>
    		<div class="form-group">
      		<label for="message">Any Message (Optional)</label>
      		<input type="text" class="form-control" id="msg" name="msg" placeholder="Message">
    		</div>
    		<input type="hidden" name = "seller_email" value="${user.email}"/>
    		<input type="submit" class="btn btn-default" value="Submit"/>
  		</form>
		<!--End Contact form -->
		<!--  Paypal -->
		<hr>
		
		<form action="${initParam['posturl']}" method = "post">
			<input type="hidden" name = "upload" value = "1"/>
			<input type="hidden" name = "return" value = "${initParam['returnurl']}"/>
			<input type="hidden" name = "cmd" value = "_cart"/>
			<input type="hidden" name = "business" value = "${initParam['business']}"/>
		
			<!-- Product 1 -->
			<input type="hidden" name = "item_name_1" value = "Product 1"/>
			<input type="hidden" name = "item_number_1" value = "Token"/>
			<input type="hidden" name = "quantity_1" value = "1"/>
		<table>
			<tr>
				<td>Pay the Token Money :</td>
				<td><input type="text" name = "amount_1" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="image" src = "
			https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"/>
				</td>
			</tr>
		
		</table>
		 
		</form>
		

	</div>

	<!-- Footer -->

	<div class="home-footer">
		<div class="home-wrapper">
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
					<div class="osLight footer-header">Real Estate Information</div>
					<ul class="footer-nav pb20">
						<li><a href='<spring:url value="/about.html"/>'>About</a></li>
						<li><a href='<spring:url value="/team.html"/>'>Team</a></li>
						<li><a href='<spring:url value="/terms.html"/>'>Terms & Privacy</a></li>
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

</body>
</html>
