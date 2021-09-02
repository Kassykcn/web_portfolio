package com.bank.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bank.dto.MberDto;
import com.bank.dto.WalletDtlsDto;
import com.bank.dto.WalletDto;
import com.bank.service.IWalletService;

@Controller
public class WalletController {
    
    private static final Logger logger = LoggerFactory.getLogger(WalletController.class);
    
    @Autowired
    private IWalletService walletService;

    
    @RequestMapping(value="walletView")	//������������ �̵�
    public String walletView(HttpSession session, Model model){	//���� ȭ��
    	logger.info("walletView called ============");
    	 
    	 MberDto dto = (MberDto) session.getAttribute("dto");
    	
    	 String mberCode = dto.getMberCode();
    	 WalletDto walletDto = walletService.selectOneMberWallet(mberCode);
    	 int havedCoinCo = walletDto.getCoinCo();

    	 List<Object> list = walletService.selectMultiWalletDtls(mberCode, model);
    	 model.addAttribute("COIN", havedCoinCo);
    	 model.addAttribute("LIST", list);
    	

    	return "walletView";
    }
    
    @RequestMapping(value="depositView")	//�Ա� ȭ������ �̵�
    public String depositView(HttpSession session, Model model){	//�Ա� ȭ��
    	logger.info("depositView called ============");
   
    	 MberDto dto = (MberDto) session.getAttribute("dto");
    	 
    	 String mberCode = dto.getMberCode();
    	 WalletDto walletDto = walletService.selectOneMberWallet(mberCode);
    	 int coinCo = walletDto.getCoinCo();
    	 model.addAttribute("COIN", coinCo);
    	return "depositView";
    }

    @RequestMapping(value="withDrawView")	//��� ȭ������ �̵�
    public String withDrawView(HttpSession session, Model model){	//��� ȭ��
    	logger.info("withDrawView called ============");
    	 MberDto dto = (MberDto) session.getAttribute("dto");
    	 System.out.println("������Ʈ�ѷ����� ���ȭ������ ���� �� ��� ���¹�ȣ"+dto.getMberAcountNo());
    	 String mberCode = dto.getMberCode();	//����ڵ� ���ϱ�
    	 WalletDto walletDto = walletService.selectOneMberWallet(mberCode);	//�ش��ڵ��� ���� ���ϱ�
    	 int coinCo = walletDto.getCoinCo();	//������ �ִ� ���� ��
    	 model.addAttribute("COIN", coinCo);
    	 
    	 int money = walletService.changeMoney(coinCo);	//��ݰ��� �ݾ��� ���� ��ȯ
    	 model.addAttribute("MONEY", money);
    	 
    	 MberDto chkDto = walletService.selectOneMber(mberCode);
    	 if(chkDto.getMberAcountNo() == null)
    	 {
    		 return "updateMberAcountNo";
    	 }
    	

    	return "withDrawView";
    }
 
    @RequestMapping(value="deposit.do")
    public String deposit(WalletDtlsDto walletDtlsDto) throws Exception{	//�Ա�
        String viewPage = "";
        String mberCode = walletDtlsDto.getMberCode();	//��� �ڵ� ���ϱ�

       	MberDto dto = walletService.selectOneMber(mberCode);	//����ڵ��  ȸ�� �ܰ���ȸ
       
        if(dto == null) {
        	System.out.println("�ش� ȸ���ڵ��� ȸ���� �������� ����.");
        	throw new Exception();
        }
        
       
        viewPage = walletService.deposit(walletDtlsDto);	//���� �ŷ������� �μ�Ʈ�ϸ鼭 ������ ���ε� �ٲٱ�
       
    	return viewPage;
    }
    
    @RequestMapping(value="withDraw.do" , method= RequestMethod.POST)
    public String withDraw(WalletDtlsDto walletDtlsDto) throws Exception{//���
        String viewPage = "";
        
        String mberCode = walletDtlsDto.getMberCode();	//��� �ڵ� ���ϱ�
        
        MberDto dto = walletService.selectOneMber(mberCode);	//����ڵ��  ȸ�� �ܰ���ȸ
        
        if(dto == null) {
        	System.out.println("�ش� ȸ���ڵ��� ȸ���� �������� ����.");
        	throw new Exception();
        }
   	 	
        viewPage = walletService.withdraw(walletDtlsDto);
        
        
    	return viewPage;
    }
    
    @RequestMapping(value="mberAcountNoUpdate.do" , method= RequestMethod.POST)
    public String mberAcountNoInsert(HttpSession session, String mberAcountNo) throws Exception{//���¹�ȣ ���(������Ʈ ó��)
        String viewPage = "";
        MberDto dto = (MberDto) session.getAttribute("dto");
   	 
   	 	String mberCode = dto.getMberCode();
        
        viewPage = walletService.updateMberAcountNo(mberCode, mberAcountNo, session);
        
        
    	return viewPage;
    }
    


}