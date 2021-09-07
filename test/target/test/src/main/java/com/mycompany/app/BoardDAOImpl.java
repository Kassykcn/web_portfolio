package com.mycompany.app;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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