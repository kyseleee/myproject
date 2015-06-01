
/* 지출추가 */
CREATE TABLE add_payment (
	pay_no INTEGER NOT NULL, /* 지출일련번호 */
	group_no INTEGER, /* 그룹일련번호 */
	method CHAR(1) NOT NULL, /* 결제수단 */
	receit VARCHAR2(255), /* 영수증 */
	pay_date DATE NOT NULL, /* 지출날짜 */
	pay_name VARCHAR2(50) NOT NULL, /* 지출상호명 */
	amount INTEGER NOT NULL /* 지출금액 */
);

COMMENT ON TABLE add_payment IS '지출추가';

COMMENT ON COLUMN add_payment.pay_no IS '지출일련번호';

COMMENT ON COLUMN add_payment.group_no IS '그룹일련번호';

COMMENT ON COLUMN add_payment.method IS '결제수단';

COMMENT ON COLUMN add_payment.receit IS '영수증';

COMMENT ON COLUMN add_payment.pay_date IS '지출날짜';

COMMENT ON COLUMN add_payment.pay_name IS '지출상호명';

COMMENT ON COLUMN add_payment.amount IS '지출금액';

CREATE UNIQUE INDEX PK_add_payment
	ON add_payment (
		pay_no ASC
	);

CREATE INDEX IX_add_payment
	ON add_payment (
	);

ALTER TABLE add_payment
	ADD
		CONSTRAINT PK_add_payment
		PRIMARY KEY (
			pay_no
		);

/* 회원 */
		
CREATE SEQUENCE seq_tb_user_user_no	 	INCREMENT BY 1 START WITH 10000;
		
		
CREATE TABLE tb_user (
	user_no INTEGER NOT NULL, /* 회원일련번호 */
	id VARCHAR2(50) NOT NULL, /* 아이디 */
	pw VARCHAR2(50) NOT NULL, /* 비밀번호 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	user_name VARCHAR2(50) NOT NULL, /* 이름 */
	tel VARCHAR2(30) NOT NULL /* 전화번호 */
);

COMMENT ON TABLE tb_user IS '회원';

COMMENT ON COLUMN tb_user.user_no IS '회원일련번호';

COMMENT ON COLUMN tb_user.id IS '아이디';

COMMENT ON COLUMN tb_user.pw IS '비밀번호';

COMMENT ON COLUMN tb_user.email IS '이메일';

COMMENT ON COLUMN tb_user.user_name IS '이름';

COMMENT ON COLUMN tb_user.tel IS '전화번호';

CREATE UNIQUE INDEX PK_tb_user
	ON tb_user (
		user_no ASC
	);

CREATE UNIQUE INDEX UIX_tb_user
	ON tb_user (
		id ASC
	);

CREATE INDEX IX_tb_user
	ON tb_user (
		user_name ASC
	);

ALTER TABLE tb_user
	ADD
		CONSTRAINT PK_tb_user
		PRIMARY KEY (
			user_no
		);

ALTER TABLE tb_user
	ADD
		CONSTRAINT UK_tb_user
		UNIQUE (
			id
		);

/* 그룹 */
CREATE TABLE tb_group (
	group_no INTEGER NOT NULL, /* 그룹일련번호 */
	user_no INTEGER NOT NULL, /* 그룹생성자일련번호 */
	group_name VARCHAR2(50) NOT NULL, /* 그룹명 */
	group_date DATE NOT NULL /* 그룹생성날짜 */
);

COMMENT ON TABLE tb_group IS '그룹';

COMMENT ON COLUMN tb_group.group_no IS '그룹일련번호';

COMMENT ON COLUMN tb_group.user_no IS '그룹생성자일련번호';

COMMENT ON COLUMN tb_group.group_name IS '그룹명';

COMMENT ON COLUMN tb_group.group_date IS '그룹생성날짜';

CREATE UNIQUE INDEX PK_tb_group
	ON tb_group (
		group_no ASC
	);

CREATE UNIQUE INDEX UIX_tb_group
	ON tb_group (
		group_name ASC,
		user_no ASC
	);

ALTER TABLE tb_group
	ADD
		CONSTRAINT PK_tb_group
		PRIMARY KEY (
			group_no
		);

ALTER TABLE tb_group
	ADD
		CONSTRAINT UK_tb_group
		UNIQUE (
			group_name,
			user_no
		);

/* 그룹회원 */
CREATE TABLE group_arr (
	user_no INTEGER NOT NULL, /* 회원일련번호 */
	group_no INTEGER NOT NULL, /* 그룹일련번호 */
	role CHAR(1) DEFAULT 1 NOT NULL /* 권한 */
);

