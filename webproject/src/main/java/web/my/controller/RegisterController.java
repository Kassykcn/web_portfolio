package web.my.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.my.bean.RegisterBean;
import web.my.bean.RegisterQnABean;
import web.my.service.RegisterService;
import web.my.utils.PagingManager;
import web.my.utils.searchVO;

@Controller
public class RegisterController {
	@Autowired
	RegisterService regService;
	
	// 한페이지당 보여줄 게시글 수
	private int lenPage = 5;
	
	//이미지 파일 업로드 경로
	String uploadPath = "D:\\soldesk_project\\git\\web_portfolio\\webproject\\src\\main\\webapp\\resources\\uploads\\";
	
	
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
	public String register_write_ok(RegisterBean rb, Model model,
			HttpServletRequest req) {
		
		try {
			MultipartRequest multi = 
					new MultipartRequest(req, uploadPath, 5*1024*1024, "UTF-8", 
							new DefaultFileRenamePolicy());
			
			String fileName =  multi.getFilesystemName("image");
			
			if(fileName == null || fileName.isEmpty()) { 
				rb.setImage(null);
				System.out.println("----------fileName: "+fileName);
			}else {
				//날짜시간 구하기
				Date date = new Date();
				Locale currentLocale = new Locale("KOREAN", "KOREA");
				String pattern = "yyyyMMddHHmmss"; 
				SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale);
				String today = formatter.format(date);
				System.out.println("----------today: "+today);
				
				//기존파일명에서 확장자 잘라내기
				String extension = fileName.substring(fileName.length()-4,fileName.length());
				System.out.println("----------extension: "+extension);
				
				//파일명을 날짜시간으로 변경
				String fileName2 = today+extension;
				System.out.println("----------fileName2: "+fileName2);
				
				//파일명 변경
				File oldFile = new File(uploadPath+fileName);
				File newFile = new File(uploadPath+fileName2);
				oldFile.renameTo(newFile);
				
				rb.setImage(fileName2);
			}
			
			rb.setId(multi.getParameter("id"));
			rb.setClassify(multi.getParameter("classify"));
			rb.setTitle(multi.getParameter("title"));
			rb.setFirst(multi.getParameter("first"));
			rb.setSecond(multi.getParameter("second"));
			rb.setThird(multi.getParameter("third"));
			rb.setGrade(multi.getParameter("grade"));
			rb.setDetails(multi.getParameter("details"));
			rb.setPrice(Integer.parseInt(multi.getParameter("price")));
			rb.setStart_date(multi.getParameter("start_date"));
			rb.setEnd_date(multi.getParameter("end_date"));
			rb.setMin_bid(Integer.parseInt(multi.getParameter("min_bid")));
			rb.setWin_bid(Integer.parseInt(multi.getParameter("win_bid")));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		regService.insertRegister(rb); //등록
		model.addAttribute("result", 1);

		return "register/register_write_ok";
	}
	
