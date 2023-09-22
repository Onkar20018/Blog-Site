<%@page import="com.blog.dao.*, com.blog.entities.* , com.blog.helper.*, java.util.* ,  java.io.PrintWriter" %>

<div class="row">

<% 
		Thread.sleep(350);
		PostDao pd = new PostDao(ConnectionProvider.getConnection());
		ArrayList<Post> list =new ArrayList<>();
		
		int id = Integer.parseInt(request.getParameter("catid"));
		
		if(id==0)
		{
			list=pd.getAllPosts();
		}
		else
		{
			list=pd.getPostByCatID(id);
		}
		
		if(list.size()==0){
			PrintWriter outs = response.getWriter();
			outs.print("<h4 class='display-3 text-center'> No Posts Yet For This Category </h4>");
			return;
		}
		
		for(Post p:list)
		{
%>
	<div class="col-md-6 mt-2">
		<div class="card">
			
			<img class="card-img-top" src="./blogimages/<%=p.getpPic() %>" alt="CARD_IMAGE">
			<div class="card-body">
				<b><%= p.getpTitle() %></b>
				<p><%= p.getpContent() %></p>
				
			</div>
			<div class="card-footer text-center primary-background">
				<a href="#!" class= "btn btn-outline-dark btn-sm"><i class="fa fa-thumbs-up" ></i> Likes<span> 10</span></a>
				<a href="#!" class= "btn btn-outline-dark btn-sm"><i class="fa fa-commenting" aria-hidden="true"></i> Comments <span> 10</span></a>
				<a href="ShowPost.jsp?post_id=<%=p.getpId() %>" class ="btn btn-outline-light btn-sm mt-2"><i class="fa fa-caret-square-o-down" aria-hidden="true"></i> Read More... </a>
			</div>
			
		</div>	
	</div>

<%
		}
%>			

</div>