COMMENT ON TABLE group_arr IS '그룹회원';

COMMENT ON COLUMN group_arr.user_no IS '회원일련번호';

COMMENT ON COLUMN group_arr.group_no IS '그룹일련번호';

COMMENT ON COLUMN group_arr.role IS '권한';

CREATE UNIQUE INDEX PK_group_arr
	ON group_arr (
		user_no ASC,
		group_no ASC
	);

ALTER TABLE group_arr
	ADD
		CONSTRAINT PK_group_arr
		PRIMARY KEY (
			user_no,
			group_no
		);

CREATE SEQUENCE seq_group_money_gm_no	 	INCREMENT BY 1 START WITH 10000;		
		
/* 회비 */
CREATE TABLE group_money (
	gm_no INTEGER NOT NULL, /* 회비일련번호 */
	group_no INTEGER NOT NULL, /* 그룹일련번호 */
	gm_name VARCHAR2(50) NOT NULL, /* 회비명 */
	gm_date DATE NOT NULL, /* 회비날짜 */
	gm INTEGER NOT NULL/*개인회비*/
);

COMMENT ON COLUMN group_money.gm_no IS '회비일련번호';

COMMENT ON COLUMN group_money.group_no IS '그룹일련번호';

COMMENT ON COLUMN group_money.gm_name IS '회비명';

COMMENT ON COLUMN group_money.gm_date IS '회비날짜';

COMMENT ON COLUMN group_money.gm IS '개인회비';

CREATE UNIQUE INDEX PK_group_money
	ON group_money (
		gm_no ASC
	);

CREATE INDEX IX_group_money
	ON group_money (
		gm_name ASC
	);

ALTER TABLE group_money
	ADD
		CONSTRAINT PK_group_money
		PRIMARY KEY (
			gm_no
		);

/* 회비납부내역 */
CREATE TABLE gm_paid (
	group_no INTEGER NOT NULL, /* 그룹일련번호 */
	user_no INTEGER NOT NULL, /* 회원일련번호 */
	gm_no INTEGER NOT NULL, /* 회비일련번호 */
	paid CHAR(1) NOT NULL, /* 수납여부 */
	rec_date DATE NOT NULL /* 수납일 */
);

COMMENT ON TABLE gm_paid IS '회비납부내역';

COMMENT ON COLUMN gm_paid.group_no IS '그룹일련번호';

COMMENT ON COLUMN gm_paid.user_no IS '회원일련번호';

COMMENT ON COLUMN gm_paid.gm_no IS '회비일련번호';

COMMENT ON COLUMN gm_paid.gm_no IS '회비일련번호';

COMMENT ON COLUMN gm_paid.paid IS '수납여부';

COMMENT ON COLUMN gm_paid.rec_date IS '수납일';

CREATE UNIQUE INDEX PK_gm_paid
	ON gm_paid (
		group_no ASC,
		user_no ASC,
		gm_no ASC
	);

ALTER TABLE gm_paid
	ADD
		CONSTRAINT PK_gm_paid
		PRIMARY KEY (
			group_no,
			user_no,
			gm_no
		);

ALTER TABLE add_payment
	ADD
		CONSTRAINT FK_tb_group_TO_add_payment
		FOREIGN KEY (
			group_no
		)
		REFERENCES tb_group (
			group_no
		);

ALTER TABLE tb_group
	ADD
		CONSTRAINT FK_tb_user_TO_tb_group
		FOREIGN KEY (
			user_no
		)
		REFERENCES tb_user (
			user_no
		);

ALTER TABLE group_arr
	ADD
		CONSTRAINT FK_tb_group_TO_group_arr
		FOREIGN KEY (
			group_no
		)
		REFERENCES tb_group (
			group_no
		);

ALTER TABLE group_arr
	ADD
		CONSTRAINT FK_tb_user_TO_group_arr
		FOREIGN KEY (
			user_no
		)
		REFERENCES tb_user (
			user_no
		);

ALTER TABLE group_money
	ADD
		CONSTRAINT FK_tb_group_TO_group_money
		FOREIGN KEY (
			group_no
		)
		REFERENCES tb_group (
			group_no
		);

ALTER TABLE gm_paid
	ADD
		CONSTRAINT FK_group_arr_TO_gm_paid
		FOREIGN KEY (
			user_no,
			group_no
		)
		REFERENCES group_arr (
			user_no,
			group_no
		);

ALTER TABLE gm_paid
	ADD
		CONSTRAINT FK_group_money_TO_gm_paid
		FOREIGN KEY (
			gm_no
		)
		REFERENCES group_money (
			gm_no
		);