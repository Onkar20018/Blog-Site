package com.blog.entities;

public class Post 
{
		private int pId;
		private String pTitle;
		private String pContent;
		private String pPic;
		private int catId;
		private int uId;
		
		public Post(int pId, String pTitle, String pContent, String pPic, int catId,int uid) {
			this.pId = pId;
			this.pTitle = pTitle;
			this.pContent = pContent;
			this.pPic = pPic;
			this.catId = catId;
			this.uId = uid;
		}
		
		public Post(String pTitle, String pContent, String pPic, int catId,int uid) {
			super();
			this.pTitle = pTitle;
			this.pContent = pContent;
			this.pPic = pPic;
			this.catId = catId;
			this.uId=uid;
		}
		
		
		public int getpId() {
			return pId;
		}
		public void setpId(int pId) {
			this.pId = pId;
		}
		public String getpTitle() {
			return pTitle;
		}
		public int getuId() {
			return uId;
		}

		public void setuId(int uId) {
			this.uId = uId;
		}

		public void setpTitle(String pTitle) {
			this.pTitle = pTitle;
		}
		public String getpContent() {
			return pContent;
		}
		public void setpContent(String pContent) {
			this.pContent = pContent;
		}	 
		public String getpPic() {
			return pPic;
		}
		public void setpPic(String pPic) {
			this.pPic = pPic;
		}
		public int getCatId() {
			return catId;
		}
		public void setCatId(int catId) {
			this.catId = catId;
		}
		
		
}
