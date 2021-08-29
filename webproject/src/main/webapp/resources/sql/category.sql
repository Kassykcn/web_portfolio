drop table category;
-- 2021.08.27 카테고리 관리번호 num 추가
-- 2021.08.29 카테고리 관리번호 num 삭제

create table category(
	first varchar(20),
	second varchar(20), 
	third varchar(20) 
)engine=innodb default charset=UTF8;

insert into category values('전체','전체','전체');
insert into category values('연예인/아이돌','전체','전체');
insert into category values('연예인/아이돌','연예인','전체');
insert into category values('연예인/아이돌','아이돌','전체');
insert into category values('연예인/아이돌','아이돌','앨범/DVD');
insert into category values('연예인/아이돌','아이돌','포토카드');
insert into category values('연예인/아이돌','아이돌','기타');
insert into category values('인터넷 방송','유튜브','전체');
insert into category values('인터넷 방송','트위치','전체');
insert into category values('인터넷 방송','아프리카TV','전체');
insert into category values('애니메이션/만화','2D','전체');
insert into category values('애니메이션/만화','3D','전체');
insert into category values('기타','전체','전체');

desc category;
select * from category;
select distinct first from category ;
select distinct first,second, third from category ;