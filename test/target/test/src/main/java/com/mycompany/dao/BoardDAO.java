package com.mycompany.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mycompany.vo.BoardVO;

@Repository
public interface BoardDAO {

	public List<BoardVO> board();
}
