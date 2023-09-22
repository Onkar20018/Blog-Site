<%@ page import ="com.blog.entities.*,com.blog.helper.*,com.blog.dao.*,java.util.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page errorPage="ErrorPage.jsp" %>


<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
	response.sendRedirect("Login.jsp");
}
%>
<%
	int postID = Integer.parseInt(request.getParameter("post_id"));
 	PostDao pd = new PostDao(ConnectionProvider.getConnection());
 	
 	Post p = pd.getPostByPostID(postID);
 	
 	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BlogSite  ||  < %= p.getpTitle()  %> </title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.post-title
	{
		font-weight:150;
		font-size:30px;
	}
	.post-content
	{
		font-weight:100;
		font-size:25px;
		
	}
	.post-user-info
	{
		font-size:20px;
		
	}
	.row-user
	{
		border-bottom:2px solid #e2e2e2;
	}
	body
	{
		background:#e1ad01;
		background-size:cover;
		background-attachment:fixed;	
	}
</style>
</head>
<body>	
	
		<!--  NAVBAR CONTENT START -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
		<a class="navbar-brand" href="#">BlogSite</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Categories</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </i> </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">1</a> <a class="dropdown-item"
							href="#">2</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">1080</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#addPostModal">Make A Post </a></li>
			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#personalDataModal"><%=user.getName()%></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">Log
						Out</a></li>
			</ul>
		</div>
	</nav>
	<!--  NAVBAR CONTENT END -->
		<!--  MAIN BODY START -->

	<main>
		<div class="container">
			<div class="row my-4">
				<div class="col-md-8 offset-md-2">
				
					<div class="card">
						<div class="card-header primary-background text-white">
							<h4 class="post-title"><%= p.getpTitle() %></h4>
						</div>
						<img class="card-img-top my-5" src="./blogimages/<%=p.getpPic() %>" alt="CARD_IMAGE">
						<div class="card-body">
							<div class="row  my-3 row-user">
								<div class="col-md-8">
									<%
										UserDao ud = new UserDao(ConnectionProvider.getConnection());
										User u = ud.getUserByUserID(p.getuId());
									%>
									<p class="post-user-info"> Posted By : <a href="#!" > <%= u.getName() %> </a> </p>
								</div>
								<div>
								
								</div>
							</div>						
							<p class="post-content"><%=p.getpContent() %> </p>
						</div>
						<div class="card-footer text-center primary-background">
							<a href="#!" class= "btn btn-outline-dark btn-sm text-white" ><i class="fa fa-thumbs-up" ></i> Likes<span> 10</span></a>
							<a href="#!" class= "btn btn-outline-dark btn-sm text-white"><i class="fa fa-commenting" aria-hidden="true"></i> Comments <span> 10</span></a>
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</main>

	<!--  MAIN BODY END -->




	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert alert-primary m-0	<%=m.getCssClass()%> " role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>


	<!--  MODAL CONTENT START -->

	<!-- Modal -->
	<div class="modal fade" id="personalDataModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white ">
					<h5 class="modal-title" id="exampleModalLabel">Blog Site</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<!--  Header -->
					<div class="container text-center">
						<img alt="IMAGE" src="images/<%=user.getProfile()%>"
							class="img-fluid" style="border-radius: 50%; max-width: 150px">
						<br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
					</div>

					<!-- Details -->
					<div id="profile-details">
						<table class="table mt-3">
							<tbody>
								<tr>
									<th scope="row" class="text-center">ID :</th>
									<td class="text-center"><%=user.getId()%></td>
								</tr>
								<tr>
									<th class="text-center" scope="row">Email :</th>
									<td class="text-center"><%=user.getEmail()%></td>
								</tr>
								<tr>
									<th class="text-center" scope="row">Gender :</th>
									<td class="text-center"><%=user.getGender()%></td>
								</tr>
								<tr>
									<th class="text-center" scope="row">About :</th>
									<td class="text-center"><%=user.getAbout()%></td>
								</tr>

							</tbody>
						</table>
					</div>

					<!-- Profile Edit -->

					<div id="profile-edit" style="display: none">
						<h3 class="mt-2">Edit Details</h3>
						<form action="EditServlet" method="post"
							enctype="multipart/form-data">

							<table class="table">
								<tr>
									<th>ID :</th>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<th>Name :</th>
									<td><input type="text" class="form-control" name="name"
										value="<%=user.getName()%>"></td>
								</tr>
								<tr>
									<th>Email :</th>
									<td><input type="email" class="form-control" name="email"
										value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<th>Password :</th>
									<td><input type="password" class="form-control"
										name="password" value="<%=user.getPassword()%>"></td>
								</tr>
								<tr>
									<th>Gender :</th>
									<td><%=user.getGender()%></td>
								</tr>
								<tr>
									<th>About :</th>
									<td><textarea rows="3" class="form-control" name="about"><%=user.getAbout()%></textarea>
									</td>
								</tr>
								<tr>
									<th>Profile :</th>
									<td><input type="file" name="profile" class="form-control">
									</td>
								</tr>

							</table>

							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>

						</form>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!--  MODAL CONTENT END   -->

	<!-- Post Modal Start -->

	<div class="modal fade" id="addPostModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Create A Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<!--  FORM -->

					<form id="addPostForm" action="AddPostServlet" method="POST">
						<div class="form-group">
							<input name="title" type="text" placeholder="Enter Post Title"
								class="form-control">
						</div>
						<div class="form-group">
							<textarea name="content" class="form-control"
								style="height: 200px" placeholder="Enter Content Here"></textarea>
						</div>
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
								CategoriesDao cd = new CategoriesDao(ConnectionProvider.getConnection());
								ArrayList<Categories> cat = cd.getCategories();

								for (Categories c : cat) {
								%>
								<option value="<%=c.getcId()%>">
									<%=c.getcId()%>.
									<%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class=form-group>
							<label>Upload Picture</label> <input name="pic"
								class="form-control" type="file">
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Post Modal End -->


	<!-- BOOTSTRAP JS -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"></script>
	<script>
	
		$(document).ready(function() {
			var editStatus = false;

			$('#edit-profile-btn').click(function() {
				if (editStatus == false) {
					$('#profile-details').hide()
					$('#profile-edit').show()
					$(this).text("Back")
					editStatus = true;
				} else {
					$('#profile-details').show()
					$('#profile-edit').hide()
					editStatus = false;
				}
			})

		});
	</script> 
	
		

</body>
</html>