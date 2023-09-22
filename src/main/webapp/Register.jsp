<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="com.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<!-- BOOTSTRAP CSS-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<%@ include file="Navbar.jsp" %>
	<main class="d-flex align-items-center primary-background " style="height:80vh" >
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white">
							<h1>Register</h1>
							<%
								Message m = (Message) session.getAttribute("msg");
								if(m!=null)
								{
								%>	
									<div class="alert alert-primary	<%= m.getCssClass() %> " role="alert">
											<%= m.getContent() %>
									</div>
							<% 	
								session.removeAttribute("msg");
								}
								
							%>
						</div>
						<div class="card-body">
						  <form action="RegisterServlet" method="POST" enctype="multipart/form-data">
						  	<div class="form-group">
    							<label for="user_name">UserName</label>
    							<input name="name" type="text" class="form-control" id="user_name" placeholder="Enter Name">
    						</div>
  						  	<div class="form-group">
    							<label for="exampleInputEmail1">Email</label>
    							<input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
    							<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  							</div>
  							<div class="form-group">
    							<label for="exampleInputPassword1">Password</label>
    							<input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  							</div>
  							<div class="form-group">
    							<label for="gender">Select Gender</label>
    							<br>
    						
    								<input type="radio" id="gender" name="gender" value="Male">Male
    								<input type="radio" id="gender" name="gender" value="Female">Female
    							
  							</div>
  							<div class="form-group">
    							<label for="exampleInputPassword1">About</label>
    						
  							<textarea id="user_about" name="about" rows="2" cols="39"></textarea>
  							</div>
  							<div class-"form-group">
  								<label for="exampleInputPassword1">Profile Picture</label>
  								<input type="file" name="profile" >
  							</div>
  							<div class="form-check ">
    							<input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    							<label class="form-check-label" for="exampleCheck1">I agree Terms and Conditions</label>
  							</div>
  							
  							<button type="submit" class="btn btn-primary mt-3">Submit</button>
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