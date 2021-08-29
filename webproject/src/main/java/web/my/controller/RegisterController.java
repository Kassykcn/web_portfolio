package web.my.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.my.bean.RegisterBean;
import web.my.service.RegisterService;

@Controller
public class RegisterController {
	@Autowired
	RegisterService regService;
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	// ,method = RequestMethod.POST 를 지정하지않으면 post, get방식 모두 지원
	
	// 경매/구매 등록 폼 
	@RequestMapping(value="/register_write.do")
	public String register_write(Model model) {
	
		//<sf:form modelAttribute="값">과 동일해야한다.
		model.addAttribute("regBean", new RegisterBean());
		
		//category
		model.addAttribute("categotyFirst", regService.getCategoryFirst());
		model.addAttribute("categotySecond", regService.getCategorySecond());
		model.addAttribute("categotyThird", regService.getCategoryThird());
	
		return "register/register_write";
	}
	//경매/구매 등록 확인
	@RequestMapping(value="/register_write_ok.do", method = RequestMethod.POST)
	public String register_write_ok(RegisterBean rb, Model model) {
		System.out.println("register_write_ok----------------------------");
		//등록
		regService.insertRegister(rb);
		model.addAttribute("result", 1);
		
		return "register/register_write_ok";
	}
	
	//경매/구매 목록
	@RequestMapping(value="/register_list.do")
	public String register_list(@RequestParam("cur_page") String cur_page, 
								Model model) {
		
		model.addAttribute("totalCnt", new Integer(regService.getTotalCnt()));
		model.addAttribute("cur_page", "1");
		model.addAttribute("regList", regService.getList());
		
		return "register/register_list";
	}
	
	//경매/구매 상세페이지
	@RequestMapping(value="/register_view.do")
	public String register_view(@RequestParam("idx") String idx, 
								@RequestParam("cur_page") String cur_page, 
								Model model) {
		
		model.addAttribute("idx", idx);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("regData", regService.getViewHits(idx));
		
		return "register/register_view";
	}
	
}
