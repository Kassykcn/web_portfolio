drop table register;

create table register(
	idx int(10) not null primary key auto_increment, -- 글 번호
	reg_date timestamp, -- 글 등록일
	id varchar(20), -- 회원 id
	classify varchar(10), -- 구분(구매 / 경매 / 입찰 / 낙찰)
	title varchar(20), -- 글 제목
	
	first varchar(20), -- 카테고리 대분류
	second varchar(20), -- 카테고리 중분류
	third varchar(20), -- 카테고리 소분류
	image varchar(20), -- 이미지 파일
	grade varchar(5), -- 등급
	
	price int(10), -- 가격 - 구매일때만 사용
	win_bid int(10), -- 즉시 낙찰가 - 경매일때만 사용
	now_bid int(10) default 0, -- 현재 입찰가
	final_bid int(10) default 0, -- 최종낙찰가
	hits int(10) default 0, -- 조회수 - 상세페이지에서 사용

	start_date date, -- 시작일 - 경매일때만 사용
	end_date date -- 종료일 - 경매일때만 사용
)engine=innodb default charset=UTF8;


-- 매퍼 SQL 형태에 값 직접 입력
insert into register(idx, reg_date, id, classify, title,  first, second, third, 
image, grade, start_date, end_date, price, win_bid, now_bid, final_bid, hits) 
values(null, now(), 'aaa', '구매', 'aaa',  '기타', '전체', '전체', 
'aaa', 'S', '2021-08-31', '2021-09-01', 10000, 1000, 500, 800, 515);

delete from register ;

select * from register