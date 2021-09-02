package com.lifemenu.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.admin.dto.MngrInqryDto;
import com.lifemenu.admin.service.IMngrInqryService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.MberDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-30
 * 	Version 	: 0.0.3
 * 
 * 	������ ����
 * 2021-06-10-0.0.1 	- ���� �ۼ�
 * 2021-06-26-0.0.2 	- ���� ���� Ȯ�� �� ���, ����, ���� �߰�
 * 2021-06-30-0.0.3 	- ���ǿ��� ������ ���� �������� ������ ����
 */

@Controller
public class MngrInqryController {

	@Autowired
	@Qualifier("mngrInqryService")
	private IMngrInqryService mngrInqryService;
	
	// ù ȭ�� ��ü ������ ���� ��� ��ȸ
	@RequestMapping(value="mngrInqryMulti.do")
	public String selectMultiMngrInqry(Model model, PageParamVo pageParamVo) {
		return mngrInqryService.selectMultiMngrInqry(model, pageParamVo);
	}
	
	// ��ü ������ ���� ��� ������ȸ
	@RequestMapping(value="mngrInqryCondition.do")
	public String selectMultiMngrInqryByCondition(Model model, ConditionParamVo conditionParamVo) {
		return mngrInqryService.selectMultiMngrInqryByCondition(model, conditionParamVo);
	}
	
	// ������ ���� �� ��ȸ
	@RequestMapping(value="mngrInqryDetail.do")
	public String selectOneMngrInqryDetail(Model model, @RequestParam("mngrInqryNo") String mngrInqryNo, PageParamVo pageParamVo) {
		return mngrInqryService.selectOneMngrInqry(model, mngrInqryNo, pageParamVo);
	}
	
	// ������ ���� ��� ���
	@RequestMapping(value="insertMngrInqryForm.do")
	public String insertMngrInqryForm(Model model, @RequestParam("mngrInqryNo") String mngrInqryNo, HttpSession session, PageParamVo pageParamVo) {
		
		MberDto mberDto = (MberDto)session.getAttribute("dto"); // ���� �� Ȯ�� �� ������ ��
//		MberDto mberDto = new MberDto();
//		mberDto.setMberCode("0000");
		
		model.addAttribute("MNGR_INQRY_NO", mngrInqryNo);
		model.addAttribute("MBER_CODE", mberDto.getMberCode());
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		
		return "admin/inqry/inqryForm";
	}
	
	// ������ ���� �亯 ���
	@RequestMapping(value="insertMngrAnswer.do")
	public String insertMngrAnswer(Model model, MngrInqryDto mngrInqryDto) throws Exception {
		return mngrInqryService.insertMngrAnswer(model, mngrInqryDto);
	}
	
	// ������ ���� �亯 ����
	@RequestMapping(value="updateMngrAnswer.do")
	public String updateMngrAnswer(Model model, MngrInqryDto mngrInqryDto, PageParamVo pageParamVo) throws Exception {
		return mngrInqryService.updateMngrAnswer(model, mngrInqryDto, pageParamVo);
	}
	
	// ������ ���� �亯 ����
	@RequestMapping(value="deleteMngrAnswer.do")
	public String deleteMngrAnswer(Model model, @RequestParam("mngrInqryNo") String mngrInqryNo) throws Exception {
		return mngrInqryService.deleteMngrAnswer(model, mngrInqryNo);
	}
	
}