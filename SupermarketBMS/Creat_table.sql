
create table BILL
(
  BILLID         NUMBER not null,
  GOODSNAME      VARCHAR2(20) not null,
  GOODSNUM       NUMBER not null,
  MONEY          BINARY_DOUBLE not null,
  ISPAY          VARCHAR2(4) not null,
  SUPPLIERNAME   VARCHAR2(20) not null,
  GOODSDESCRIBLE VARCHAR2(40) not null,
  BILLTIME       DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BILL
  add constraint BILLID primary key (BILLID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

commit;

insert into BILL (BILLID, GOODSNAME, GOODSNUM, MONEY, ISPAY, SUPPLIERNAME, GOODSDESCRIBLE, BILLTIME)
values (164, '名称', 100, 1.2E+005, '是', '名称', '描述', to_date('03-08-2011', 'dd-mm-yyyy'));

commit;




create table US
(
  USERID   NUMBER not null,
  USERNAME VARCHAR2(20),
  SEX      VARCHAR2(10),
  AGE      NUMBER,
  TELPHONE VARCHAR2(20),
  ADDRESS  VARCHAR2(20),
  POWER    VARCHAR2(20),
  PASSWORD VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table US
  add constraint USERID primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


commit;

insert into US (USERID, USERNAME, SEX, AGE, TELPHONE, ADDRESS, POWER, PASSWORD)
values (91, '一灯', '男', 33, '15934859617', '说的', '普通会员', '12345');
insert into US (USERID, USERNAME, SEX, AGE, TELPHONE, ADDRESS, POWER, PASSWORD)
values (85, 'zhshde', '男', 22, '15934859617', 'xiam', '普通会员', '890628');
insert into US (USERID, USERNAME, SEX, AGE, TELPHONE, ADDRESS, POWER, PASSWORD)
values (87, 'zhsd', '男', 23, '15934859617', 'sda', '普通会员', '890628');
insert into US (USERID, USERNAME, SEX, AGE, TELPHONE, ADDRESS, POWER, PASSWORD)
values (90, 'zhou', '男', 45, '15934859617', 'dv', '普通会员', '123456');
insert into US (USERID, USERNAME, SEX, AGE, TELPHONE, ADDRESS, POWER, PASSWORD)
values (1, 'admin', '男', 22, '15934859617', '西安', '管理员', 'admin');
insert into US (USERID, USERNAME, SEX, AGE, TELPHONE, ADDRESS, POWER, PASSWORD)
values (22, '周绍灯', '女', 22, '13379258307', '西安', '普通会员', '123456');
commit;





create table SUPPLIER
(
  SUPPLIERID        NUMBER not null,
  SUPPLIERNAME      VARCHAR2(20),
  SUPPLIERDESCRIBLE VARCHAR2(40),
  LINKMAN           VARCHAR2(20),
  TELPHONE          VARCHAR2(20),
  ADDRESS           VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SUPPLIER
  add constraint SUPPLIERID primary key (SUPPLIERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


commit;

insert into SUPPLIER (SUPPLIERID, SUPPLIERNAME, SUPPLIERDESCRIBLE, LINKMAN, TELPHONE, ADDRESS)
values (43, '名称', '描述', '联系人', '13379258307', '地址');
insert into SUPPLIER (SUPPLIERID, SUPPLIERNAME, SUPPLIERDESCRIBLE, LINKMAN, TELPHONE, ADDRESS)
values (25, '可口可乐', '供应商描述', '周绍灯', '13379258307', '西安');
commit;





