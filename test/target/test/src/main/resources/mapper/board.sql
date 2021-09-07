drop table register;

create table register(
	idx int(10) not null primary key auto_increment, -- �� ��ȣ
	reg_date timestamp, -- �� �����
	id varchar(20), -- ȸ�� id
	classify varchar(10), -- ����(���� / ��� / ���� / ����)
	title varchar(20), -- �� ����
	
	first varchar(20), -- ī�װ� ��з�
	second varchar(20), -- ī�װ� �ߺз�
	third varchar(20), -- ī�װ� �Һз�
	image varchar(20), -- �̹��� ����
	grade varchar(5), -- ���
	
	price int(10), -- ���� - �����϶��� ���
	win_bid int(10), -- ��� ������ - ����϶��� ���
	now_bid int(10) default 0, -- ���� ������
	final_bid int(10) default 0, -- ����������
	hits int(10) default 0, -- ��ȸ�� - ������������ ���

	start_date date, -- ������ - ����϶��� ���
	end_date date -- ������ - ����϶��� ���
)engine=innodb default charset=UTF8;


-- ���� SQL ���¿� �� ���� �Է�
insert into register(idx, reg_date, id, classify, title,  first, second, third, 
image, grade, start_date, end_date, price, win_bid, now_bid, final_bid, hits) 
values(null, now(), 'aaa', '����', 'aaa',  '��Ÿ', '��ü', '��ü', 
'aaa', 'S', '2021-08-31', '2021-09-01', 10000, 1000, 500, 800, 515);

delete from register ;

select * from register