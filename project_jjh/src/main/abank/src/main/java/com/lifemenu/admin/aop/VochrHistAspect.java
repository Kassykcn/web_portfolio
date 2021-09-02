package com.lifemenu.admin.aop;

import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import com.lifemenu.admin.dao.mebc.IVochrHistDaoMebc;
import com.lifemenu.admin.dto.hist.VochrHistDto;
import com.lifemenu.cmmn.AdminCommons;
import com.lifemenu.dto.VoucherDto;

public class VochrHistAspect {

public static int seq = 0;
	
	@Autowired
	private IVochrHistDaoMebc vochrHistDaoMebc;
	@Autowired
	private AdminCommons adminCommons;
	
	public void afterReturning(JoinPoint jp) {
		
		System.out.println(++seq + "--" + jp.getSignature().getName() + "����----");
		VoucherDto voucherDto = (VoucherDto)jp.getArgs()[0];
		
		// �Ķ���� Ȯ��
		System.out.println(++seq + " parameter= " + voucherDto.toString());
		
//		// insert�� ������ �������� (isVoucherDto���� null, DB���� commit���̶� �ش� �����Ͱ� ���� ���·� ���� ->)
//		VoucherDto isVoucherDto = voucherDaoMebc.selectOneVoucher(voucherDto.getMberCode());
//		System.out.println(++seq + " insert-data= " + isVoucherDto.toString());
		
		// Hist��ü ����
		if (adminCommons == null) {
			System.out.println("���� �߻�!");
		}
		VochrHistDto vochrHistDto = adminCommons.createVochrHist(voucherDto, "VOCHR-INSERT");
		System.out.println(++seq + " histDto= " + vochrHistDto.toString());
		
		// insert vochrHistDto
		vochrHistDaoMebc.insertVochrHist(vochrHistDto);
		
	}
	
}
