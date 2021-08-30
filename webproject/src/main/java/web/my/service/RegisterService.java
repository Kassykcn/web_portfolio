package web.my.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.my.bean.RegisterBean;
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
	public ArrayList<String> getCategorySecond() {
		return regMapper.getCategorySecond();
	}

	@Override
	public ArrayList<String> getCategoryThird() {
		return regMapper.getCategoryThird();
	}

	//등록
	@Override 
	public void insertRegister(RegisterBean rb) {
		regMapper.insertRegister(rb);
	}

	//게시글 총 개수 조회
	@Override
	public int getTotalCnt() {
		return regMapper.getTotalCnt();
	}
	//목록 불러오기
	@Override
	public ArrayList<RegisterBean> getList() {
		// TODO Auto-generated method stub
		return regMapper.getList();
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
		// TODO Auto-generated method stub
	}

	@Override
	public void updateRegister(RegisterBean rb) {
		regMapper.updateRegister(rb.getIdx(), rb.getTitle(), rb.getFirst(), rb.getSecond(), 
					   rb.getThird(), rb.getImage(), rb.getGrade(), rb.getDetails(), 
					   rb.getStart_date(), rb.getEnd_date(), rb.getPrice(), 
					   rb.getMin_bid(), rb.getWin_bid());
		
	}

	@Override
	public void updateRegister(int idx, String title, String first, String second, String third, String image,
			String grade, String details, String start_date, String end_date, int price, int min_bid, int win_bid) {
		// TODO Auto-generated method stub
	}


	
	
}
