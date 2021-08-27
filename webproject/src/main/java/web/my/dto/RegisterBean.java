package web.my.dto;

import org.springframework.stereotype.Repository;

@Repository
public class RegisterBean {
	int row_num, category, price, min_bid, win_bid, now_bid, final_bid, hits;
	String row_date, start_date, end_date, deal_date;
	String id, classify, classify_num, title, image, grade, details, deal_way, deal_state;
	
	public int getRow_num() {
		return row_num;
	}
	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
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
	public String getRow_date() {
		return row_date;
	}
	public void setRow_date(String row_date) {
		this.row_date = row_date;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
	
}
