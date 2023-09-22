package com.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ImageSaver 
{
		
	
		public static void deleteImage(String path)
		{
			try 
			{	
				File fs = new File(path);
				System.out.println("DELETED:"+fs.delete());
			}
			catch(Exception e)
			{
				e.printStackTrace();
				
			}
			
		}
		
		public static boolean saveImage(InputStream ins, String path)
		{
			
			try 
			{
				System.out.println("Inside Image Data");
				
				// Stores Image data as Byte 
				byte[] arr = new byte[ins.available()];
				
				// InputStream fills data inside Byte Array
				
				ins.read(arr);
				// To Write to the File
				
		
				FileOutputStream fos = new FileOutputStream(path);
				
				fos.write(arr);
				fos.flush();
				fos.close();
				
				return true;
				
			} 
			catch (Exception e) 
			{
				System.out.println("Error Inside");
				e.printStackTrace();
			}			
		
			return false;
		}
	
}
