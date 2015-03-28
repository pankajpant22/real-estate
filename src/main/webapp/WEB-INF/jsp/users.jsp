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

		$('.propertyRemoveTrigger').click(function(e) {
			e.preventDefault();
			$("#propertyRemove .removeBtn").attr("href", $(this).attr("href"));
			$('#propertyRemove').modal();
		});
		
		$('.newProperty').formValidation({
	        framework: 'bootstrap',
	        icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	name: {
	                validators: {
	                    notEmpty: {
	                        message: 'The username is required'
	                    }
	                }
	            },
	            password: {
	                validators: {
	                    notEmpty: {
	                        message: 'The password is required'
	                    }
	                }
	            }
	        }
	    });
		
		
		/*
		$('.newProperty').validate(
				{
					rules : {
						name : {required : true},
						address : {required : true},
						description:{required:true},
						city:{required:true},
						zip:{required:true},
						price:{required:true},
						lat:{required:true},
						lng:{required:true},
						type:{required:true}
					}
				});

		*/
		
		
		/*       
		$(".sold").click(function() {
			var id = jQuery(this).find('input#id').val();
			var sold = jQuery(this).find('input#sold').val();
			if (sold == "1") {
				if (confirm('Are you sure this Property is SOLD ?')) {
					$.ajax({
						url : "/account/updateProperty.html",
						type : 'POST',
						data : {
							id : id,
							sold : sold
						},
						success : function(response) {
							location.reload();
						}
					});
				}
			} else {
				if (confirm('Are you sure this Property is NOT SOLD ?')) {
					$.ajax({
						url : "/account/updateProperty.html",
						type : 'POST',
						data : {
							id : id,
							sold : sold
						},
						success : function(response) {
							location.reload();
						}
					});
				}
			}

		});
		*/

	});
</script>

</head>
<body class="notransition no-hidden">

	<div>
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
	</div>

	<!-- Content -->

	<div class="home-wrapper">
		<br> <br>
		<h2>${user.userName}Properties Listing</h2>
		<hr>
		<span style="color: green; font-weight: bold;">${message}</span>
		<security:authorize access="hasRole('ROLE_SELLER')">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">New Property</button>
		</security:authorize>
		<hr>
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Address</th>
					<th>City</th>
					<th>Price</th>
					<th>Zip</th>
					<security:authorize access="hasRole('ROLE_SELLER')">
					<th>Published Date</th>
					<th>Messages</th>
					<th>Sold</th>
					<th>Date Sold</th>
					</security:authorize>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${user.properties}" var="prop">
					<tr id="tr_id_1" class="tr-class-1">
						<td id="td_id_1" class="td-class-1"><a
							href='<spring:url value="/property/update/${prop.id}.html"/>'>
								<c:out value="${prop.name}" />
						</a></td>
						<td>${prop.address}</td>
						<td>${prop.city}</td>
						<td>$${prop.price}</td>
						<td>${prop.zip}</td>
						
						<security:authorize access="hasRole('ROLE_SELLER')">
						<td>${prop.publishedDate}</td>
						<td>${prop.message}</td>
						<c:choose>
							<c:when test="${prop.sold =='1'}">
								<td><img alt="sold" src="images/right.png"></td>
							</c:when>
							<c:otherwise>
								<td><img alt="sold" src="images/cross.png"> </td>
							</c:otherwise>
						</c:choose>
						<td>${prop.dateSold}</td>
						</security:authorize>
						<td><a
							href='<spring:url value="/admin/property/delete/${prop.id}.html"/>'
							class="btn btn-danger propertyRemoveTrigger">Remove</a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>


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


	<!-- Modal -->
	<div class="modal fade" id="propertyRemove" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Delete Property</h4>
				</div>
				<div class="modal-body">Are You Sure ?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<a href="" class="btn btn-danger removeBtn">Delete</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">New Property</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal newProperty" method="post">
					  <div class="form-group">
					    <label for="name" class="col-sm-2 control-label">Name</label>
					    <div class="col-sm-10">
					      <input type="text" name = "name" class="form-control" id="name" placeholder="Name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="address" class="col-sm-2 control-label">Address</label>
					    <div class="col-sm-10">
					      <input type="address" name = "address" class="form-control" id="address" placeholder="Address" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="description" class="col-sm-2 control-label">Short Description</label>
					    <div class="col-sm-10">
					      <input type="description" name = "description" class="form-control" id="description" 
					      placeholder="description" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="city" class="col-sm-2 control-label">City</label>
					    <div class="col-sm-10">
					      <input type="city"  name = "city" class="form-control" id="city" 
					      placeholder="City" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="zip" class="col-sm-2 control-label">Zip</label>
					    <div class="col-sm-10">
					      <input type="zip" name = "zip" class="form-control" id="zip" placeholder="Zip" required>
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
					      <input type="price"  name = "price" class="form-control" id="price" placeholder="Price" required>
					    </div>
					  </div>
					   Use <a href="http://www.latlong.net/"><u>http://www.latlong.net/</u></a> for Latitude and Longitude
					  <div class="form-group">
					    <label for="lat" class="col-sm-2 control-label">latitude</label>
					    <div class="col-sm-10">
					      <input type="lat" name = "lat" class="form-control" id="lat" placeholder="Latitude" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="lng" class="col-sm-2 control-label">Longitude</label>
					    <div class="col-sm-10">
					      <input type="lng" name = "lng" class="form-control" id="lng" placeholder="Longitude" required>
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
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" value="Submit" class="btn btn-primary">
				</div>
				</form> 
				</div>
				
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


</body>
</html>





