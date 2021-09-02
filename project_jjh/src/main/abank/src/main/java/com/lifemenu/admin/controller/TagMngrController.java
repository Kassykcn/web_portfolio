package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lifemenu.admin.dto.TagDto;
import com.lifemenu.admin.service.ITagMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-28
 * 	Version 	: 0.0.2
 * 
 * 	�±�, �±� ��ȸ��
 * 2021-06-10-0.0.1 	- ���� �ۼ�
 * 2021-06-28-0.0.2 	- ���� Ȯ��, ���, ����, ���� ��� �߰�
 */

@Controller
public class TagMngrController {

	@Autowired
	@Qualifier("tagMngrService")
	private ITagMngrService tagMngrService;
	
	// ��ü �±� ��� ��ȸ
	@RequestMapping(value="tagMngrMulti.do")
	public String selectMultiTagMngr(Model model, PageParamVo pageParamVo) {
		return tagMngrService.selectMultiTagMngr(model, pageParamVo);
	}
	
	// ��ü �±� ��� ������ȸ
	@RequestMapping(value="tagMngrCondition.do")
	public String viewTagMngr(Model model, ConditionParamVo conditionParamVo) {
		return tagMngrService.selectMultiTagMngrByCondition(model, conditionParamVo);
	}
	
	// �±� ���
	@RequestMapping(value="insertTagMngr.do")
	public String insertTagMngr(Model model, @RequestParam("tagName") String tagName, MultipartFile[] uploadFile) throws Exception {
		return tagMngrService.insertTagMngr(model, tagName, uploadFile);
	}
	
	// �±� ����
	@RequestMapping(value="updateTagMngr.do")
	public String updateTagMngr(Model model, TagDto tagDto, PageParamVo pageParamVo) throws Exception {
		return tagMngrService.updateTagMngr(model, tagDto, pageParamVo);
	}
	
	// �±� ����
	@RequestMapping(value="deleteTagMngr.do")
	public String deleteTagMngr(Model model, @RequestParam("tagCode") String tagCode) throws Exception {
		return tagMngrService.deleteTagMngr(model, tagCode);
	}
	
}