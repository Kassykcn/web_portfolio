package com.vam.service;

import com.vam.model.MemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	//로그인 
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	// 회원 정보 수정
	public  void memberUpdate(MemberVO memeber) throws Exception;
	
	//회원탈퇴
	public void memberDelete(MemberVO member) throws Exception;
	
	// 아이디 찾기
	public String memberFind(MemberVO member, String email) throws Exception;
	
	// 비밀번호찾기
    public String passFind(MemberVO member,  String id) throws Exception;

	
		
	
}
