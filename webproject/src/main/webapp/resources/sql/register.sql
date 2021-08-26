-- 2021.08.25 auction_register -> register로 명칭변경
drop table register;

create table register(
	row_num int(10) not null primary key auto_increment, -- 글 번호
	row_date timestamp, -- 글 등록일
	id varchar(20), -- 회원 id
	classify varchar(10), -- 구분 - 구매 buy / 경매 auction /  입찰 bid / 낙찰 success
	title varchar(20), -- 글 제목
	category varchar(20), -- 카테고리
	image varchar(20), -- 이미지 파일
	grade varchar(5), -- 등급
	details varchar(200), -- 상세설명
	price int(10), -- 가격 - 구매일때만 사용
	start_date date, -- 시작일 - 경매일때만 사용
	end_date date, -- 종료일 - 경매일때만 사용
	min_bid int(10), -- 최소 입찰가 - 경매일때만 사용
	win_bid int(10), -- 즉시 낙찰가 - 경매일때만 사용
	hits int(10) default 0
)engine=innodb default charset=euckr;

insert into register values(
	null, now(), 'aaa', 'buy', 'title', 'idol', null, 'S', 'good', 0, 
	'2021-02-01', '2021-05-01', 10000, 100000, 0
);

select * from register;