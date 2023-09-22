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

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
			String check = req.getParameter("check");
			PrintWriter out = res.getWriter();
			if(check==null) 
			{
				out.print("Please Check the Box");
			}
			else
			{
				String name = req.getParameter("name");
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				String gender = req.getParameter("gender");				
				String profile = req.getParameter("profile");
				Part part = req.getPart(profile);
				
				String about = req.getParameter("about");
				
				User user = new User (name,email,password,gender,profile,about);
				
				UserDao dao = new UserDao(ConnectionProvider.getConnection());
				
				if( dao.saveData(user))
				{
					HttpSession s = req.getSession();
					Message m = new Message("User Successfully Registered.","success","alert-success");
					s.setAttribute("msg", m);
					res.sendRedirect("Login.jsp");
				}
				else
				{
					HttpSession s = req.getSession();
					Message m = new Message("User Not Registered! Please Try Again.","error","alert-danger");
					s.setAttribute("msg", m);
					res.sendRedirect("Register.jsp");
				}
				
			}
	}

}
