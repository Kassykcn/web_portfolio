package com.lifemenu.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-17
 * 	Version 	: 0.0.1
 * 
 * 	������ ���� ȭ��
 */

@Controller
public class AdminMainController {

	@RequestMapping(value="adminMain.do")
	public String adminStart() {
		return "admin/admin_main";
	}
	
}
