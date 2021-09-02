-- 작성일 2021.09.01 LMJ 
-- 상세페이지 상품 문의
drop table registerQnA;
create table registerQnA(
	Q_idx int(10) primary key auto_increment, -- 상품 문의 번호
	A_idx int(10), -- 상품 답변 번호
	QnA_date date, -- 문의일
	idx int(10), -- 문의하는 상품의 글 번호
	id varchar(20), -- 회원 id
	QnA_secret char(1), -- 비공개 여부(Y, N)
	QnA_type char(1), -- 구분(질문 Q, 답변 A)
	QnA_state varchar(10), -- 문의 상태 : 답변대기, 답변완료
	QnA_text varchar(500) -- 문의 내용 : 한글이나 영어 2바이트 * 200자 지원
)engine=innodb default charset=UTF8;

select * from registerQnA ;


insert into registerQnA values(
null, 5, now(), 28, '123', 'Y', 'A', '답변완료', '답변입니다.');
