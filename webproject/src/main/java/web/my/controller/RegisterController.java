package web.my.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.my.bean.RegisterBean;
import web.my.service.RegisterService;
import web.my.utils.PagingManager;
import web.my.utils.searchVO;

@Controller
public class RegisterController {
	@Autowired
	RegisterService regService;

	private int lenPage = 5; // 한페이지당 보여줄 게시글 수
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

		regService.insertRegister(rb); //등록
		model.addAttribute("result", 1);

		return "register/register_write_ok";
	}

	//경매/구매 목록
	@RequestMapping(value="/register_list.do") 
	public String register_list(@RequestParam("cur_page") int cur_page, Model model) {

		int totalCnt = regService.getTotalCnt(); 
		int paging = (int)Math.ceil((double)totalCnt/lenPage);

		model.addAttribute("totalCnt", totalCnt); //전체 글 개수
		model.addAttribute("paging", paging); //페이징 수
		model.addAttribute("cur_page", cur_page); //현재 페이지 
		model.addAttribute("searchVO", new searchVO()); //검색폼ValueObject 
		model.addAttribute("regList", regService.getList(((cur_page-1)*lenPage), lenPage));

		return "register/register_list"; 
	}


	//경매/구매 검색
	@RequestMapping(value="/register_serchList.do")
	public String register_serchList(@RequestParam("cur_page") int cur_page, 
			@RequestParam("search_key") String search_key,
			@RequestParam("search_txt") String search_txt, 
			Model model) {

		//검색된 게시글 수
		int searchCnt = regService.getSearchCnt(search_key, search_txt);
		//전체 페이지 수 구하기
		int searchPages = PagingManager.getInstance().getTotalPage(searchCnt, lenPage);

		model.addAttribute("cur_page", cur_page); //현재 페이지
		model.addAttribute("searchCnt", searchCnt); //검색된 글 개수
		model.addAttribute("searchPages", searchPages); //검색된 페이징  수
		model.addAttribute("search_key", search_key); //검색항목(제목, 내용, 작성자)
		model.addAttribute("search_txt", search_txt); //검색어
		model.addAttribute("searchVO", new searchVO()); //검색 폼 ValueObject
		model.addAttribute("searchList", regService.getSearchList(((cur_page-1)*lenPage), lenPage, search_key, search_txt));

		return "register/register_listSearch";
	}

	//경매/구매 상세페이지
	@RequestMapping(value="/register_view.do")
	public String register_view(@RequestParam("idx") int idx, 
			@RequestParam("cur_page") int cur_page, 
			Model model) {

		model.addAttribute("idx", idx); //글번호
		model.addAttribute("cur_page", cur_page); //현재 페이지
		model.addAttribute("regData", regService.getViewHits(idx));

		return "register/register_view";
	}

	// 경매/구매 수정폼으로 이동
	@RequestMapping(value="/register_update.do", method = RequestMethod.GET)
	public String register_update(@RequestParam("idx") int idx, 
			@RequestParam("cur_page") int cur_page, 
			Model model) {

		model.addAttribute("idx", idx); //글번호
		model.addAttribute("cur_page", cur_page); //현재 페이지
		model.addAttribute("regData", regService.getView(idx));

		return "register/register_update";
	}

	// 경매/구매 수정
	@RequestMapping(value="/register_update_ok.do", method = RequestMethod.POST)
	public String register_update_ok(RegisterBean rb, 
			@RequestParam("idx") int idx, 
			@RequestParam("cur_page") int cur_page, 
			Model model) {
		
		regService.updateRegister(rb); //수정
		model.addAttribute("result", 1);

		model.addAttribute("idx", idx); //글번호
		model.addAttribute("cur_page", cur_page); //현재 페이지
		model.addAttribute("regData", regService.getView(idx));

		return "register/register_update_ok";
	}

	// 경매/구매 삭제
	@RequestMapping(value="/register_delete.do", method = RequestMethod.GET)
	public String register_delete(@RequestParam("idx") int idx, 
			@RequestParam("cur_page") int cur_page, 
			Model model) {
		
		
		regService.deleteRegister(idx); //삭제
		model.addAttribute("result", 1);

		model.addAttribute("totalCnt", new Integer(regService.getTotalCnt()));
		model.addAttribute("cur_page", cur_page); //현재 페이지
		model.addAttribute("regList", regService.getList(cur_page, lenPage));

		return "register/register_delete_ok";
	}

	//경매/구매 정렬
	@RequestMapping(value="/register_listSort.do", method = RequestMethod.GET)
	public String register_listSort(
			@RequestParam("cur_page") int cur_page, 
			@RequestParam("sort_num") int sort_num, 
			@RequestParam("filter_codeC") String filter_codeC,
			@RequestParam("filter_codeD") String filter_codeD,
			Model model) {

		String sort = ""; //정렬 기준(order by 값)
		switch (sort_num) {
			case 0: sort = "reg_date desc"; break;
			case 1: sort = "start_date asc"; break;
			case 2: sort = "start_date desc"; break;
			case 3: sort = "hits desc"; break;
			default: sort = "reg_date desc"; break;
		}
		
		String word = "where "; // where or and

		String filterC = ""; // 거래종류 필터 (where 값)
		String filterD = "";
		
		switch (filter_codeC) {
			case "0": filterC = ""; break;
			case "c0": filterC = ""; break;
			case "c1": filterC = word+"classify='경매'"; break;
			case "c2": filterC = word+"classify='구매'"; break;
		}
		System.out.println("------------------filterC: "+filterC);
		
		if(filterC == "") {
			word = "where ";
		}else {
			word = " and ";
		}
		System.out.println("------------------word: "+word);
		
		switch (filter_codeD) {
			case "0": filterD = ""; break;
			case "d0": filterD = ""; break;
			case "d1": filterD = word+"deal_state='진행중'"; break;
			case "d2": filterD = word+"deal_state='기간만료'"; break;
			case "d3": filterD = word+"deal_state='거래완료'"; break;
			default: filterD = ""; break;
		}
		System.out.println("------------------filterD: "+filterD);
		
		String filter = filterC + filterD;
		System.out.println("------------------filter: "+filter);
		
		int totalCnt = regService.getSortCnt(filter); //필터된 글 개수
		int paging = (int)Math.ceil((double)totalCnt/lenPage); //페이징 수


		model.addAttribute("totalCnt", totalCnt); //전체 글 개수
		model.addAttribute("paging", paging); //페이징  수
		model.addAttribute("cur_page", cur_page); //현재 페이지
		 
		model.addAttribute("sort_num", sort_num); //정렬
		model.addAttribute("filter_codeC", filter_codeC); //필터
		model.addAttribute("filter_codeD", filter_codeD); //필터
		
		model.addAttribute("searchVO", new searchVO()); //검색 폼 ValueObject
		model.addAttribute("regList", regService.getListSort(((cur_page-1)*lenPage), lenPage, filter, sort));

		return "register/register_listSort";
	}


}// class end
