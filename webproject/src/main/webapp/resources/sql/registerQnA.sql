-- 작성일 2021.09.01 LMJ 
-- 상세페이지 상품 문의
-- 수정일 2021.09.07 : 문의/답변 DB 분리
drop table registerQ;
drop table registerA;
-- 문의
create table registerQ(
	Q_idx int(10) primary key auto_increment, -- 상품 문의/답변 번호
	Q_date date, -- 문의일
	idx int(10), -- 문의하는 상품의 글 번호
	id varchar(20), -- 회원 id
	Q_secret char(1), -- 비공개 여부(Y, N)
	Q_state varchar(10), -- 문의 상태 : 답변대기, 답변완료
	Q_text varchar(500) -- 문의 내용 : 한글이나 영어 2바이트 * 200자 지원
)engine=innodb default charset=UTF8;

-- 답변
create table registerA(
	A_idx int(10) primary key auto_increment, -- 상품 문의/답변 번호
	A_date date, -- 답변일
	Q_idx int(10), -- 문의글 번호
	id varchar(20), -- 답변자 회원 id
	A_secret char(1), -- 비공개 여부(Y, N)
	A_text varchar(500) -- 문의 내용 : 한글이나 영어 2바이트 * 200자 지원
)engine=innodb default charset=UTF8;


select * from registerQ where idx=34 order by Q_idx desc
select * from registerA order by Q_idx desc
select * from registerQ where idx=34 and Q_idx = (select Q_idx from registerA)
select * from registerA where Q_idx = (select Q_idx from registerQ where idx=34)

select q.Q_idx, q.QnA_date, q.id, q.QnA_secret, q.QnA_text, 
 a.QnA_date, a.id, a.QnA_text 
from (select * from registerQ where idx=34) q, registerA a 
where  q.Q_idx = a.Q_idx;

select *
from (select * from registerQ where idx=34) q, registerA a 
where  q.Q_idx = a.Q_idx;


select * from registerQ q left join registerA a 
on idx=34 and q.Q_idx = a.Q_idx;

select * from registerQ q left join registerA a 
on q.Q_idx = a.Q_idx where idx=34 order by q.Q_idx desc;
