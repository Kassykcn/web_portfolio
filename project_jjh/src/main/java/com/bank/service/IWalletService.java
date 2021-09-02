package com.bank.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bank.dto.MberDto;
import com.bank.dto.WalletDtlsDto;
import com.bank.dto.WalletDto;

public interface IWalletService {
	
	MberDto selectOneMber(String mberCode);	//ȸ�� �ܰ� ��ȸ��
	List<Object> selectMultiWalletDtls(String mberCode, Model model);	//�������� ��Ƽ
	WalletDto selectOneMberWallet(String mberCode);		//���� ȸ���ڵ�� ã�°�
	String deposit(WalletDtlsDto walletDtlsDto) throws Exception;//�Ա�
	String withdraw(WalletDtlsDto walletDtlsDto) throws Exception;//���
	String updateMberAcountNo(String mberCode, String mberAcountNo, HttpSession session) throws Exception;	//ȸ�� ���¹�ȣ ���
	int changeMoney(int coinCo);	//������ ������ ȯ��
	int changeCoin(int money);		//���� �޾Ƽ� �������� ȯ��
}