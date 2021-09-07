package com.mycompany.app;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardDAO {

	public List<BoardVO> board();
}
