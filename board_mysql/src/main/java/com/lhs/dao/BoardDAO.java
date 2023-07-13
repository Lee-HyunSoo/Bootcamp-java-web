package com.lhs.dao;

public class BoardDAO {
	private int num;
	private String subject;
	private String writer;
	private String contents;
	private int hit;
	private String ip;
	private String reg_date;
	private String mod_date;
	
	public BoardDAO() {
	}
	
	public BoardDAO(int num, String subject, String writer, String contents, int hit, String ip, String reg_date,
			String mod_date) {
		super();
		this.num = num;
		this.subject = subject;
		this.writer = writer;
		this.contents = contents;
		this.hit = hit;
		this.ip = ip;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	
	@Override
	public String toString() {
		return "BoardDAO [num=" + num + ", subject=" + subject + ", writer=" + writer + ", contents=" + contents
				+ ", hit=" + hit + ", ip=" + ip + ", reg_date=" + reg_date + ", mod_date=" + mod_date + "]";
	}
	
}
