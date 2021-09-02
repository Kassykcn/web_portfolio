--ȸ��
CREATE TABLE MBER
(
	-- ȸ�� ���̵�
	MBER_ID varchar(20) NOT NULL ,
	-- ȸ�� �н�����
	MBER_PW varchar(20) NOT NULL,
	-- ȸ�� �Ǹ�
	MBER_RLNM varchar(21) NOT NULL,
	-- ���� �ڵ�
	BANK_CODE varchar(4),
	-- ȸ�� ���¹�ȣ
	MBER_ACOUNTNO varchar(15),
	-- ȸ�� �̸���
	MBER_EMAIL varchar(30) NOT NULL ,
	-- ȸ�� �г���
	MBER_NCNM varchar(30) NOT NULL,
	-- ȸ�� ��ȭ��ȣ
	MBER_TEL varchar(13),
	-- ȸ�� �������
	MBER_BRTHDY varchar(8),
	-- ȸ�� Ż�� ����
	MBER_SECSN_AT char NOT NULL,
	PRIMARY KEY (MBER_CODE)
)engine=innodb default charset=euckr;



-- ���� ����
CREATE TABLE WALLET_DTLS
(
	-- ȸ�� �ڵ�
	MBER_CODE varchar(4) NOT NULL,
	-- ����� �Ͻ�
	RCPPAY_DT timestamp NOT NULL,
	-- ����� �з�
	RCPPAY_CL char NOT NULL,
	-- ����� �ݾ�
	RCPPAY_AMOUNT int NOT NULL,
	-- ȯ�� ����Ʈ ��
	EXCNG_COIN_CO int NOT NULL,
	PRIMARY KEY (MBER_CODE, RCPPAY_DT)
)engine=innodb default charset=euckr;


-- �������� �̷�
CREATE TABLE WALLET_DTLS_HIST
(
	-- ��� �Ͻ�
	RCORD_DT timestamp NOT NULL,
	-- �̷� ����
	HIST_SE varchar(20) NOT NULL,
	-- ����� ����
	RCPPAY_DT timestamp,
	-- ����� �з�
	RCPPAY_CL char NOT NULL,
	-- ����� �ݾ�
	RCPPAY_AMOUNT int NOT NULL,
	-- ȯ�� ����Ʈ ��
	EXCNG_COIN_CO int NOT NULL,
	-- ����Ʈ ��
	COIN_CO int,
	PRIMARY KEY (RCORD_DT)
)engine=innodb default charset=euckr;

-- ����Ʈ �����
CREATE TABLE COIN_REPOSITORY
(
	-- �ŷ� �ڵ�
	DELNG_CODE varchar(6) NOT NULL,
	-- ȸ�� �ڵ�
	MBER_CODE varchar(4) NOT NULL,
	-- ���� �ڵ�
	SETLE_CODE varchar(4) NOT NULL,
	-- �ŷ� �Ͻ�
	DELNG_DT timestamp NOT NULL,
	-- �ŷ� �з�
	DELNG_SE char NOT NULL,
	-- �ŷ� �ݾ�
	DELNG_AMOUNT int NOT NULL,
	-- ���� ����Ʈ ��
	REPOSITORY_COIN_CO int NOT NULL,
	PRIMARY KEY (DELNG_CODE)
)engine=innodb default charset=euckr;