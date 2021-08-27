drop table category;
-- 2021.08.27 카테고리 관리번호 num 추가
create table category(
	num int(5),
	first char(20),
	second char(20), 
	third char(20) 
)engine=myisam default charset=UTF8;

insert into category values(1,'전체','전체','전체');
insert into category values(2,'연예인/아이돌','전체','전체');
insert into category values(3,'연예인/아이돌','연예인','전체');
insert into category values(4,'연예인/아이돌','아이돌','전체');
insert into category values(5,'연예인/아이돌','아이돌','앨범/DVD');
insert into category values(6,'연예인/아이돌','아이돌','포토카드');
insert into category values(7,'연예인/아이돌','아이돌','기타');
insert into category values(8,'인터넷 방송','유튜브','전체');
insert into category values(9,'인터넷 방송','트위치','전체');
insert into category values(10,'인터넷 방송','아프리카TV','전체');
insert into category values(11,'애니메이션/만화','2D','전체');
insert into category values(12,'애니메이션/만화','3D','전체');
insert into category values(13,'기타','전체','전체');


select * from category;
