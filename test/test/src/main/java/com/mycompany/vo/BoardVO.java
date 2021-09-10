package com.mycompany.vo;

import java.util.Date;

public class BoardVO {

//	idx int(10) not null primary key auto_increment, -- 글 번호
//	reg_date timestamp, -- 글 등록일
//	id varchar(20), -- 회원 id
//	classify varchar(10), -- 구분(구매 / 경매 / 입찰 / 낙찰)
//	classify_num int(10) default 0, -- 구분값이 입찰이나 낙찰일 때 해당 상품의 글번호
//	title varchar(20), -- 글 제목
//	first varchar(20), -- 카테고리 대분류
//	second varchar(20), -- 카테고리 중분류
//	third varchar(20), -- 카테고리 소분류
//	image varchar(20), -- 이미지 파일
//	grade varchar(5), -- 등급
//	details varchar(500), -- 상세설명
//	price int(10), -- 가격 - 구매일때만 사용
//	start_date date, -- 시작일 - 경매일때만 사용
//	end_date date, -- 종료일 - 경매일때만 사용
//	min_bid int(10), -- 최소 입찰가 - 경매일때만 사용
//	win_bid int(10), -- 즉시 낙찰가 - 경매일때만 사용
//	now_bid int(10) default 0, -- 현재 입찰가
//	final_bid int(10) default 0, -- 최종낙찰가
//	deal_way varchar(10), -- 거래방식(직거래 / 택배)
//	deal_state varchar(20),	-- 거래상태(진행중 / 기간마감 / 거래완료)  - 상세페이지에서 사용
//	deal_date date,	-- 거래일 - 상세페이지에서 사용
//	hits int(10) default 0 -- 조회수 - 상세페이지에서 사용

	private int idx;
	private Date reg_date;
	private String id;
	private String classify;
	private String title;

	private String first;
	private String second;
	private String third;
	private String image;
	private String grade;

	private int price;
	private int now_bid;
	private int win_bid;
	private int final_bid;
	private int hits;

	private Date start_date;
	private Date end_date;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNow_bid() {
		return now_bid;
	}
	public void setNow_bid(int now_bid) {
		this.now_bid = now_bid;
	}
	public int getWin_bid() {
		return win_bid;
	}
	public void setWin_bid(int win_bid) {
		this.win_bid = win_bid;
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
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
	
}
