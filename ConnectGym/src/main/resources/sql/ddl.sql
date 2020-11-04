drop table board_t cascade constraints;
drop table booking_t cascade constraints;
drop table comment_t cascade constraints;
drop table fileinfo_t cascade constraints;
drop table gym_t cascade constraints;
drop table img_t cascade constraints;
drop table level_t cascade constraints;
drop table member_t cascade constraints;
drop table review_t cascade constraints;
drop table tag_t cascade constraints;

drop sequence board_seq;
drop sequence booking_seq;
drop sequence comment_seq;
drop sequence fileinfo_seq;
drop sequence gym_seq;
drop sequence member_seq;
drop sequence review_seq;

CREATE TABLE gym_t (			
gym_no		NUMBER(6)		NOT NULL,
gym_name	VARCHAR2(30)		UNIQUE NOT NULL,
gym_info		VARCHAR2(2000)		NULL,
gym_num		VARCHAR2(20)		NULL,
gym_addr	VARCHAR2(300)		NULL,
gym_x		VARCHAR2(100)		NULL,
gym_y		VARCHAR2(100)		NULL,
gym_weekday	VARCHAR2(50)		NOT NULL,
gym_saturday	VARCHAR2(50)		NULL,
gym_sunday	VARCHAR2(50)		NULL,
gym_holiday	VARCHAR2(50)		NOT NULL
);			

CREATE TABLE member_t (			
mem_no		NUMBER(6)		NOT NULL,
gym_no		NUMBER(6)		NULL,
mem_mail	VARCHAR2(30)		UNIQUE NOT NULL,
mem_pw		VARCHAR2(30)		NOT NULL,
mem_nick	VARCHAR2(20)		UNIQUE,
mem_name	VARCHAR2(20)		NOT NULL,
mem_gender	CHAR(1)			NULL,
mem_birth	VARCHAR2(20)		NOT NULL,
mem_zipcode	VARCHAR2(20)		NULL,
mem_addr	VARCHAR2(150)		NULL,
mem_de_addr	VARCHAR2(150)		NULL,
mem_phone	VARCHAR2(20)		NULL,
mem_leave	CHAR(1)			DEFAULT 'F',
mem_joindate	DATE			NOT NULL,
mem_update	DATE			NULL,
mem_level	NUMBER			NULL,
tr_info		CLOB			NULL,
tr_comment	VARCHAR2(500)		NULL,
tr_tag		VARCHAR2(1000)		NULL,
tr_price 		NUMBER(7) 		NULL,
tr_weekday	VARCHAR2(50)		NULL,
tr_saturday	VARCHAR2(50)		NULL,
tr_sunday		VARCHAR2(50)		NULL,
tr_holiday	VARCHAR2(50)		NULL


);			

CREATE TABLE board_t (			
bo_no		NUMBER(6)		NOT NULL,
mem_no		NUMBER(6)		NOT NULL,
bo_title	VARCHAR2(100)			NULL,
bo_content	CLOB			NULL,
bo_writedate	DATE			NOT NULL,
bo_update	DATE			NULL,
bo_issecret	CHAR(1)			NOT NULL,
bo_del		CHAR(1)			DEFAULT 'F',
bo_hit		NUMBER(6)		DEFAULT 0
);		

CREATE TABLE comment_t (			
cmt_no		NUMBER(6)		NOT NULL,
bo_no		NUMBER(6)		NOT NULL,
mem_no		NUMBER(6)		NOT NULL,
cmt_content	VARCHAR2(500)		NULL,
cmt_del		CHAR(1)			DEFAULT 'F',
cmt_writedate	DATE			NOT NULL,
cmt_update	DATE			NULL
);			

CREATE TABLE fileinfo_t (			
fi_no		NUMBER(6)		NOT NULL,
bo_no		NUMBER(6)		NULL,
mem_no		NUMBER(6)		NULL,
fi_path		VARCHAR2(500)		NOT NULL,
fi_org_name	VARCHAR2(500)		NOT NULL,
fi_save_name	VARCHAR2(500)		NULL,
fi_main_img	CHAR(1)			DEFAULT 'F'
);				

CREATE TABLE booking_t (			
book_no		NUMBER(6)		NOT NULL,
mem_no		NUMBER(6)		NOT NULL,
tr_no		NUMBER(6)		NOT NULL,
book_date	DATE			NULL,
book_update	DATE			NULL,
book_content	VARCHAR2(1000)		NULL
);	

CREATE TABLE img_t (			
img_name	VARCHAR2(100)		NOT NULL,
gym_no		NUMBER(6)		NOT NULL
			
);			

CREATE TABLE level_t (			
admin		NUMBER			NULL,
trainer		NUMBER			NULL,
member		NUMBER			NULL
);		

