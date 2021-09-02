package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.admin.service.IVochrMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-30
 * 	Version 	: 0.0.2
 * 
 * 	�Ļ��, ����, ����, ȯ�� ����
 * 2021-06-10-0.0.1 	- ���� �ۼ�
 * 2021-06-30-0.0.2 	- ���� Ȯ��
 */

@Controller
public class VochrMngrController {

	@Autowired
	@Qualifier("vochrMngrService")
	private IVochrMngrService vochrMngrService;
	
	// ��ü �Ļ�� ��� ��ȸ
	@RequestMapping(value="vochrMngrMulti.do")
	public String selectMultiVochrMngr(Model model, PageParamVo pageParamVo) {
		return vochrMngrService.selectMultiVochr(model, pageParamVo);
	}
	
	// ��ü �Ļ�� ��� ������ȸ
	@RequestMapping(value="vochrMngrCondition.do")
	public String selectMultiVochrMngrByCondition(Model model, ConditionParamVo conditionParamVo) {
		return vochrMngrService.selectMultiVochrByCondition(model, conditionParamVo);
	}
	
	// �Ļ�� �� ��ȸ
	@RequestMapping(value="vochrMngrDetail.do")
	public String selectMultiResveSetlt(Model model, @RequestParam("vochrCode") String vochrCode, PageParamVo pageParamVo) {
		return vochrMngrService.selectMultiResveSetle(model, vochrCode, pageParamVo);
	}
	
	// �Ļ���� ����ε�
	@RequestMapping(value="vochrMngrBlind.do")
	public String updateVochrMngr(Model model, @RequestParam("vochrCode") String vochrCode, PageParamVo pageParamVo) throws Exception {
		return vochrMngrService.blindVochr(model, vochrCode, pageParamVo);
	}
	
	// �Ļ���� ����Ȯ�� �˾�
	@RequestMapping(value="purchsDcsnAtPopup.do")
	public String purchsDcsnAtPopup(Model model, PageParamVo pageParamVo) throws Exception {
		return "";
	}
	
}