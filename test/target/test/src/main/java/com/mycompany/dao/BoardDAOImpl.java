package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public List<BoardVO> board() {
		BoardDAO dao = sql.getMapper(BoardDAO.class);
		
		List<BoardVO> dao2 = dao.board();
		
		System.out.println(dao2);
		return dao.board();
	}

}