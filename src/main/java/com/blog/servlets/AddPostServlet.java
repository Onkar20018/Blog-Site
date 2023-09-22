package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.dao.PostDao;
import com.blog.entities.Message;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.ImageSaver;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	{
		try 
		{
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String s = request.getParameter("cid");
			int cid = Integer.parseInt(request.getParameter("cid"));
			Part part = request.getPart("pic");
			String picName = part.getSubmittedFileName();
			
			HttpSession sesh = request.getSession();
			User user = (User) sesh.getAttribute("currentUser");
			int uid = user.getId();
			
			Post post = new Post(title,content,picName,cid,uid);
			
			PostDao pd = new PostDao(ConnectionProvider.getConnection());
			if(pd.savePost(post))
			{
				PrintWriter out = response.getWriter();
				String path = "D:\\My Projects\\Adv Java\\BlogSite\\src\\main\\webapp\\blogimages\\"+picName;
				ImageSaver.saveImage(part.getInputStream(), path);
				
				out.print("done");
			}
			else
			{
				PrintWriter out = response.getWriter();
				out.print("not done");
			}
		}
		catch(Exception e)
		{
			System.out.println("Error Occureddddd....");
			e.printStackTrace();
		}
			
			
			
			
			
	}

}
