package com.lhs.beans;

/*
 * 자바 빈 객체를 위한 클래스선언
 * 1. 멤버 변수는 반드시 private
 * 2. 멤버 변수에 대한 getter / setter
 * 3. 기본 생성자가 반드시 있어야 한다. -> 자바에서 객체를 생성하는게 아니라 태그에서 생성하기 때문에
 * 4. 그 외 기본 생성자를 이용한 오버로딩 생성자는 필요하면 사용한다.
 * 5. form 태그의 name이 가지고있는 이름과 멤버변수 이름이 동일하면 get이나 setAttribute를 사용할 필요 없이 알아서 찾아 들어간다.
 */
public class MemberBean {

	private String name;
	private String userid;
	private String nickname;
	private String pwd;
	private String email;
	private String phone;	
	
	public MemberBean() {
		super();
	}
	
	public MemberBean(String name, String userid) {
		super();
		this.name = name;
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberBean [name=" + name + ", userid=" + userid + ", nickname=" + nickname + ", pwd=" + pwd
				+ ", email=" + email + ", phone=" + phone + "]";
	}

}
