package com.mycompany.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Override
	public List<MemberVO> member() {
		// TODO Auto-generated method stub
		return dao.member();
	}

}
