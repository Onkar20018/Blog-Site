package com.blog.entities;

public class Categories 
{
		private int  cId;
		private String name;
		private String description;
		
		public Categories(int cId, String name, String description) 
		{
			this.cId = cId;
			this.name = name;
			this.description = description;
		}
		
		public Categories( String name, String description) 
		{
			this.name = name;
			this.description = description;
		}
		
		public Categories() 
		{
		
		}
		
		
		public int getcId() {
			return cId;
		}
		public void setcId(int cId) {
			this.cId = cId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		
		
		
}
