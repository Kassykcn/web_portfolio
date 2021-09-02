package com.vam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.MemberMapper;
import com.vam.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;

	//회원가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	
	//로그인
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }
    //회원정보수정
    @Override
    public void memberUpdate(MemberVO member) throws Exception {
    	
    	membermapper.memberUpdate(member); 
 
    }
    //회원탈퇴
	@Override
	public void memberDelete(MemberVO member) throws Exception {
		membermapper.memberDelete(member);
	}
	
	
}