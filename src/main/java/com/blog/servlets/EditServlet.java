package com.blog.servlets;

import java.io.File;
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

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.ImageSaver;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		try 
		{
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String about = req.getParameter("about");
			Part part = req.getPart("profile");
			String profileName="default.png";
			
			if(part!=null) 
			{
				profileName = part.getSubmittedFileName();	
				
			}
			
			HttpSession sesh = req.getSession();
			
			User user = (User) sesh.getAttribute("currentUser");
			String prev_img= user.getProfile();
			
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setAbout(about);
			user.setProfile(profileName);
			
			
			
			
			UserDao dao = new UserDao(ConnectionProvider.getConnection()); 
			boolean check = dao.UpdateUserDetails(user);
			
			if(check)
			{	
				String path1 = "D:\\My Projects\\Adv Java\\BlogSite\\src\\main\\webapp\\images\\" + prev_img;
				String path2 = "D:\\My Projects\\Adv Java\\BlogSite\\src\\main\\webapp\\images\\" + user.getProfile();
		
				if(prev_img!="default.png") {
					ImageSaver.deleteImage(path1);					
				}
				boolean ans= ImageSaver.saveImage(part.getInputStream(), path2);
				if(ans) 
				{
					Message msg = new Message("Profile Updated Sucessfully!!!","success","alert-success");
				
					HttpSession err  = req.getSession();
					err.setAttribute("msg", msg);
					res.sendRedirect("Profile.jsp");
				}
				else
				{
					Message msg = new Message("Profile Could not be Updated!!!","erroe","alert-dabger");
					
					HttpSession err  = req.getSession();
					err.setAttribute("msg", msg);
					res.sendRedirect("Profile.jsp");
				}
			}
			else
			{
				Message msg = new Message("Profile Could not be Updated!!!","erroe","alert-dabger");
				
				HttpSession err  = req.getSession();
				err.setAttribute("msg", msg);
				res.sendRedirect("Profile.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