CREATE TABLE review_t (			
rv_no		NUMBER(6)		NOT NULL,
mem_no		NUMBER(6)		NOT NULL,
tr_no		NUMBER(6)		NOT NULL,
rv_nick		VARCHAR2(20)		NOT NULL,
rv_content	VARCHAR2(1000)		NULL,
rv_rate		VARCHAR2(20)		NOT NULL,
rv_del		CHAR(1)			DEFAULT 'F',
rv_writedate	DATE			NOT NULL,
rv_update	DATE			NULL
);			

CREATE TABLE tag_t (			
tag_name 	VARCHAR2(50)		NOT NULL
);		


ALTER TABLE member_t ADD CONSTRAINT PK_MEMBER_T PRIMARY KEY (							
	mem_no						
);							
							
							
ALTER TABLE board_t ADD CONSTRAINT PK_BOARD_T PRIMARY KEY (							
	bo_no						
);							
							
ALTER TABLE gym_t ADD CONSTRAINT PK_GYM_T PRIMARY KEY (							
	gym_no						
);							
							
ALTER TABLE comment_t ADD CONSTRAINT PK_COMMENT_T PRIMARY KEY (							
	cmt_no						
);							
							
ALTER TABLE fileinfo_t ADD CONSTRAINT PK_FILEINFO_T PRIMARY KEY (							
	fi_no						
);							
							
ALTER TABLE booking_t ADD CONSTRAINT PK_BOOKING_T PRIMARY KEY (							
	book_no						
);							
							
ALTER TABLE img_t ADD CONSTRAINT PK_IMG_T PRIMARY KEY (							
	img_name						
);							
							
ALTER TABLE review_t ADD CONSTRAINT PK_REVIEW_T PRIMARY KEY (							
	rv_no						
);						


ALTER TABLE member_t ADD CONSTRAINT FK_gym_t_TO_member_t_1 FOREIGN KEY (								
	gym_no							
)								
REFERENCES gym_t (								
	gym_no							
);								
								
ALTER TABLE board_t ADD CONSTRAINT FK_member_t_TO_board_t_1 FOREIGN KEY (								
	mem_no							
)								
REFERENCES member_t (								
	mem_no							
);								
								
ALTER TABLE comment_t ADD CONSTRAINT FK_board_t_TO_comment_t_1 FOREIGN KEY (								
	bo_no							
)								
REFERENCES board_t (								
	bo_no							
);								
								
ALTER TABLE comment_t ADD CONSTRAINT FK_member_t_TO_comment_t_1 FOREIGN KEY (								
	mem_no							
)								
REFERENCES member_t (								
	mem_no							
);								
								
ALTER TABLE fileinfo_t ADD CONSTRAINT FK_board_t_TO_fileinfo_t_1 FOREIGN KEY (								
	bo_no							
)								
REFERENCES board_t (								
	bo_no							
);								
								
ALTER TABLE fileinfo_t ADD CONSTRAINT FK_member_t_TO_fileinfo_t_1 FOREIGN KEY (								
	mem_no							
)								
REFERENCES member_t (								
	mem_no							
);								
								
ALTER TABLE booking_t ADD CONSTRAINT FK_member_t_TO_booking_t_1 FOREIGN KEY (								
	mem_no							
)								
REFERENCES member_t (								
	mem_no							
);								
								
ALTER TABLE booking_t ADD CONSTRAINT FK_member_t_TO_booking_t_2 FOREIGN KEY (								
	tr_no							
)								
REFERENCES member_t (								
	mem_no							
);								
								
ALTER TABLE img_t ADD CONSTRAINT FK_gym_t_TO_img_t_1 FOREIGN KEY (								
	gym_no							
)								
REFERENCES gym_t (								
	gym_no							
);								
								
ALTER TABLE review_t ADD CONSTRAINT FK_member_t_TO_review_t_1 FOREIGN KEY (								
	mem_no							
)								
REFERENCES member_t (								
	mem_no							
);								
								
ALTER TABLE review_t ADD CONSTRAINT FK_member_t_TO_review_t_2 FOREIGN KEY (								
	tr_no							
)								
REFERENCES member_t (								
	mem_no							
);

CREATE SEQUENCE    member_seq    START WITH 12 INCREMENT BY 1 MAXVALUE 999999;			
CREATE SEQUENCE    gym_seq    START WITH 7 INCREMENT BY 1 MAXVALUE 999999;			
CREATE SEQUENCE    booking_seq    START WITH 6 INCREMENT BY 1 MAXVALUE 999999;			
CREATE SEQUENCE    fileinfo_seq    START WITH 1 INCREMENT BY 1 MAXVALUE 999999;			
CREATE SEQUENCE    review_seq    START WITH 6 INCREMENT BY 1 MAXVALUE 999999;			
CREATE SEQUENCE    board_seq    START WITH 31 INCREMENT BY 1 MAXVALUE 999999;			
CREATE SEQUENCE    comment_seq    START WITH 1 INCREMENT BY 1 MAXVALUE 999999;															