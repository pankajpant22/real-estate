<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Real Estate</title>
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

</head>
<body>

	<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href='<spring:url value="/"/>'>Real
				estate</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href='<spring:url value="/"/>'>Home</a></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href='<spring:url value="/admin.html"/>'>Admin
							Panel</a></li>
				</security:authorize>
				<security:authorize access="! isAuthenticated()">
					<li><a href='<spring:url value="/register.html"/>'>Register</a></li>
					<li><a href='<spring:url value="/login.html"/>'>Login</a></li>
				</security:authorize>
				<security:authorize access="hasAnyRole('ROLE_BUYER', 'ROLE_SELLER')">
					<li><a href='<spring:url value="/account.html"/>'>My
							Account</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li><a href='<spring:url value="/logout"/>'>Logout</a></li>
				</security:authorize>

			</ul>

		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>