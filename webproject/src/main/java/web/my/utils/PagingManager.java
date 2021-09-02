package web.my.utils;

import org.springframework.stereotype.Repository;

//페이징 처리 유틸 파일
@Repository
public class PagingManager {
	private static final PagingManager pageNumberingManager = new PagingManager();

	private PagingManager() {}
	
	public static PagingManager getInstance() {
		return pageNumberingManager;
	}
	
	public int getTotalPage(int total_cnt, int rowsPerPage) {
		int total_pages = 0;
		
		if( (total_cnt%rowsPerPage) == 0 ) 
			total_pages = total_cnt/rowsPerPage;
		else 
			total_pages = (total_cnt/rowsPerPage) + 1;
		
		return total_pages;
	}
	
	//게시판의 block 처리 추가, 이전/다음 블럭 버튼 처리
	public int getPageBlock(int curPage, int pagePerBlock) {
		int block = 0;
		if( (curPage % pagePerBlock) == 0)
			block = curPage/pagePerBlock;
		else 
			block = (curPage/pagePerBlock) +1;
		return block;
	}
	
	//block에 속한 첫번째 페이지 계산
	public int getFirstPageInBlock(int block, int pagePerBlock) {
		return ( (block-1) * pagePerBlock + 1 );
	}
	//block에 속한 마지막 페이지 계산
	public int getLastPageInBlock(int block, int pagePerBlock) {
		return ( block * pagePerBlock );
	}
	
}
