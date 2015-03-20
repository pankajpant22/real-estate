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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>real estate web application</title>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
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
        <div class="home-logo osLight"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>iWebEstate</div>
        <a href="#" class="home-navHandler visible-xs"><span class="fa fa-bars"></span></a>
        <div class="home-nav">
            <ul>
                <li><a href='<spring:url value="/"/>' class="btn btn-green isThemeBtn">Home</a></li>
                <security:authorize access="hasRole('ROLE_ADMIN')">
                	<li><a href='<spring:url value="/admin.html"/>' class="btn btn-green isThemeBtn">Admin</a></li>
                </security:authorize>
                <security:authorize access="hasAnyRole('ROLE_BUYER', 'ROLE_SELLER')">
                	<li><a href='<spring:url value="/account.html"/>' class="btn btn-green isThemeBtn">Account</a></li>
                </security:authorize>
                <security:authorize access="! isAuthenticated()">
                	<li><a href='<spring:url value="/register.html"/>' class="btn btn-green isThemeBtn">Register</a></li>
                	<li><a href='<spring:url value="/login.html"/>' class="btn btn-green isThemeBtn">Login</a></li>
                </security:authorize>
                <security:authorize access="isAuthenticated()">
                	<li><a href='<spring:url value="/logout"/>' class="btn btn-green isThemeBtn">Logout</a></li>
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
        <form class="form-inline" role="form">
            <div class="form-group">
                <input type="text" class="form-control" id="city" placeholder="City" autocomplete="off">
            </div>
            <div class="form-group hidden-xs adv">
                <a href="#" data-toggle="dropdown" class="btn btn-white dropdown-toggle">
                    <span class="dropdown-label">Bedrooms</span> <span class="caret"></span>
                </a>
                <ul class="dropdown-menu dropdown-select">
                    <li class="active"><input type="radio" name="bedno" checked="checked"><a href="#">Bedrooms</a></li>
                    <li><input type="radio" name="bedno"><a href="#">1</a></li>
                    <li><input type="radio" name="bedno"><a href="#">2</a></li>
                    <li><input type="radio" name="bedno"><a href="#">3</a></li>
                    <li><input type="radio" name="bedno"><a href="#">4</a></li>
                </ul>
            </div>
            <div class="form-group hidden-xs adv">
                <a href="#" data-toggle="dropdown" class="btn btn-white dropdown-toggle">
                    <span class="dropdown-label">Bathrooms</span> <span class="caret"></span>
                </a>
                <ul class="dropdown-menu dropdown-select">
                    <li class="active"><input type="radio" name="bathno" checked="checked"><a href="#">Bathrooms</a></li>
                    <li><input type="radio" name="bathno"><a href="#">1</a></li>
                    <li><input type="radio" name="bathno"><a href="#">2</a></li>
                    <li><input type="radio" name="bathno"><a href="#">3</a></li>
                    <li><input type="radio" name="bathno"><a href="#">4</a></li>
                </ul>
            </div>
            <div class="form-group hidden-xs adv">
                <div class="input-group">
                    <div class="input-group-addon">$</div>
                    <input class="form-control price" type="text" placeholder="From">
                </div>
            </div>
            <div class="form-group hidden-xs adv">
                <div class="input-group">
                    <div class="input-group-addon">$</div>
                    <input class="form-control price" type="text" placeholder="To">
                </div>
            </div>
            <div class="form-group hidden-xs adv">
                <div class="checkbox custom-checkbox"><label><input type="checkbox"><span class="fa fa-check"></span> For Rent</label></div>
            </div>
            <div class="form-group hidden-xs adv">
                <div class="checkbox custom-checkbox"><label><input type="checkbox"><span class="fa fa-check"></span> For Sale</label></div>
            </div>
            <div class="form-group">
                <a href="explore.html" class="btn btn-green isThemeBtn">Search</a>
                <a href="#" class="btn btn-o btn-white pull-right visible-xs" id="advanced">Advanced Search <span class="fa fa-angle-up"></span></a>
            </div>
        </form>
    </div>
</div>

<!-- Content -->

