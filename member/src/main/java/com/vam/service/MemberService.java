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
}
