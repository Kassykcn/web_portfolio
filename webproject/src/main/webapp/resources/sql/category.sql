drop table category;

create table category(
	first char(20),
	second char(20), 
	third char(20) 
)engine=myisam default charset=euckr;

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


select * from category;
