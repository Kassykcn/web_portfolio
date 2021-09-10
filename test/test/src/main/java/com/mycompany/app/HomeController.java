package com.mycompany.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.service.BoardService;
import com.mycompany.service.MemberService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService ser;
	@Autowired
	private BoardService ser2;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		model.addAttribute("content", "main");
		model.addAttribute("serverTime", formattedDate);

		return "admin/home";
	}

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {

		model.addAttribute("content", "member");
		model.addAttribute("mem_list", ser.member());

		return "admin/home";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {

		model.addAttribute("content", "board");
		model.addAttribute("pro_list", ser2.board());

		return "admin/home";
	}

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(Locale locale, Model model) {
		model.addAttribute("content", "infodesk");
		return "admin/home";
	}

}
