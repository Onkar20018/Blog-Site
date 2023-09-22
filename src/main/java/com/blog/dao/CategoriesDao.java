 package com.blog.dao;
import java.sql.*;
import java.util.ArrayList;

import com.blog.entities.Categories;

public class CategoriesDao 
{
		Connection con;
		
		public CategoriesDao(Connection con)
		{
			this.con=con;
		}
		
		public ArrayList<Categories> getCategories()
		{
			ArrayList<Categories> list = new ArrayList<>();
			
			try 
			{
				String query = "select * from categories";
				PreparedStatement pstm = con.prepareStatement(query);
				
				ResultSet rs = pstm.executeQuery();
				
				while(rs.next())
				{
					int cid=rs.getInt("cid");
					String name=rs.getString("name");
					String description=rs.getString("description");
					
					Categories c = new Categories(cid,name,description);
					
					list.add(c);
				}

			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return list;
		}
}
