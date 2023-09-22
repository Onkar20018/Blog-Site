<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<%@ page import="com.blog.helper.ConnectionProvider" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog Site</title>
						<!-- BOOTSTRAP CSS-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
						<!-- NAVBAR -->
						<%@ include file="Navbar.jsp" %>
						
						<!-- BANNER -->
						<div class="container-fluid  p-0 m-0">
							<div class="jumbotron primary-background text-white">
								<div class="container">
									<h3 class="display-3">Welcome, To Blog Site</h3>
									<p>Welcome to the Blog Site , World of blogs.</p>
									<button class="btn btn-outline-light btn-lg">Start Now!</button>
									<a href="Login.jsp" class="btn btn-outline-light btn-lg">Login</a>
								</div>
							</div>
								
						</div>
					
						<!-- CARDS -->
						<div class="container">
							<div class="row mb-2">
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card">
  										<div class="card-body">
    										<h5 class="card-title">Travel</h5>
    										<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    										<a href="#" class="btn primary-background text-white">Read More...</a>
  										</div>
									</div>
								</div>
							</div>
						</div>




<!-- BOOTSTRAP JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>