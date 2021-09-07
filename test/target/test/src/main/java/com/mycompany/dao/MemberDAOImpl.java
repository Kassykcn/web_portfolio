package com.mycompany.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public List<MemberVO> member() {

		MemberDAO dao = sql.getMapper(MemberDAO.class);

		return dao.member();
	}

}
