package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		User user =  dao.getUserByEmailAndPassword(email, password);
		
		if(user==null)
		{
			Message msg = new Message("Invalid Details!!! Please Try Again.","error","alert-danger");
			
			HttpSession err  = req.getSession();
			err.setAttribute("msg", msg);
			res.sendRedirect("Login.jsp");
		}
		else
		{
			
			HttpSession sesh = req.getSession();
			sesh.setAttribute("currentUser", user );
			res.sendRedirect("Profile.jsp");
			
		}
		
		
	}

}
