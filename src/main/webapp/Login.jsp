<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<!-- BOOTSTRAP CSS-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	
	<!-- NAVBAR -->
	<%@ include file="Navbar.jsp" %>

	<main class="d-flex align-items-center primary-background " style="height:80vh" >
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white">
							<h1>Login</h1>
							<%
								Message m=(Message) session.getAttribute("msg");
								if(m!=null)
								{
							%>
									<div class="alert alert-primary m-0	<%= m.getCssClass() %> " role="alert">
										<%= m.getContent() %>
									</div>
							<% 		
									session.removeAttribute("msg");
								}
							%>
						</div>
						<div class="card-body">
						  <form action="LoginServlet" method="POST">
  						  	<div class="form-group">
    							<label for="exampleInputEmail1">Email address</label>
    							<input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
  							</div>
  							<div class="form-group">
    							<label for="exampleInputPassword1">Password</label>
    							<input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  							</div>
  							<div class="container text-center">
	  							<button type="submit" class="btn btn-primary">Login</button>
  							</div>
						  </form>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


<!-- BOOTSTRAP JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>