package com.bank.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.bank.dao.IWalletDaoMebc;
import com.bank.dao.IWalletDaoQebc;
import com.bank.dto.MberDto;
import com.bank.dto.WalletDtlsDto;
import com.bank.dto.WalletDto;

@Service("walletService")	
public class WalletServiceImpl implements IWalletService {
	
	@Autowired
    private IWalletDaoQebc walletDaoQebc;
	@Autowired
    private IWalletDaoMebc walletDaoMebc;
	
	
	@Override
	public MberDto selectOneMber(String mberCode) {
		MberDto dto = walletDaoMebc.selectOneMber(mberCode);
		return dto;
	}
	
	@Override
	public List<Object> selectMultiWalletDtls(String mberCode, Model model) {	//�ŷ����� ��ȸ
		List<Object> list = null;
		
		list = walletDaoQebc.selectMultiWalletDtls(mberCode);
		if(list.size() == 0) {
   		 model.addAttribute("walletDtlsMsg","�ŷ������� ���� ���� �ʽ��ϴ�.");
   	 	}
		return list;
	}
	
	@Override
	public WalletDto selectOneMberWallet(String mberCode) {
		WalletDto walletDto = walletDaoMebc.selectOneMberWallet(mberCode);
		return walletDto;
	}
	
	
	@Override
	@Transactional
	public String deposit(WalletDtlsDto walletDtlsDto) throws Exception{
		int coinCo = 0;		//������ �ݾ׿� ���� ����
		int havedCoinCo;	//������ �ִ� ����
		int totalCoinCo;	//�������ִ��� + �Ա��� �ݾ׿� ���� ����
		

		WalletDto walletDto = selectOneMberWallet(walletDtlsDto.getMberCode());	//���� ��������
        if(walletDto == null)
        {
        	System.out.println("�ش� ȸ���ڵ��� ������ ����");
        	throw new Exception();
        }
        
        System.out.println("���������� �ִ� �������� = " + walletDto.getCoinCo());
        havedCoinCo = walletDto.getCoinCo();

        int  selectedRcppayAmount = walletDtlsDto.getRcppayAmount();	// �Ա����������� �����ߴ� �ݾ�
        System.out.println("���񽺿��� ���ϴ���.. �Ա����������� �����ߴ� �ݾ� = " + selectedRcppayAmount);
        
        coinCo = changeCoin(selectedRcppayAmount);//�Ա��ߴ� �ݾ��� ��������
        walletDtlsDto.setExcngCoinCo(coinCo);
        
        totalCoinCo = havedCoinCo + coinCo;
   
		walletDaoMebc.insertWalletDtls(walletDtlsDto);	//�ŷ����� �μ�Ʈ
//		updateCoinCo(walletDto, coinCo);
		walletDaoMebc.updateWallet(walletDtlsDto.getMberCode(), totalCoinCo);	//���� ���� ������Ʈ
		
		return "redirect:/walletView";
		
		
	}

	@Override
	@Transactional
	public String withdraw(WalletDtlsDto walletDtlsDto) throws Exception {
	
		int coinCo = 0;		//������ �ݾ׿� ���� ����
		int havedCoinCo;	//������ �ִ� ����
		int totalCoinCo;	//�������ִ��� + ����� �ݾ׿� ���� ����
		

		WalletDto walletDto = selectOneMberWallet(walletDtlsDto.getMberCode());	//���� ��������
        if(walletDto == null)
        {
        	System.out.println("�ش� ȸ���ڵ��� ������ ����");
        	throw new Exception();
        }
        
        System.out.println("���������� �ִ� �������� = " + walletDto.getCoinCo());
        havedCoinCo = walletDto.getCoinCo();

        int  money = walletDtlsDto.getRcppayAmount();	// ������������� �Է��ߴ� �ݾ�
        System.out.println("���񽺿��� ���ϴ���.. ������������� �����ߴ� �ݾ� = " + money);
        
        coinCo = changeCoin(money);//����ߴ� �ݾ��� ��������
        walletDtlsDto.setExcngCoinCo(coinCo);
        
        totalCoinCo = havedCoinCo - coinCo;
   
		walletDaoMebc.insertWalletDtls(walletDtlsDto);	//�ŷ����� �μ�Ʈ
		walletDaoMebc.updateWallet(walletDtlsDto.getMberCode(), totalCoinCo);	//���� ���� ������Ʈ
		
		return "redirect:/walletView";
		
		
	}

	
	public int changeCoin(int selectedRcppayAmount) {	//�ݾ׿� ���� �������� �ٲ��ִ°�
		
		int coinCo = 0;
		
		if(selectedRcppayAmount == 10000)	//�Ա� �ݾ��� ���� �̸� ���� �Ѱ�
		{
			coinCo = 1;
		}
		else if(selectedRcppayAmount == 20000)
		{
			coinCo = 2;
		}
		else if(selectedRcppayAmount == 30000)
		{
			coinCo = 3;
		}
		else if(selectedRcppayAmount == 50000)
		{
			coinCo = 5;
		}
		else if(selectedRcppayAmount == 100000)
		{
			coinCo = 10;
		}
		else if(selectedRcppayAmount == 200000)
		{
			coinCo = 20;
		}
		
		return coinCo;
		
	}
	
	public  int changeMoney(int coinCo)	//������ �޾Ƽ� ������ �ٲ��ִ� ��
	{
	
		int money = 0;
		
		for(int i=0; i < coinCo; i++ ) {
			money += 10000;
		}
		
		return money;
		
	}

	@Override
	@Transactional
	public String updateMberAcountNo(String mberCode, String mberAcountNo, HttpSession session) throws Exception {	//��ݰ��¹�ȣ ���
		
		MberDto dto = walletDaoMebc.selectOneMber(mberCode);
		
		if(dto == null) {
			System.out.println("�α����� �����ʾƼ� �����߰���");
			throw new Exception();
		}
		
		walletDaoMebc.updateMberAcountNo(mberCode, mberAcountNo);	//���¹�ȣ ������Ʈ
		dto.setMberAcountNo(mberAcountNo); //dto�� ���¹�ȣ set
		session.setAttribute("dto", dto);	//���ǿ� dto set
		
		return "redirect:/walletView";
	}





}