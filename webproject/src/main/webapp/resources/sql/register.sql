-- 작성일 2021.08.25 LMJ 
-- 수정일 2021.08.26
drop table register;

create table register(
	row_num int(10) not null primary key auto_increment, -- 글 번호
	row_date timestamp, -- 글 등록일
	id varchar(20), -- 회원 id
	classify varchar(10), -- 구분 - 구매 buy / 경매 auction /  입찰 bid / 낙찰 success
	classify_num int(10), -- 구분값이 입찰이나 낙찰일 때 해당 상품의 글번호
	title varchar(20), -- 글 제목
	category int(5), -- 카테고리 번호
	image varchar(20), -- 이미지 파일
	grade varchar(5), -- 등급
	details varchar(200), -- 상세설명
	price int(10), -- 가격 - 구매일때만 사용
	start_date date, -- 시작일 - 경매일때만 사용
	end_date date, -- 종료일 - 경매일때만 사용
	min_bid int(10), -- 최소 입찰가 - 경매일때만 사용
	win_bid int(10), -- 즉시 낙찰가 - 경매일때만 사용
	now_bid int(10), -- 현재 입찰가
	final_bid int(10), -- 최종낙찰가
	deal_way varchar(10), -- 거래방식 - 직거래 direct / 택배 delivery
	deal_state varchar(20),	-- 거래상태 - 진행중 ongoing / 기간마감  close / 거래 완료 complete  - 상세페이지에서 사용
	deal_date date,	-- 거래일 - 상세페이지에서 사용
	hits int(10) default 0 -- 조회수 - 상세페이지에서 사용
)engine=innodb default charset=UTF8;

insert into register values(
	null, now(), 'aaa', 'buy', 0, 'title', 4, null, 'S', 'good', 100000, 
	'2021-08-25', '2021-08-27', 0, 0, 0, 0, 'direct', 'ongoing', null, 0
);
insert into register values(
	null, now(), 'bbb', 'auction', 10, 'title', 13, null, 'A', 'good', 0, 
	'2021-08-25', '2021-08-27', 10000, 100000, 11000, 0, 'delivery', 'ongoing', null, 0
);
insert into register values(
	null, now(), 'ccc', 'auction', 10, 'title', 13, null, 'A', 'good', 0, 
	'2021-08-25', '2021-08-27', 10000, 100000, 12000, 0, 'delivery', 'ongoing', null, 0
);
insert into register values(
	null, now(), 'ddd', 'auction', 10, 'title', 13, null, 'A', 'good', 0, 
	'2021-08-25', '2021-08-27', 10000, 100000, 0, 100000, 'delivery', 'complete', null, 0
);

select * from register;