create database shop;
create database gnu5;
commit;
use shop;
select * from member;
select * from member order by id desc;
select * from product where p_id like CONCAT(12,'%') or p_id like CONCAT(10,'%') order by best desc limit 3;

select * from basketdata;
select * from product;
select * from payment;
select * from basket;
update basketdata set bsamount=10 where bsnum = 29;

create table member(
id varchar(12),
pwd varchar(500) not null,
uname varchar(20) not null,
birth date,
phone varchar(13) not null,
email varchar(50) not null,
regdate date default (current_date),
grade int default 0,
primary key(id), unique key(email), unique key(phone)
);

drop table board;

insert into board (b_title, b_content, b_writer) values ('공지1','공지1입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지2','공지2입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지3','공지3입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지4','공지4입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지5','공지5입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지6','공지6입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지7','공지7입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지8','공지8입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지9','공지9입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지10','공지10입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지11','공지11입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지12','공지12입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지13','공지13입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지14','공지14입니다','admin');
insert into board (b_title, b_content, b_writer) values ('공지15','공지15입니다','admin');


insert into member(id, pwd, uname, birth, phone, email) values ('admin','1234','관리자','1998-03-11','010-1234-1234','admin@naver.com');
insert into member(id, pwd, uname, birth, phone, email) values ('test1','1234','테스트','1998-03-11','010-1234-1254','test@naver.com');
insert into member(id, pwd, uname, birth, phone, email) values ('test2','1234','테스투','1998-03-11','010-1234-1274','test1@naver.com');
insert into member(id, pwd, uname, birth, phone, email) values ('test3','1234','테스쓰리','1998-03-11','010-1234-2234','test2@naver.com');
insert into member(id, pwd, uname, birth, phone, email) values ('test4','1234','테스포','1998-03-11','010-1234-1284','test3@naver.com');

-- 게시판
create table board (
b_no int auto_increment primary key,
b_title varchar(100),
b_content varchar(1000),
b_writer varchar(20),
b_regdate date default (current_date),
b_viewcnt int default 0
);
alter table board change b_content bcontent varchar(1000);
alter table board change b_title btitle varchar(100);
alter table board change b_writer bwriter varchar(20);
alter table board change b_regdate bregdate date;
alter table board change b_viewcnt bviewcnt int;

alter table board modify bno int auto_increment;
alter table board modify bregdate date default (current_date);
alter table board modify bviewcnt int default 0;
desc board;


-- 상품
create table product (
p_id int primary key,
p_name varchar(200),
p_price int,
p_dcprice int,
p_img varchar(200),
p_color varchar(20),
p_size int,
p_amount int,
p_regdate date default (current_date)
);

alter table product change p_id pid int;
alter table product change p_name pname varchar(200);
alter table product change p_price pprice int;
alter table product change p_dcprice pdcprice int;
alter table product change p_img pimg varchar(200);
alter table product change p_color pcolor varchar(20);
alter table product change p_size psize int;
alter table product change p_amount pamount int;
alter table product change p_regdate pregdate date;
alter table product modify pregdate date default(current_date);
desc product;
select * from product;
select * from basketdata;
select * from basket;

insert into basket(bs_id ,bs_uid,bs_name, bs_price,bs_dcprice,bs_img, bs_color, bs_size, bs_amount)
values (12001025,'test1','여성) 화이트 스판 노멀워싱 IG(크롭)',69000,69000,'A2001020.png','화이트',25,1);
update basket set bs_amount=3 where bs_num = 48;
-- 장바구니

select * from product order by p_regdate desc limit 8;

create table basket(
bsid int,
bsuid varchar(100),
bsnum int auto_increment primary key,
bsname varchar(200),
bsprice int,
bsdcprice int,
bsimg varchar(200),
bscolor varchar(20),
bssize int,
bsamount int,
bsregdate date default (current_date)
);

update product set pid = 1400000 where pid=24000000;

alter table basket change bs_id bsid int;
alter table basket change bs_name bsname varchar(200);
alter table basket change bs_price bsprice int;
alter table basket change bs_dcprice bsdcprice int;
alter table basket change bs_img bsimg varchar(200);
alter table basket change bs_color bscolor varchar(20);
alter table basket change bs_size bssize int;
alter table basket change bs_amount bsamount int;
alter table basket change bs_regdate bsregdate date;
alter table basket modify bsregdate date default(current_date);

alter table basketdata change bs_id bsid int;
alter table basketdata change bs_name bsname varchar(200);
alter table basketdata change bs_price bsprice int;
alter table basketdata change bs_dcprice bsdcprice int;
alter table basketdata change bs_img bsimg varchar(200);
alter table basketdata change bs_color bscolor varchar(20);
alter table basketdata change bs_size bssize int;
alter table basketdata change bs_amount bsamount int;
alter table basketdata change bs_regdate bsregdate date;
alter table basketdata modify bsregdate date default(current_date);