	//경매/구매 정렬&검색 통합
	@RequestMapping(value="/register_list.do")
	public String register_list(
			@RequestParam("cur_page") int cur_page, 
			@RequestParam(value="sort_num", required=false, defaultValue="0") int sort_num, 
			@RequestParam(value="filter_codeC", required=false) String filter_codeC,
			@RequestParam(value="filter_codeD", required=false) String filter_codeD,
			@RequestParam(value="search_key", required=false) String search_key,
			@RequestParam(value="search_txt", required=false) String search_txt, 
			Model model) {

		/*** 정렬 및 필터 설정 ***/
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
		if(filter_codeC != null) {
			switch (filter_codeC) {
				case "0": filterC = ""; break;
				case "c0": filterC = ""; break;
				case "c1": filterC = word+"classify='경매'"; break;
				case "c2": filterC = word+"classify='구매'"; break;
			}
			
			if(filterC == "" || filterC == "c0") {
				word = "where ";
			}else {
				word = " and ";
			}
		}
		if(filter_codeD != null) {
			switch (filter_codeD) {
				case "0": filterD = ""; break;
				case "d0": filterD = ""; break;
				case "d1": filterD = word+"deal_state='진행중'"; break;
				case "d2": filterD = word+"deal_state='기간만료'"; break;
				case "d3": filterD = word+"deal_state='거래완료'"; break;
				default: filterD = ""; break;
			}
		}
		String filter = filterC + filterD;
		
		/*** 검색 ***/
		if(word != "and") {
			word = "where ";
		}else {
			word = " and ";
		}
		
		String search = "";
		if(search_key != null && search_txt != null) {
			search = word + search_key+ " like '%"+ search_txt+ "%'";
		}
		
		System.out.println("-----------------search_key: "+search_key);
		System.out.println("-----------------search_txt: "+search_txt);
		System.out.println("-----------------search: "+search);
		
		int totalCnt = regService.getSearchSortCnt(filter, search); //필터된 글 개수
		int paging = (int)Math.ceil((double)totalCnt/lenPage); //페이징 수


		model.addAttribute("totalCnt", totalCnt); //전체 글 개수
		model.addAttribute("paging", paging); //페이징  수
		model.addAttribute("cur_page", cur_page); //현재 페이지
		 
		model.addAttribute("sort_num", sort_num); //정렬
		model.addAttribute("filter_codeC", filter_codeC); //필터
		model.addAttribute("filter_codeD", filter_codeD); //필터
		
		model.addAttribute("search_key", search_key); //검색항목(제목, 내용, 작성자)
		model.addAttribute("search_txt", search_txt); //검색어
		model.addAttribute("searchVO", new searchVO()); //검색 폼 ValueObject
		
		model.addAttribute("regList", regService.getListSearchSort(((cur_page-1)*lenPage), lenPage, search, filter, sort));

		return "register/register_list";
	}
	
	//경매/구매 상세페이지
	@RequestMapping(value="/register_view.do")
	public String register_view(@RequestParam("idx") int idx, 
			@RequestParam("cur_page") int cur_page, 
			@RequestParam(value="id", required=false) String id, 
			@RequestParam(value="QnA_type", required=false) String QnA_type, 
			@RequestParam(value="QnA_state", required=false) String QnA_state, 
			@RequestParam(value="QnA_text", required=false) String QnA_text, 
			@RequestParam(value="QnA_secret", required=false) String QnA_secret, 
			RegisterQnABean qnaBean, 
			Model model) {
		
		
		model.addAttribute("idx", idx); //글번호
		model.addAttribute("cur_page", cur_page); //현재 페이지
		
		if(QnA_text != null) {
			regService.insertQnA(qnaBean); //문의 등록 DB 저장
			model.addAttribute("regData", regService.getView(idx));
		}else {
			model.addAttribute("regData", regService.getViewHits(idx));
		}
		model.addAttribute("QnAData", regService.getQnAList(idx));
		
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
		
		int totalCnt = regService.getSearchSortCnt(null, null); //필터된 글 개수
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("cur_page", cur_page); //현재 페이지
		model.addAttribute("regList", regService.getListSearchSort(((cur_page-1)*lenPage), lenPage, null, null, "reg_date desc"));

		return "register/register_delete_ok";
	}

	//상세페이지 Q&A
	@RequestMapping(value="/registerQnA.do", method = RequestMethod.POST)
	public String registerQnA(
			@RequestParam("cur_page") int cur_page, 
			@RequestParam("idx") int idx,  //글번호
			@RequestParam(value="id", required=false) String id, 
			@RequestParam(value="QnA_type", required=false) String QnA_type, 
			@RequestParam(value="QnA_state", required=false) String QnA_state, 
			@RequestParam(value="QnA_text", required=false) String QnA_text, 
			@RequestParam(value="QnA_secret", required=false) String QnA_secret, 
			RegisterQnABean qnaBean, 
			Model model) {
		
		//DB 저장
		regService.insertQnA(qnaBean); //문의 등록

		model.addAttribute("idx", idx);
		model.addAttribute("cur_page", cur_page); //현재 페이지
		model.addAttribute("regData", regService.getView(idx));
		model.addAttribute("QnAData", regService.getQnAList(idx));
		
		return "register/register_view";
	}

}// class end
