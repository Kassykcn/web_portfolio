package com.vam.model;



public class MemberVO {

	//회원 id
	private String id;
	
	//회원 비밀번호
	private String pass;
	
	//회원 이름
	private String name;
	
	//회원 이메일
	private String email;
	
	//회원 휴대폰 번호
	private String phoneNum;

	


	


	public String getId() {
		return id;
	}






	public void setId(String id) {
		this.id = id;
	}






	public String getPass() {
		return pass;
	}






	public void setPass(String pass) {
		this.pass = pass;
	}






	public String getName() {
		return name;
	}






	public void setName(String name) {
		this.name = name;
	}







	public String getEmail() {
		return email;
	}






	public void setEmail(String email) {
		this.email = email;
	}






	public String getPhoneNum() {
		return phoneNum;
	}






	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}






	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pass=" + pass + ", name=" + name +
				", phoneNum=" + phoneNum + ", email=" + email +"]";
	}

	
	
}