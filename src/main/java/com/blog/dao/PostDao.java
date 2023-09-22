package com.blog.dao;

import com.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;

public class PostDao 
{
		Connection con;
		
		public PostDao(Connection con)
		{
			this.con=con;
		}
		
		public boolean savePost(Post post) 
		{
			boolean check=false;
			
			try {
				
				String query = "insert into posts(pTitle,pContent,pPic,catId,uId) values(?,?,?,?,?)";
				PreparedStatement pstm = con.prepareStatement(query);
				
				pstm.setString(1, post.getpTitle());
				pstm.setString(2, post.getpContent());
				pstm.setString(3, post.getpPic());
				pstm.setInt(4, post.getCatId());
				pstm.setInt(5, post.getuId());
				
				pstm.executeUpdate();
				
				return true;
			}
			catch(Exception e)
			{
				System.out.println("Exception Occured....");
				e.printStackTrace();
			}
			
			return check;
		}
		
		public ArrayList<Post> getAllPosts()
		{
			ArrayList<Post> list= new ArrayList<>();
		  try 
		  {
			  
			String query ="select * from posts order by pid desc";
			
			PreparedStatement pstm = con.prepareStatement(query);
			
			ResultSet  rs = pstm.executeQuery();
			
			while(rs.next())
			{	
				String title = rs.getString("pTitle");
				String content = rs.getString("pContent");
				String pic = rs.getString("pPic");
				int catId = rs.getInt("catID");
				int uId = rs.getInt("uid");
				int pId = rs.getInt("pId");
				
				Post p = new Post(pId,title,content,pic,catId,uId);
				list.add(p);
			}
		
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  
		  return list;
		}
		
		public ArrayList<Post> getPostByCatID(int cid)
		{
			ArrayList<Post> list = new ArrayList<>();
			try
			{
				String query = "select * from posts where catID =? order by pid desc";
				
				PreparedStatement pstm = con.prepareStatement(query);
				
				pstm.setInt(1,cid);
				
				ResultSet rs = pstm.executeQuery();
				
				while(rs.next())
				{
					String title = rs.getString("pTitle");
					String content = rs.getString("pContent");
					String pic = rs.getString("pPic");
					int catId = rs.getInt("catID");
					int uId = rs.getInt("uid");
					int pId = rs.getInt("pId");
					
					Post p = new Post(pId,title,content,pic,catId,uId);
					list.add(p);

				}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return list;
		}
		
		public Post getPostByPostID(int pid)
		{
			
			Post p=null;
			try
			{
				String query = "select * from posts where pID =?";
				
				PreparedStatement pstm = con.prepareStatement(query);
				
				pstm.setInt(1,pid);
				
				ResultSet rs = pstm.executeQuery();
				
				if(rs.next())
				{
					String title = rs.getString("pTitle");
					String content = rs.getString("pContent");
					String pic = rs.getString("pPic");
					int catId = rs.getInt("catID");
					int uId = rs.getInt("uid");
					int pId = rs.getInt("pId");
					
					 p = new Post(pId,title,content,pic,catId,uId);
					return p;

				}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return p;
		}
		
}
