package com.vam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.MemberVO;
import com.vam.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGET() {
		
		logger.info("회원가입 페이지 진입");
				
	}
	//회원가입
		@RequestMapping(value="/join", method=RequestMethod.POST)
		public String joinPOST(MemberVO member) throws Exception{
			
			logger.info("join 진입");
			
			// 회원가입 서비스 실행
			memberservice.memberJoin(member);
			
			logger.info("join Service 성공");
			
			return "redirect:/main";
			
		}
	
	//로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {
		
		logger.info("로그인 페이지 진입");
		
	}
	
	//로그인
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
        
        
        HttpSession session = request.getSession();
        MemberVO login = memberservice.memberLogin(member);
        
 if(login == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            
            int result = 0;
            rttr.addFlashAttribute("result", result);
            
            return "redirect:/member/login";
            
        }
        
        session.setAttribute("member", login);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        
        return "redirect:/main";
        
        
    }
    //메인페이지 로그아웃
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
    		logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/main";  
        
    }
    
    //회원 정보수정
    @RequestMapping(value="/edit", method = RequestMethod.GET)
    public String registerUpdateView() throws Exception{
    	
    	return "member/edit";
    }
    @RequestMapping(value="/edit", method = RequestMethod.POST)
    public String registerUpdate(MemberVO member, HttpSession session) throws Exception{
    	
    	memberservice.memberUpdate(member);
    	
    	session.invalidate();
    	
    	return "redirect:/main";
    }
    // 회원 탈퇴 페이지
 	@RequestMapping(value="/delete", method = RequestMethod.GET)
 	public String memberDeleteView() throws Exception{
 		return "member/delete";
 	}
 	
 	
 	// 회원 탈퇴
 	@RequestMapping(value="/delete", method = RequestMethod.POST)
 	public String memberDelete(MemberVO member, HttpSession session, RedirectAttributes rttr) throws Exception{
 		
 		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
 		
 		MemberVO vo = (MemberVO) session.getAttribute("member");
 		// 세션에있는 비밀번호
 		String sessionPass = vo.getPass();
 		// vo로 들어오는 비밀번호
 		String voPass = member.getPass();
 		
 		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/delete";
		}
		memberservice.memberDelete(member);
		session.invalidate();
		return "redirect:/main";
	}
}