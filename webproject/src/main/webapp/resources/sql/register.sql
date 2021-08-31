-- 작성일 2021.08.25 LMJ 
-- 수정일 2021.08.26
-- 수정 08.29 각각의 카테고리 컬럼 추가
drop table register;

create table register(
	idx int(10) not null primary key auto_increment, -- 글 번호
	reg_date timestamp, -- 글 등록일
	id varchar(20), -- 회원 id
	classify varchar(10), -- 구분(구매 / 경매 / 입찰 / 낙찰)
	classify_num int(10) default 0, -- 구분값이 입찰이나 낙찰일 때 해당 상품의 글번호
	title varchar(20), -- 글 제목
	first varchar(20), -- 카테고리 대분류
	second varchar(20), -- 카테고리 중분류
	third varchar(20), -- 카테고리 소분류
	image varchar(20), -- 이미지 파일
	grade varchar(5), -- 등급
	details varchar(200), -- 상세설명
	price int(10), -- 가격 - 구매일때만 사용
	start_date date, -- 시작일 - 경매일때만 사용
	end_date date, -- 종료일 - 경매일때만 사용
	min_bid int(10), -- 최소 입찰가 - 경매일때만 사용
	win_bid int(10), -- 즉시 낙찰가 - 경매일때만 사용
	now_bid int(10) default 0, -- 현재 입찰가
	final_bid int(10) default 0, -- 최종낙찰가
	deal_way varchar(10), -- 거래방식(직거래 / 택배)
	deal_state varchar(20),	-- 거래상태(진행중 / 기간마감 / 거래완료)  - 상세페이지에서 사용
	deal_date date,	-- 거래일 - 상세페이지에서 사용
	hits int(10) default 0 -- 조회수 - 상세페이지에서 사용
)engine=innodb default charset=UTF8;


-- 매퍼 SQL 형태에 값 직접 입력
insert into register(idx, reg_date, id, classify, title,  first, second, third, 
image, grade, details, start_date, end_date, price, min_bid, win_bid, deal_state ) 
values(null, now(), 'aaa', '구매', 'aaa',  '기타', '전체', '전체', 
null, 'S', 'aaaa', '2021-08-29', '2021-08-30', 10000, 0, 0, '진행중');

insert into register(idx, reg_date, id, classify, title,  first, second, third, 
image, grade, details, start_date, end_date, price, min_bid, win_bid, deal_state ) 
values(null, now(), 'aaa', '구매', 'a111',  '기타', '전체', '전체', 
null, 'S', 'aaaa', '2021-08-29', '2021-08-30', 10000, 0, 0, '진행중');

insert into register(idx, reg_date, id, classify, title,  first, second, third, 
image, grade, details, start_date, end_date, price, min_bid, win_bid, deal_state ) 
values(null, now(), 'aaa', '경매', 'aa11',  '기타', '전체', '전체', 
null, 'S', 'aaaa', '2021-08-29', '2021-08-30', 10000, 0, 0, '진행중');

-- 확인용
select * from register order by reg_date desc, idx desc;
select count(1) from register;
select ceil(count(1)/5) from register;

---------------------------------------------------------------------------
select a.* from ( select * from register where title like '%포토%' 
				  order by reg_date desc, idx desc) a 
limit 5 offset 0;

select a.* from (select * from register order by reg_date desc, idx desc) a 
limit 5 offset 0;
-------------------------------------------
select count(1) from register where title like '%포토%' ;