create table basketdata(
bsid int,
bsuid varchar(100),
bsnum int auto_increment primary key,
bsname varchar(200),
bsprice int,
bsdcprice int,
bsimg varchar(200),
bscolor varchar(20),
bssize int,
bsamount int,
bsregdate date default (current_date)
);

select * from product;

insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(10006028,'남)프리미엄 스노우 워싱 카펜터스',99000,69300,'c8ab3d1681ea2a75aa3c901d95417827.jpg','그레이','28','30','1');
insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(12006026,'여)프리미엄 바이오스톤 지그재그 라텍스구제 워싱 와펜',129000,90300,'c9ba2b2bdb56abc568cb65e10d4266a2','라이트블루','26','30','1');
insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(16006080,'여성)라이크 라이크JK',59000,59000,'e94416fc0ea979963c4f26c89ca1c392.jpg','라이트베이지','80','30','2');
insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(26006095,'남성)등판 굿바이브 바다그래픽 반팔티셔츠(세미오버)',39000,19000,'7e6cf1702d4416360b503d561957dda4.jpg','라이트민트','95','30','2');
insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(26003095,'남성)등판 굿바이브 바다그래픽 반팔티셔츠(세미오버)',39000,19000,'bca840e711aa8907c33e6cc3438cf116.jpg','블랙','95','30','2');
insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(42001095,'공용) 세줄 레터링 자수 워싱 볼캡',39000,39000,'91de8df13cb1bb6e4699669894fa6a07.jpg','차콜','95','30','0');
insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(42002095,'공용) JMBE 자수 볼캡모자',39000,39000,'b49d5eb463e0a927d8bd1ce3181beec7.jpg','블랙','95','30','0');
insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(42003095,'공용) JMBE 자수 볼캡모자',39000,39000,'ffa04b9d9bc0ad78647b8b81c4cfb24e.jpg','베이지','95','30','0');
insert into product(p_id,p_name,p_price,p_dcprice,p_img,p_color,p_size,p_amount,premium) values(18001026,'여) 면스판 카고조거',69000,39000,'e6e0d7dd66e43ea52380e2c1584c549b.jpg','크림','26','30','0');

select * from product  where premium=1 order by best desc limit 3;



update product set best=0;
-- 결제
create table payment(
	ono int auto_increment,-- 결제번호
    paytype varchar(20),   -- 결제방식
    payno varchar(30),     -- 결제카드번호
    payplace varchar(30),
    money int,           -- 결제금액
    sdate date default (current_date),             -- 결제일
    searchkey1 int,
    searchkey2 int,
    
    bscnt int,
    	
	pid int, 				-- 제품코드
	amount int,				 -- 수량
    userid varchar(20),    -- 사용자아이디
	rname varchar(30),     -- 수신자명
    tel varchar(20),       -- 수신자전화번호
    
    addr1 varchar(200),    -- 수신자 기본주소
    addr2 varchar(100),    -- 수신자 상세주소
    postcode varchar(10),  -- 수신자 우편번호
    transno varchar(50) default null,   -- 배송코드
    transco varchar(50) default null,   -- 배송회사
    rstatus varchar(20) default null,   -- 수신상태
    rdate varchar(50) default null,             -- 도착일
	memo varchar(100),  primary key (ono)     -- 메모
);

alter table payment change search_key1 searchkey1 int;
alter table payment change search_key2 searchkey2 int;

desc payment;
select * from payment;

alter table payment change bs_cnt bscnt int;

drop table payment;
commit;
select * from product;
select * from basketdata;
desc basket;
alter table basket change bs_uid bsuid varchar(100);
alter table basket change bs_num bsnum int;
alter table basket modify bsnum int auto_increment;

alter table basketdata change bs_uid bsuid varchar(100);
alter table basketdata change bs_num bsnum int;
alter table basketdata modify bsnum int auto_increment;

update product set dc=((1-(p_dcprice/p_price))*100);

alter table product add premium int;
alter table product add dc int default 0;

alter table product add best int;

update payment set tel=#{tel },addr1=#{addr1 }, addr2=#{addr2 }, postcode=#{postcode }, transno=#{transno }, transco=#{transco },
		rstatus=#{rstatus }, rdate=#{rdate }, memo=#{memo } where ono = #{ono };
        
drop table payment;
drop table payment;
select * from product where p_id like CONCAT(12,'%');
select * from payment;
select * from payment where userid='test1';

create table databank(
seq int not null auto_increment,
title varchar(200) not null,
fileurl varchar(300) not null,
author varchar(20),
primary key (seq)
);

select * from databank;


drop table basketdata;
drop table basket;
