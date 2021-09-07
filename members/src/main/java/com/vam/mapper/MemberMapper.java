package com.vam.mapper;

import com.vam.model.MemberVO;

public interface MemberMapper {

	    //회원가입
		public void memberJoin(MemberVO member);
		
		// 로그인 
	    public MemberVO memberLogin(MemberVO member) throws Exception;
	    
	    // 회원 정보수정
	    public void memberUpdate(MemberVO member)throws Exception;
	    
	    // 회원 탈퇴
		public void memberDelete(MemberVO member)throws Exception;
		
		// 아이디 찾기
		public String memberFind(MemberVO member) throws Exception;
		
		// 비밀번호 찾기
	    public String passFind(MemberVO member) throws Exception;
			
		
}
