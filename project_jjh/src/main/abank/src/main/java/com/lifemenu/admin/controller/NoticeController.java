package com.lifemenu.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.admin.service.INoticeMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.NoticeDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-26
 * 	Version 	: 0.0.3
 * 
 * 	��������
 * 2021-06-18-0.0.2 	- ������ ó��
 * 2021-06-26-0.0.3 	- ���� ���� Ȯ�� �� ���, ����, ���� �߰�
 */

@Controller
public class NoticeController {

	@Autowired
	@Qualifier("noticeMngrService")
	private INoticeMngrService noticeMngrService;
	
	// ù ȭ�� ��ü �������� ��� ��ȸ
	@RequestMapping(value="noticeMngrMulti.do")
	public String selectMultiNotice(Model model, PageParamVo pageParamVo) {
		return noticeMngrService.selectMultiNotice(model, pageParamVo);
	}
	
	// ��ü �������� ��� ������ȸ
	@RequestMapping(value="noticeMngrCondition.do")
	public String selectMultiNoticeByCondition(Model model, ConditionParamVo conditionParamVo) {
		return noticeMngrService.selectMultiNoticeByCondition(model, conditionParamVo);
	}
	
	// �������� �� ��ȸ
	@RequestMapping(value="noticeMngrDetail.do")
	public String selectOneNoticeDetail(Model model, @RequestParam("bbscttNo") String bbscttNo, PageParamVo pageParamVo) {
		return noticeMngrService.selectOneNotice(model, bbscttNo, pageParamVo);
	}
	
	// �������� ��� ���
	@RequestMapping(value="insertNoticeForm.do")
	public String insertNoticeForm(Model model, HttpSession session, PageParamVo pageParamVo) {
		
//		MberDto mberDto = (MberDto)session.getAttribute("dto");
		MberDto mberDto = new MberDto();
		mberDto.setMberCode("0000");
		
		model.addAttribute("MBER_CODE", mberDto.getMberCode());
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		
		return "admin/notice/noticeForm";
		
	}
	
	// �������� ���
	@RequestMapping(value="insertNotice.do")
	public String insertNotice(Model model, NoticeDto noticeDto) throws Exception {
		return noticeMngrService.insertNotice(model, noticeDto);
	}
	
	// �������� ����
	@RequestMapping(value="updateNotice.do")
	public String updateNotice(Model model, NoticeDto noticeDto, PageParamVo pageParamVo) throws Exception {
		return noticeMngrService.updateNotice(model, noticeDto, pageParamVo);
	}
	
	// �������� ����
	@RequestMapping(value="deleteNotice.do")
	public String deleteNotice(Model model, @RequestParam("bbscttNo") String bbscttNo) throws Exception {
		return noticeMngrService.deleteNotice(model, bbscttNo);
	}
	
}