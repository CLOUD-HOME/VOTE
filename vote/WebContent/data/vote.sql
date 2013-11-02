drop table if exists answer;

drop table if exists employee;

drop table if exists examination;

/*==============================================================*/
/* Table: answer                                                */
/*==============================================================*/
create table answer
(
   id                   int not null,
   userid               int,
   examid               int,
   answer               varchar(1),
   primary key (id)
);

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
create table employee
(
   id                   int not null auto_increment,
   email                varchar(50),
   password             varchar(50),
   emailmd5             varchar(50),
   randommd5            varchar(50),
   isactivate           varchar(1),
   primary key (id)
);

/*==============================================================*/
/* Table: examination                                           */
/*==============================================================*/
create table examination
(
   id                   int not null,
   paperid              int,
   content              varchar(1),
   type                 varchar(1),
   answer               varchar(1),
   primary key (id)
);

alter table answer add constraint FK_Reference_1 foreign key (userid)
      references employee (id) on delete restrict on update restrict;

alter table answer add constraint FK_Reference_2 foreign key (examid)
      references examination (id) on delete restrict on update restrict;
