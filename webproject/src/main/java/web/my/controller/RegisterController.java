package web.my.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.my.bean.RegisterBean;
import web.my.bean.RegisterQnABean;
import web.my.service.RegisterService;
import web.my.utils.FileUploadService;
import web.my.utils.SortFilterSearch;
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
			@RequestParam(value="imageFile", required=false) MultipartFile imageFile) {
		
		try {
			//System.out.println("-----------------imageFile: "+imageFile);
			if(imageFile != null) {
				FileUploadService fileUploadService = new FileUploadService();
				String fileName = fileUploadService.upload(imageFile);
				//System.out.println("-----------------fileName: "+fileName);
				rb.setImage(fileName);
			}else {
				rb.setImage(null);
			}
		} catch (Exception e) {
			System.out.println("[ERROR]===================imageFile");
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

		
		SortFilterSearch sfs = new SortFilterSearch();
		
		String sort = sfs.getSort(sort_num);
		String filter = sfs.getFilter(filter_codeC, filter_codeD);
		
		
		String search = sfs.getSearch(search_key, search_txt);
		
		
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
			@RequestParam(value="Q_idx", required=false) String Q_idx, 
			@RequestParam(value="QnA", required=false) String QnA, 
			@RequestParam(value="Q_secret", required=false) String Q_secret, 
			RegisterQnABean qnaBean, 
			Model model) {
		
		
		model.addAttribute("idx", idx); //글번호
		model.addAttribute("cur_page", cur_page); //현재 페이지
		
		System.out.println("---------------Q_idx :"+Q_idx);
		System.out.println("---------------QnA :"+QnA);
		if(QnA != null) {
			if(QnA.equals("Q")) {
				System.out.println("------------------------문의");
				regService.insertQ(qnaBean); //문의 등록 DB 저장
				model.addAttribute("regData", regService.getView(idx));
			}else if(QnA.equals("A") && Q_idx != null) {
				System.out.println("------------------------답변");
				regService.insertA(qnaBean); //답변 등록 DB 저장
				regService.update_QnA_state(Integer.parseInt(Q_idx)); // 답변 상태 변경
			}
			model.addAttribute("regData", regService.getView(idx));	
		}else {
			model.addAttribute("regData", regService.getViewHits(idx));
		}
		
		int QnA_cnt = regService.getQnACnt(idx);
		System.out.println("---------------QnA_cnt :"+QnA_cnt);
		if(QnA_cnt != 0) {
			model.addAttribute("Q_secret", Q_secret); //비공개 여부
			model.addAttribute("QnAData", regService.getQnAList(idx));
		}
		
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
			Model model,
			@RequestParam(value="imageFile", required=false) MultipartFile imageFile,
			@RequestParam(value="oldFile", required=false) String oldFile,
			@RequestParam(value="newFile_length", required=false) int newFile_length) {
		
		try {
			System.out.println("-----------------oldFile: "+oldFile);
			System.out.println("-----------------newFile_length: "+newFile_length);
			
			if(newFile_length != 0 || newFile_length > 1) {
				FileUploadService fileUploadService = new FileUploadService();
				String fileName = fileUploadService.upload(imageFile);
				System.out.println("-----------------fileName: "+fileName);
				
				
				rb.setImage(fileName);
			}else {
				if(oldFile == null) 
					rb.setImage(null);
				else
					rb.setImage(oldFile);
			}
		} catch (Exception e) {
			System.out.println("[ERROR]===================imageFile");
			e.printStackTrace();
		}
		
			
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

}// class end
