  
package com.bank.dao;

import java.util.List;

import com.bank.dto.CoinRepositoryDto;

public interface ICoinRepositoryDaoQebc {
	
	//��������� ���� ��ü��ȸ
	List<CoinRepositoryDto> selectMultiCoinRepository();
	
	//������ ���ΰ��� ��ȸ
	int selectOneCoinRepositoryCoin();
	
	//����Ҹ����������� ��ȸ
	CoinRepositoryDto selectOneRepositoryDtlsRownum();
}