package com.test.pj.guestbook.model;

import java.sql.Timestamp;

public class GuestbookVO {
	private int no;
	private String name;
	private String pwd;
	private String content;
	private Timestamp regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "GuestbookVO [no=" + no + ", name=" + name + ", pwd=" + pwd + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
	
	
}
