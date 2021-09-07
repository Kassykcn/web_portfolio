package com.mycompany.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mycompany.vo.MemberVO;

@Repository
public interface MemberDAO {

	public List<MemberVO> member();

}
