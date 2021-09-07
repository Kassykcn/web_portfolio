package com.mycompany.vo;

public class MemberVO {

//	mno int not null auto_increment,
//	id varchar(20),
//	name varchar(20),
//	email varchar(35),
//	phone varchar(30)

	private int mno;
	private String id;
	private String name;
	private String email;
	private String phone;

	public MemberVO() {
		super();
	}

	public MemberVO(int mno, String id, String name, String email, String phone) {
		super();
		this.mno = mno;
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	};

}
