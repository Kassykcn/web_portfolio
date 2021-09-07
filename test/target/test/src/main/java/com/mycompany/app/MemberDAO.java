package com.mycompany.app;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	public List<MemberVO> member();

}
