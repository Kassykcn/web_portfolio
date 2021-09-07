package web.my.bean;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class RegisterBean {
	int idx, price, min_bid, win_bid, now_bid, final_bid, hits;
	String reg_date, start_date, end_date, deal_date;
	String first, second, third; // 카테고리 대,중,소분류
	String id, classify, classify_num, title, grade, details, deal_way, deal_state;
	String image1, image2;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMin_bid() {
		return min_bid;
	}
	public void setMin_bid(int min_bid) {
		this.min_bid = min_bid;
	}
	public int getWin_bid() {
		return win_bid;
	}
	public void setWin_bid(int win_bid) {
		this.win_bid = win_bid;
	}
	public int getNow_bid() {
		return now_bid;
	}
	public void setNow_bid(int now_bid) {
		this.now_bid = now_bid;
	}
	public int getFinal_bid() {
		return final_bid;
	}
	public void setFinal_bid(int final_bid) {
		this.final_bid = final_bid;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getDeal_date() {
		return deal_date;
	}
	public void setDeal_date(String deal_date) {
		this.deal_date = deal_date;
	}
	public String getFirst() {
		return first;
	}
	public void setFirst(String first) {
		this.first = first;
	}
	public String getSecond() {
		return second;
	}
	public void setSecond(String second) {
		this.second = second;
	}
	public String getThird() {
		return third;
	}
	public void setThird(String third) {
		this.third = third;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getClassify_num() {
		return classify_num;
	}
	public void setClassify_num(String classify_num) {
		this.classify_num = classify_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getDeal_way() {
		return deal_way;
	}
	public void setDeal_way(String deal_way) {
		this.deal_way = deal_way;
	}
	public String getDeal_state() {
		return deal_state;
	}
	public void setDeal_state(String deal_state) {
		this.deal_state = deal_state;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	
}
