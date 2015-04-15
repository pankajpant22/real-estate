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
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.js"></script>

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	
	$('.newProperty').validate({
			rules : {
						name : {
								required : true
								},
						address : {
								required : true,
								maxlength: 50 
								},
						description : {
								required : true,
								minlength : 5,
								maxlength : 250
								},
						city : {
								required : true
								},
						zip : {
								required : true
								},
						price : {
								required : true,
								number: true,
								maxlength: 8
								},
						lat : {
								required : true,
								number: true
								},
						lng : {
								required : true,
								number: true
								}
				},
				
			highlight : function(element) {$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
											},
			unhighlight : function(element) {$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
											},

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
		<h2>${user.userName} New Property</h2>
		<span style="color: green; font-weight: bold;">${message}</span>
		<hr>
		<form:form  cssClass="form-horizontal newProperty" id="form">
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">Property Name:
				</label>
				<div class="col-sm-10">
					<input type="text" name = "name" class="form-control" id="name" placeholder="Property Name" >
				</div>
			</div>
			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">Address(max:50 character):
				</label>
				<div class="col-sm-10">
					<input type="text" name = "address" class="form-control" id="address" placeholder="Property Address" >
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-2 control-label">Description(max:250 character):
				</label>
				<div class="col-sm-10">
					<input type="text" name = "description" class="form-control" id="description" placeholder="Property Description" >
				</div>
			</div>
			<div class="form-group">
				<label for="city" class="col-sm-2 control-label">City:
				</label>
				<div class="col-sm-10">
					<input type="text" name = "city" class="form-control" id="city" placeholder="City" >
				</div>
			</div>
			<div class="form-group">
				<label for="zip" class="col-sm-2 control-label">Zip:
				</label>
				<div class="col-sm-10">
					<input type="text" name = "zip" class="form-control" id="zip" placeholder="Zip" pattern="[A-Za-z]">
				</div>
			</div>
			<div class="form-group">
					    <label for="bedno" class="col-sm-2 control-label">Bedroom</label>
					    <div class="col-sm-10">
					      <select  name = "bed" class="form-control">
							  <option>1</option>
							  <option>2</option>
							  <option>3</option>
							  <option>4</option>
							  <option>5</option>
						  </select>
					    </div>
			</div>
			<div class="form-group">
					    <label for="bath" class="col-sm-2 control-label">Bathroom</label>
					    <div class="col-sm-10">
					      <select name = "bath" class="form-control">
							  <option>1</option>
							  <option>2</option>
							  <option>3</option>
							  <option>4</option>
							  <option>5</option>
						  </select>
					    </div>
			</div>
			<div class="form-group">
					    <label for="price" class="col-sm-2 control-label">Price</label>
					    <div class="col-sm-10">
					      <input type="text" name = "price" class="form-control" id="price" placeholder="Price">
					    </div>
			</div>
			Use <a href="http://www.latlong.net/" target="_blank"><u>http://www.latlong.net/</u></a> for Latitude and Longitude
			<div class="form-group">
					    <label for="lat" class="col-sm-2 control-label">Latitude</label>
					    <div class="col-sm-10">
					      <input type="text" name = "lat" class="form-control" id="lat" placeholder="Latitude">
					    </div>
			</div>
			<div class="form-group">
					    <label for="lng" class="col-sm-2 control-label">Longitude</label>
					    <div class="col-sm-10">
					      <input type="text" name = "lng" class="form-control" id="lng" placeholder="Longitude">
					    </div>
			</div>
			<div class="form-group">
					    <label for="bath" class="col-sm-2 control-label">Type</label>
					    <div class="col-sm-10">
					      <select name = "type" class="form-control">
							  <option>Resident</option>
							  <option>Condo</option>
						  </select>
					    </div>
			</div>
			<div class="form-group">
					    <label for="bath" class="col-sm-2 control-label">Nearby Facility</label>
					    <div class="col-sm-10">
					      <select name = "facility" class="form-control">
							  <option value = "shopping">Shopping centers</option>
							  <option value="metro">Metro</option>
							  <option value="bus">Bus</option>
							  <option value="schools">Schools</option>
							  <option value="hospitals">Hospitals</option>
						  </select>
					    </div>
			</div>
			<div class="modal-footer">
					<input type="submit" value="Submit" class="btn btn-primary">
			</div>
		</form:form>
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

</body>
</html>





