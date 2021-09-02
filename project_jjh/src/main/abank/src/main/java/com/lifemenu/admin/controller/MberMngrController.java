package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.admin.service.IMberMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.SellerDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-26
 * 	Version 	: 0.0.2
 * 
 * 	ȸ��, �Ǹ��� ����
 * 2021-06-10-0.0.1 	- ���� �ۼ�
 * 2021-06-26-0.0.2 	- ���� Ȯ��
 */

@Controller
public class MberMngrController {

	@Autowired
	@Qualifier("mberMngrService")
	private IMberMngrService mberMngrService;
	
	// ù ȭ�� ��ü ȸ�� ��� ��ȸ
	@RequestMapping(value="mberMngrMulti.do")
	public String selectMultiMberMngr(Model model, PageParamVo pageParamVo, @ModelAttribute("MSG") String msg) {
		System.out.println(msg);
		return mberMngrService.selectMultiMber(model, pageParamVo);
	}
	
	// ��ü ȸ�� ��� ������ȸ
	@RequestMapping(value="mberMngrCondition.do")
	public String selectMultiMberMngrByCondition(Model model, ConditionParamVo conditionParamVo) {
		return mberMngrService.selectMultiMberByCondition(model, conditionParamVo);
	}
	
	// ȸ�� �� ��ȸ
	@RequestMapping(value="mberMngrDetail.do")
	public String selectOneMberMngrDetail(Model model, String mberCode, PageParamVo pageParamVo) {
		return mberMngrService.selectOneMberMngr(model, mberCode, pageParamVo);
	}
	
	// ȸ�� �� �Ǹ��� ����
	@RequestMapping(value="updateMberMngr.do")
	public String updateMberMngrDetail(Model model, MberDto mberDto, SellerDto sellerDto, PageParamVo pageParamVo) throws Exception {
		
		System.out.println(mberDto.toString());
		System.out.println(sellerDto.toString()+", "+sellerDto.getMberCode());
		return mberMngrService.updateMberMngr(model, mberDto, sellerDto, pageParamVo);
		
	}
	
	// ȸ�� �� �Ǹ��� ����(Ż�� ó��)
	@RequestMapping(value="deleteMberMngr.do")
	public String deleteMberMngrDetail(Model model, @RequestParam("mberCode") String mberCode, PageParamVo pageParamVo) throws Exception {

		return mberMngrService.deleteMberMngr(model, mberCode);
		
	}
	
}