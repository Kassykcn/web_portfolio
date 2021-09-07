drop table member

create table member(
mno int not null auto_increment,
id varchar(20),
pwd varchar(20),
name varchar(20),
email varchar(35),
phone varchar(30),
auth int(3),
primary key(mno)
)engine=innodb default charset=utf8;

select * from member

insert into member values(null, 'nam', '123', 'n', 'kc@kc.kc', '01011112345', null)
insert into member values(null, 'nam12', '123', 'n12', 'kc12@kc.kc', '01011112345', null)
insert into member values(null, 'nam23', '123', 'n23', 'kc23@kc.kc', '01011112345', 999)
insert into member values(null, 'nam34', '123', 'n34', 'kc34@kc.kc', '01011112345', null)
insert into member values(null, 'nam45', '123', 'n45', 'kc45@kc.kc', '01011112345', null)
insert into member values(null, 'nam56', '123', 'n56', 'kc5565@kc.kc', '01011112345', null)
insert into member values(null, 'nam67', '123', 'n67', 'kc67@kc.kc', '01011112345', null)
insert into member values(null, 'nam78', '123', 'n78', 'kc78@kc.kc', '01011112345', 999)

		select
		mno, id, name, phone,
		email
		from
		(
		select
		@rownum := @rownum + 1 as rn, m.*
		from member m, (select @rownum := 0) t
		) a
		where rn between 1
		and
		10
		order by mno desc;