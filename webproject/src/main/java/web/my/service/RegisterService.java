package web.my.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.my.bean.RegisterBean;
import web.my.bean.RegisterQnABean;
import web.my.mapper.RegisterMapper;

@Service //자동으로 빈 생성
public class RegisterService implements RegisterMapper{
	@Autowired //자동으로 빈 주입하여 setter가 필요하지 않다.
	private RegisterMapper regMapper;
	
	//카테고리 DB불러오기
	@Override
	public ArrayList<String> getCategoryFirst() {
		return regMapper.getCategoryFirst();
	}
	@Override
	public ArrayList<String> getCategorySecond(String first) {
		return regMapper.getCategorySecond(first);
	}
	@Override
	public ArrayList<String> getCategoryThird(String second) {
		return regMapper.getCategoryThird(second);
	}

	
	//등록
	@Override 
	public void insertRegister(RegisterBean rb) {
		regMapper.insertRegister(rb);
	}


	//목록 전체 개수 구하기 - 정렬, 필터, 검색 통합
	@Override
	public int getSearchSortCnt(String filter, String search) {
		return regMapper.getSearchSortCnt(filter, search);
	}
	//목록 - 정렬, 필터, 검색 통합
	@Override
	public ArrayList<RegisterBean> getListSearchSort(int page, int lenPage, String search, String filter, String sort) {
		return regMapper.getListSearchSort(page, lenPage, search, filter, sort);
	}

	
	//조회수 올리지 않는 상세 페이지
	@Override
	public RegisterBean getView(int id) {
		return regMapper.getView(id);
	}
	//조회수 올리는 상세 페이지
	@Override
	public RegisterBean getViewHits(int id) {
		regMapper.hitUp(id);
		return regMapper.getView(id);
	}
	@Override
	public void hitUp(int idx) {
	}
	
	//수정
	@Override
	public void updateRegister(RegisterBean rb) {
		regMapper.updateRegister(rb);
		
	}
	
	//삭제
	@Override
	public void deleteRegister(int idx) {
		regMapper.deleteRegister(idx);
	}
	
	//상세페이지 QnA 문의 등록
	@Override
	public void insertQ(RegisterQnABean qnaBean) {
		regMapper.insertQ(qnaBean);
	}
	
	//QnA 보기
	@Override
	public ArrayList<RegisterQnABean> getQnAList(int idx) {
		return regMapper.getQnAList(idx);
	}
	@Override
	public int getQnACnt(int idx) {
		return regMapper.getQnACnt(idx);
	}
	
	//QnA 답변 등록
	@Override
	public void insertA(RegisterQnABean qnaBean) {
		regMapper.insertA(qnaBean);
	}
	@Override
	public void update_QnA_state(int Q_idx) {
		regMapper.update_QnA_state(Q_idx);
	}
	
	//상세페이지 입찰/낙찰/구매 처리
	@Override
	public void update_now_bid(RegisterBean rb) {
		regMapper.update_now_bid(rb);
	}
	@Override
	public void update_win_bid(RegisterBean rb) {
		regMapper.update_win_bid(rb);
	}
	@Override
	public void update_buy(RegisterBean rb) {
		regMapper.update_buy(rb);
	}
	
	
}
