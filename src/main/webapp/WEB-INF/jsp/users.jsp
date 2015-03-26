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
		
		 $(".sold").click(function(){
             var id = jQuery(this).find('input#id').val();
             var sold = jQuery(this).find('input#sold').val();
             if(sold == "1"){
            	 if (confirm('Are you sure this Property is SOLD ?')) {	
    	             $.ajax ({
    	                    url:"/account/updateProperty.html",
    	                    type:'POST',
    	                    data: {id:id,
    	                    	  sold:sold},
    	                    success:function(response){
    	                        location.reload();
    	                    }
    	                });
                 	}	 
             }else{
            	 if (confirm('Are you sure this Property is NOT SOLD ?')) {	
    	             $.ajax ({
    	                    url:"/account/updateProperty.html",
    	                    type:'POST',
    	                    data: {id:id,
    	                    	  sold:sold},
    	                    success:function(response){
    	                        location.reload();
    	                    }
    	                });
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
		<h2>${user.userName}  Properties Listing</h2>

		<hr>
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Address</th>
					<th>City</th>
					<th>Price</th>
					<th>Zip</th>
					<th>Published Date</th>
					<th>Messages</th>
					<th>Sold</th>
					<th>Date Sold</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${user.properties}" var="prop">
					<tr id="tr_id_1" class="tr-class-1">
						<td id="td_id_1" class="td-class-1">${prop.name}</td>
						<td>${prop.address}</td>
						<td>${prop.city}</td>
						<td>${prop.price}</td>
						<td>${prop.zip}</td>
						<td>${prop.publishedDate}</td>
						<td>${prop.message}</td>
						<c:choose>
      						<c:when test="${prop.sold =='1'}">
      						<td><a class="sold" href="#" onClick="return false;">
      							<img alt="sold" src="images/right.png">
      							<input type="hidden" id="id" name = "id" value="${prop.id}"/>
      							<input type="hidden" id="sold" name = "sold" value="0"/>
      						</a>
      						</td>
      						</c:when>
      						<c:otherwise>
      						<td><a class ="sold" href="#" onClick="return false;">
      							<img alt="sold" src="images/cross.png">
      							<input type="hidden" id="id" name = "id" value="${prop.id}"/>
      							<input type="hidden" id="sold" name = "sold" value="1"/>
      						</a>
      						</td>
					        </c:otherwise>
						</c:choose>
						<td>${prop.dateSold}</td>
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
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <div class="osLight footer-header">Get in Touch: Dipesh Walia</div>
                <ul class="footer-nav pb20">
                    <li class="footer-phone"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 438 402 52 02</li>
                    <li class="footer-address osLight">
                        <p>7141 Sherbrooke Street West</p>
                        <p>Montreal, Quebec H4B 1R6</p>
                        <p>Canada</p>
                    </li>
                </ul>
            </div>
            
        </div>
        <div class="copyright">iWebEstate Real estate Online application<br> &copy; CoolBreeze 2015</div>
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





