<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<c:set var="url">${pageContext.request.requestURL}</c:set>
<base
	href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>reales | real estate web application</title>
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/simple-line-icons.css" rel="stylesheet">
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/datepicker.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/app.css" rel="stylesheet" id="app">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css"
	rel="stylesheet" />

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->



</head>
<body class="notransition">

	<!-- Header -->

	<div id="header">
		<div class="logo">
			<a href="index.html">
				<div class="home-logo osLight">
				<a href='<spring:url value="/"/>'>
        			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
				</a>
				</div>
			</a>
		</div>
		<div class="headerUserWraper">
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

	<!-- Left Side Navigation -->

	<div id="leftSide"></div>

	<!-- Content -->

	<div id="wrapper">
		<div id="mapView">
			<div class="mapPlaceholder">
				<span class="fa fa-spin fa-spinner"></span> Loading map...
			</div>
		</div>
		<div id="content">
			<!--
			<form action="/sort.html" method="post">
			<div class="filter">
				<h1 class="osLight">Sort your results</h1>
				<input type="hidden" name="data" 
					value="<c:forEach items="${propertyList}" var="property">
					${property.price},</c:forEach>">
				<select id = "sType" name="sType" class="form-control">
								<option value="DESC">Descending</option>
								<option value="ASC">Ascending</option>
				</select>
				<br>
				<input type="submit" class="btn btn-default sortBtn" value="Submit" />
				<div class="clearfix"></div>
			<br>
			</div>
			</form>
			-->
			<h1 class="osLight">Search Result</h1>
			<div class="resultsList">

				<div class="row">
					<c:forEach items="${propertyList}" var="property">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							<a href='<spring:url value="/property/${property.id}.html"/>'
								class="card">
								<div class="figure">
									<img src="images/prop/${property.id}-1.png" alt="image">
									<div class="figCaption">
										<div>$ ${property.price}</div>
									</div>
									<div class="figType">FOR ${property.type}</div>
								</div>
								<h2>${property.name}</h2>
								<div class="cardAddress">
									<span class="icon-pointer"></span> ${property.address }
								</div>
								<ul class="cardFeat">
									<li><span class="fa fa-moon-o"></span>${property.bedroom}</li>
									<li><span class="icon-drop"></span>${property.bathroom}</li>
								</ul>
								<div class="clearfix"></div>
							</a>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>

	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery-ui-touch-punch.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<script src="js/jquery.placeholder.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.touchSwipe.min.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
	<script
		src="http://maps.googleapis.com/maps/api/js?sensor=true&amp;libraries=geometry&amp;libraries=places"
		type="text/javascript"></script>
	<script src="js/infobox.js"></script>
	<script src="js/jquery.tagsinput.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>

	<script type="text/javascript">

	var properties = [
		<c:forEach items="${propertyList}" var="property">
                      {
        				title : "'${property.name}'",
        				image : "${property.id}-1-thmb.png",
        				type : 'For ${property.type}',
        				price : "'$ ${property.price}'",
        				address : "'${property.address}'",
        				bedrooms : "'${property.bedroom}'",
        				bathrooms : "'${property.bathroom}'",
        				area : '2750 Sq Ft',
        				position : {
            						lat : '${property.lat}',
            						lng : '${property.lng}'
        				},
        				markerIcon : "office-building.png"
    					},
    	</c:forEach>
    					];
	
</script>

	<script src="js/appnew.js" type="text/javascript"></script>

</body>
</html>