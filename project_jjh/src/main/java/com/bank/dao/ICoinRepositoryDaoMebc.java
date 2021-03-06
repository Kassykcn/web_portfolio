package com.bank.dao;

import com.bank.dto.CoinRepositoryDto;

public interface ICoinRepositoryDaoMebc {
	
	//코인조회
	CoinRepositoryDto selectOneCoinRepository(String delngCode);
	
	//코인등록
	void insertCoinRepository(CoinRepositoryDto coinRepositoryDto);
	
	//코인입금
	void updateCoinRepository(CoinRepositoryDto coinRepositoryDto);
}