create table �M�ת�
(
�M�׽s�� int identity (9601,1) primary key,
�M�צW�� varchar(50) not null,
�_�l�M�� datetime,
�פ�M�� datetime,
�w�� money default 10000 check(�w��<1000000)
)
create table ���u��
(
���u�s�� char(5),
�m�W char(8) not null,
�M�׽s�� int,
���� char(10),
��¾�� datetime default getdate() not null,
�~�� int not null
constraint PK_���u��_���u�s�� primary key(���u�s��),
constraint FK_���u��_�M�ת�_�M�׽s�� foreign key(�M�׽s��) references �M�ת�(�M�׽s��),
constraint CK_���u�s��_�~�� check (�~��>=15800) 
)


INSERT INTO �M�ת�
      VALUES ('�H���e���[�u�{','2007/4/1','2010/12/31',900000)

INSERT INTO �M�ת�
      VALUES ('���v���B�f�}�񨮤u�{','2007/8/1',NULL,default)

-- �Ȯ������۰ʽs�����ѧO�� !!INSERT�᭱�����n���w�۰ʽs�����~��
set identity_insert �M�ת� on
INSERT INTO �M�ת�(�M�׽s��,�M�צW��,�_�l�M��,�פ�M��,�w��)
      VALUES (9500,'���e�q�v�|�P��P��','2007/5/1','2007/5/30',300000)

--�b�Ұʦ۰ʽs�����ѧO��
set identity_insert �M�ת� off
INSERT INTO �M�ת�
      VALUES ('�y�C�d�S�|��P�M��',getdate(),getdate()+50,200000)

select * from �M�ת�

--�b���u��ƪ��s�W�@�����,�䤤�S���������
INSERT INTO ���u��(���u�s��,�m�W,�M�׽s��,�~��)
      VALUES('PJ001','���a�u',9601,60000),
	        ('PJ002','���y��',9601,70000)

SELECT * FROM ���u��

--�إߤ@�ӧC�w��u�{��,�N�w��C��50�U���M�׽ƻs�L�h
--(1)select...into
   select *  into �C�w��M�ת� from �M�ת� where �w��<500000

   select * from �C�w��M�ת�

--(2)insert...select...�y�k
create table �~�צ�P��
(
��P�׽s�� int identity(1,1)primary key,
��P�צW�� varchar(20),
�t�d�H varchar(10) default '���@��',
��P�w�� money
)
select * from �~�צ�P��

insert �~�צ�P��(��P�צW��,��P�w��) select �M�צW��,�w�� from �M�ת� where �M�צW�� like '%��P%'


select * from �M�ת�
update �M�ת� set �w�� = �w�� + 10000 , �פ�M�� = �פ�M�� + 30 where �M�׽s��=9603


update �M�ת�
set  �M�ת�.�פ�M�� = �M�ת�.�פ�M�� + 10 from (select top 2 *from �M�ת� order by �w�� ) as Lower2
where �M�ת�.�M�׽s�� = Lower2.�M�׽s��



