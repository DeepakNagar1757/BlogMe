package com.blogme.entities;

import java.time.LocalDateTime;

public class Post {
	private int idposts;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private LocalDateTime pDate;
	private int catId;
	private int userId;

//	constructors
	public Post() {

	}

	public Post(int idposts, String pTitle, String pContent, String pCode, String pPic, LocalDateTime pDate,
			int catId,int userId) {
		this.idposts = idposts;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.userId= userId;
	}

	public Post(String pTitle, String pContent, String pCode, String pPic, LocalDateTime pDate, int catId, int userId) {
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.userId= userId;
	}

	public int getIdposts() {
		return idposts;
	}

	public void setIdposts(int idposts) {
		this.idposts = idposts;
	}

	public String getpTitle() {
		return pTitle;
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

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public LocalDateTime getpDate() {
		return pDate;
	}

	public void setpDate(LocalDateTime pDate) {
		this.pDate = pDate;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
