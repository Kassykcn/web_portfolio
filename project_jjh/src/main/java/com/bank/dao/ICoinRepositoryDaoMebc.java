package com.bank.dao;

import com.bank.dto.CoinRepositoryDto;

public interface ICoinRepositoryDaoMebc {
	
	//������ȸ
	CoinRepositoryDto selectOneCoinRepository(String delngCode);
	
	//���ε��
	void insertCoinRepository(CoinRepositoryDto coinRepositoryDto);
	
	//�����Ա�
	void updateCoinRepository(CoinRepositoryDto coinRepositoryDto);
}