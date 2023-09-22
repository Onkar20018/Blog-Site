package com.blog.helper;
import java.sql.*;
public class ConnectionProvider 
{
	private static Connection con;
	private static String url = "jdbc:mysql://localhost:3306/blog";
	private static String userName = "root";
	private static String passWord = "########";
	
	public static Connection getConnection()
	{
		try
		{
			// If Connection object is Not Created Already
			if(con==null)
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection(url,userName,passWord);				
			}
				
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
}
