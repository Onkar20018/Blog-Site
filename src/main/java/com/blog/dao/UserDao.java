package com.blog.dao;

import java.sql.*;
import com.blog.entities.User;

public class UserDao 
{
	private Connection con ;
	
	public UserDao(Connection con)
	{
		this.con = con;
	}
	
	// To save the Complete User Data in the DataBase
	public boolean saveData(User user)
	{
		boolean qexe=false;
			try 
			{
				String query = "insert into users (name,email,password,gender,about,profile) values(?,?,?,?,?,?)";
				PreparedStatement pstmt= this.con.prepareStatement(query);
				pstmt.setString(1,user.getName());
				pstmt.setString(2, user.getEmail());
				pstmt.setString(3,user.getPassword());
				pstmt.setString(4, user.getGender());
				pstmt.setString(5, user.getAbout());
				pstmt.setString(6, user.getProfile());
				
				
				pstmt.executeUpdate();
				qexe=true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return qexe;
	}
	
	// To get User using Email and Password
	public User getUserByEmailAndPassword(String email, String password)
	{
			User user = null;
			try
			{
				String query = "select * from users where email=? and password=?";
				
				PreparedStatement pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				
				ResultSet set = pstmt.executeQuery();
				
				if(set.next())
				{
					user = new User();
					user.setName(set.getString("name"));
					user.setEmail(set.getString("email"));
					user.setPassword(password);
					user.setId(set.getInt("id"));
					user.setGender(set.getString("gender"));
					user.setProfile(set.getString("profile"));
					user.setAbout(set.getString("about"));
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return user;
	}
	
	// To Update User Details 
	public boolean UpdateUserDetails(User user)
	{
		boolean  qd = false;
		try 
		{
			
			String query = "update users set name=?,email=?, password=?, gender=?, about=?,profile=? where id=?";
		
			PreparedStatement pstmt = con.prepareStatement(query);
		
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.setString(6, user.getProfile());
			pstmt.setInt(7, user.getId());
			
			pstmt.executeUpdate();
			
			qd=true;
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}	
		
		return qd;
	}
	
	public User getUserByUserID(int uid) 
	{
		User user = null;
		try 
		{
			String query = "select * from users where id =? ";
			PreparedStatement pstm = con.prepareStatement(query);
			
			pstm.setInt(1, uid);
			ResultSet rs = pstm.executeQuery();
			if(rs.next())
			{
				String name = rs.getString("name");
				String email = rs.getString("email");
				String gender = rs.getString("gender");
				String profile = rs.getString("profile");
				String about = rs.getString("about");
				int userId = rs.getInt("id");
				
				user = new User(userId, name,email,gender,profile,about);
				return user;
			}
		}
		
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return user;
	}
	
	
}
