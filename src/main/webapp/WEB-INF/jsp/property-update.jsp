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
<link rel="stylesheet" media="all" type="text/css"
	href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />

<link rel="stylesheet" media="all" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css
" />




<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<script type="text/javascript">
	$(document).ready(function() {
		$("#dtBox").DateTimePicker();

		$('.updateProperty').validate({
			rules : {
				userSold : {
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
			<div class="home-logo osLight">
			<a href='<spring:url value="/"/>'>
        		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>iWebEstate
			</a>
			</div>
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
		<h2>Update Property</h2>
		<span style="color: green; font-weight: bold;">${message}</span>

		<hr>
		<!--Start Contact form -->
		<form class="form-horizontal updateProperty" method="post">
			<div class="form-group">
				<label class="col-sm-2 control-label">Property Name</label>
				<div class="col-sm-10">
					<p class="form-control-static">${property.name}</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Property Address</label>
				<div class="col-sm-10">
					<p class="form-control-static">${property.address}</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Message Recieved</label>
				<div class="col-sm-10">
					<p class="form-control-static">${property.message}</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Sold</label>
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<c:choose>
							<c:when test="${property.sold == 1}">
								<label> <input name="sold" value="1" type="checkbox" checked>Sold</label> 
								<label> <input name="sold" value="0" type="checkbox">Not Sold</label>	
      						</c:when>
							<c:otherwise>
								<label> <input name="sold" value="1" type="checkbox">Sold</label> 
								<label> <input name="sold" value="0" type="checkbox" checked>Not Sold</label>	
      						</c:otherwise>
						</c:choose>
						
					</div>
				</div>

			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Date Sold</label>
				<div class="col-sm-10">
					<input type="text" name="dateSold" data-field="datetime"
						placeholder="Date Sold" value="${property.dateSold}" readonly>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Sold to (User Name)</label>
				<div class="col-sm-10">
					<input type="text" name="userSold" placeholder="Sold to User" >
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-default" value="Update" />
				</div>
			</div>
			<div id="dtBox"></div>

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

	<!-- Latest compiled and minified JavaScript -->

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
	<link rel="stylesheet" type="text/css" href="css/DateTimePicker.css" />
	<script type="text/javascript" src="js/DateTimePicker.js"></script>


	<script type="text/javascript"
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$('.checkbox input').on('change', function() {
				$('.checkbox input').not(this).prop('checked', false);
			});

		});
	</script>

</body>
</html>
