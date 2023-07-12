package com.lhs;

public class Post {
	private int idx;
	private String name;
	private String email;
	private String title;
	private String content;
	private String date;
	private String pw;
	private int hit;
	
	public Post() {
		
	}
	
	
	public int getIdx() {
		return idx;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getDate() {
		return date;
	}
	public String getPw() {
		return pw;
	}
	public int getHit() {
		return hit;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}


	@Override
	public String toString() {
		return "Post [idx=" + idx + ", name=" + name + ", email=" + email + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", pw=" + pw + ", hit=" + hit + "]";
	}
	
	

}
