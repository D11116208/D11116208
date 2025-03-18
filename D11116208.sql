create table 專案表
(
專案編號 int identity (9601,1) primary key,
專案名稱 varchar(50) not null,
起始專案 datetime,
終止專案 datetime,
預算 money default 10000 check(預算<1000000)
)
create table 員工表
(
員工編號 char(5),
姓名 char(8) not null,
專案編號 int,
部門 char(10),
到職日 datetime default getdate() not null,
薪資 int not null
constraint PK_員工表_員工編號 primary key(員工編號),
constraint FK_員工表_專案表_專案編號 foreign key(專案編號) references 專案表(專案編號),
constraint CK_員工編號_薪資 check (薪資>=15800) 
)


INSERT INTO 專案表
      VALUES ('淡水河景觀工程','2007/4/1','2010/12/31',900000)

INSERT INTO 專案表
      VALUES ('民權捷運口腳踏車工程','2007/8/1',NULL,default)

-- 暫時關閉自動編號的識別值 !!INSERT後面必須要指定自動編號欄位才行
set identity_insert 專案表 on
INSERT INTO 專案表(專案編號,專案名稱,起始專案,終止專案,預算)
      VALUES (9500,'蜂蜜電影院周行銷案','2007/5/1','2007/5/30',300000)

--在啟動自動編號的識別值
set identity_insert 專案表 off
INSERT INTO 專案表
      VALUES ('悠遊卡特會行銷專案',getdate(),getdate()+50,200000)

select * from 專案表

--在員工資料表中新增一筆資料,其中沒有部門欄位
INSERT INTO 員工表(員工編號,姓名,專案編號,薪資)
      VALUES('PJ001','楊榮泉',9601,60000),
	        ('PJ002','楊宜桂',9601,70000)

SELECT * FROM 員工表

--建立一個低預算工程表,將預算低於50萬的專案複製過去
--(1)select...into
   select *  into 低預算專案表 from 專案表 where 預算<500000

   select * from 低預算專案表

--(2)insert...select...語法
create table 年度行銷案
(
行銷案編號 int identity(1,1)primary key,
行銷案名稱 varchar(20),
負責人 varchar(10) default '王一建',
行銷預算 money
)
select * from 年度行銷案

insert 年度行銷案(行銷案名稱,行銷預算) select 專案名稱,預算 from 專案表 where 專案名稱 like '%行銷%'


select * from 專案表
update 專案表 set 預算 = 預算 + 10000 , 終止專案 = 終止專案 + 30 where 專案編號=9603


update 專案表
set  專案表.終止專案 = 專案表.終止專案 + 10 from (select top 2 *from 專案表 order by 預算 ) as Lower2
where 專案表.專案編號 = Lower2.專案編號



