package com.bank.dao;

import com.bank.dto.MberDto;
import com.bank.dto.WalletDtlsDto;
import com.bank.dto.WalletDto;

public interface IWalletDaoMebc {	//���� MEBC
	MberDto selectOneMber(String mberCode);	//�ܰ���ȸ��
	WalletDto selectOneMberWallet(String mberCode);//�ܰ���ȸ�� ����
	void insertWalletDtls(WalletDtlsDto walletDtlsDto);//���� ����
	void updateWallet(String mberCode, int coinCo);//������ ���μ� �ٲٴ� ��
	void updateMberAcountNo(String mberCode, String mberAcountNo); //��ݰ��¹�ȣ ���(������Ʈ)

}