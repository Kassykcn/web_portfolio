--회원
CREATE TABLE MBER
(
	-- 회원 아이디
	MBER_ID varchar(20) NOT NULL ,
	-- 회원 패스워드
	MBER_PW varchar(20) NOT NULL,
	-- 회원 실명
	MBER_RLNM varchar(21) NOT NULL,
	-- 은행 코드
	BANK_CODE varchar(4),
	-- 회원 계좌번호
	MBER_ACOUNTNO varchar(15),
	-- 회원 이메일
	MBER_EMAIL varchar(30) NOT NULL ,
	-- 회원 닉네임
	MBER_NCNM varchar(30) NOT NULL,
	-- 회원 전화번호
	MBER_TEL varchar(13),
	-- 회원 생년월일
	MBER_BRTHDY varchar(8),
	-- 회원 탈퇴 여부
	MBER_SECSN_AT char NOT NULL,
	PRIMARY KEY (MBER_CODE)
)engine=innodb default charset=euckr;



-- 지갑 내역
CREATE TABLE WALLET_DTLS
(
	-- 회원 코드
	MBER_CODE varchar(4) NOT NULL,
	-- 입출금 일시
	RCPPAY_DT timestamp NOT NULL,
	-- 입출금 분류
	RCPPAY_CL char NOT NULL,
	-- 입출금 금액
	RCPPAY_AMOUNT int NOT NULL,
	-- 환전 포인트 수
	EXCNG_COIN_CO int NOT NULL,
	PRIMARY KEY (MBER_CODE, RCPPAY_DT)
)engine=innodb default charset=euckr;


-- 지갑내역 이력
CREATE TABLE WALLET_DTLS_HIST
(
	-- 기록 일시
	RCORD_DT timestamp NOT NULL,
	-- 이력 구분
	HIST_SE varchar(20) NOT NULL,
	-- 입출금 일자
	RCPPAY_DT timestamp,
	-- 입출금 분류
	RCPPAY_CL char NOT NULL,
	-- 입출금 금액
	RCPPAY_AMOUNT int NOT NULL,
	-- 환전 포인트 수
	EXCNG_COIN_CO int NOT NULL,
	-- 포인트 수
	COIN_CO int,
	PRIMARY KEY (RCORD_DT)
)engine=innodb default charset=euckr;

-- 포인트 저장소
CREATE TABLE COIN_REPOSITORY
(
	-- 거래 코드
	DELNG_CODE varchar(6) NOT NULL,
	-- 회원 코드
	MBER_CODE varchar(4) NOT NULL,
	-- 결제 코드
	SETLE_CODE varchar(4) NOT NULL,
	-- 거래 일시
	DELNG_DT timestamp NOT NULL,
	-- 거래 분류
	DELNG_SE char NOT NULL,
	-- 거래 금액
	DELNG_AMOUNT int NOT NULL,
	-- 저장 포인트 수
	REPOSITORY_COIN_CO int NOT NULL,
	PRIMARY KEY (DELNG_CODE)
)engine=innodb default charset=euckr;