<div class="home-wrapper">
<div class="home-content">
<h2 class="osLight">Recently Listed Properties</h2>
<div class="row pb40">
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        <a href="single.html" class="propWidget-2">
            <div class="fig">
                <img src="images/prop/1-1.png" alt="Modern Residence in New York">
                <img class="blur" src="images/prop/1-1.png" alt="Modern Residence in New York">
                <div class="opac"></div>
                <div class="priceCap osLight"><span>$1,750,000</span></div>
                <div class="figType">FOR SALE</div>
                <h3 class="osLight">Modern Residence in New York</h3>
                <div class="address">39 Remsen St, Brooklyn, NY 11201, USA</div>
            </div>
        </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        <a href="single.html" class="propWidget-2">
            <div class="fig">
                <img src="images/prop/2-1.png" alt="Hauntingly Beautiful Estate">
                <img class="blur" src="images/prop/2-1.png" alt="Hauntingly Beautiful Estate">
                <div class="opac"></div>
                <div class="priceCap osLight"><span>$1,550,000</span></div>
                <div class="figType">FOR RENT</div>
                <h3 class="osLight">Hauntingly Beautiful Estate</h3>
                <div class="address">39 Remsen St, Brooklyn, NY 11201, USA</div>
            </div>
        </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        <a href="single.html" class="propWidget-2">
            <div class="fig">
                <img src="images/prop/3-1.png" alt="Luxury Mansion">
                <img class="blur" src="images/prop/3-1.png" alt="Luxury Mansion">
                <div class="opac"></div>
                <div class="priceCap osLight"><span>$2,350,000</span></div>
                <div class="figType">FOR SALE</div>
                <h3 class="osLight">Luxury Mansion</h3>
                <div class="address">39 Remsen St, Brooklyn, NY 11201, USA</div>
            </div>
        </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        <a href="single.html" class="propWidget-2">
            <div class="fig">
                <img src="images/prop/4-1.png" alt="Sophisticated Residence">
                <img class="blur" src="images/prop/4-1.png" alt="Sophisticated Residence">
                <div class="opac"></div>
                <div class="priceCap osLight"><span>$1,340,000</span></div>
                <div class="figType">FOR RENT</div>
                <h3 class="osLight">Sophisticated Residence</h3>
                <div class="address">39 Remsen St, Brooklyn, NY 11201, USA</div>
            </div>
        </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        <a href="single.html" class="propWidget-2">
            <div class="fig">
                <img src="images/prop/5-1.png" alt="House With a Lovely Glass">
                <img class="blur" src="images/prop/5-1.png" alt="House With a Lovely Glass">
                <div class="opac"></div>
                <div class="priceCap osLight"><span>$1,930,000</span></div>
                <div class="figType">FOR SALE</div>
                <h3 class="osLight">House With a Lovely Glass</h3>
                <div class="address">39 Remsen St, Brooklyn, NY 11201, USA</div>
            </div>
        </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        <a href="single.html" class="propWidget-2">
            <div class="fig">
                <img src="images/prop/6-1.png" alt="Modern Residence in New York">
                <img class="blur" src="images/prop/1-1.png" alt="Modern Residence in New York">
                <div class="opac"></div>
                <div class="priceCap osLight"><span>$1,750,000</span></div>
                <div class="figType">FOR SALE</div>
                <h3 class="osLight">Modern Residence in New York</h3>
                <div class="address">39 Remsen St, Brooklyn, NY 11201, USA</div>
            </div>
        </a>
    </div>
</div>
</div>
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
                <div class="osLight footer-header">Get in Touch</div>
                <ul class="footer-nav pb20">
                    <li class="footer-phone"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 800 234 67 89</li>
                    <li class="footer-address osLight">
                        <p>516 Green St</p>
                        <p>San Francisco, CA 94133</p>
                        <p>United States</p>
                    </li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <div class="osLight footer-header">Subscribe to Our Newsletter</div>
                <form role="form">
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="Email Address">
                    </div>
                    <div class="form-group">
                        <a href="#" class="btn btn-green btn-block isThemeBtn">Subscribe</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="copyright">iWebEstate Real estate Online application<br> &copy; CoolBreeze 2015</div>
    </div>
</div>

<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery-ui-touch-punch.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jquery.placeholder.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=true&amp;libraries=geometry&amp;libraries=places" type="text/javascript"></script>
<script src="js/infobox.js"></script>
<script src="js/jquery.visible.js"></script>
<script src="js/home.js" type="text/javascript"></script>


</body>
</html>