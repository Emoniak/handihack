/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  17/03/2018 00:13:45                      */
/*==============================================================*/


drop table if exists PROPOSER;

drop table if exists T_CHALLENGES;

drop table if exists T_ENTREPRISE;

drop table if exists T_USER;

/*==============================================================*/
/* Table : PROPOSER                                             */
/*==============================================================*/
create table PROPOSER
(
   ID_CHAL              int not null,
   ID_ENTREPRISE        int not null,
   primary key (ID_CHAL, ID_ENTREPRISE)
);

/*==============================================================*/
/* Table : T_CHALLENGES                                         */
/*==============================================================*/
create table T_CHALLENGES
(
   ID_CHAL              int not null auto_increment,
   POINTS               int not null,
   TITRE                varchar(80) not null,
   DESCRIPTION          text not null,
   primary key (ID_CHAL)
);

/*==============================================================*/
/* Table : T_ENTREPRISE                                         */
/*==============================================================*/
create table T_ENTREPRISE
(
   ID_ENTREPRISE        int not null auto_increment,
   STOCK_POINT          int not null,
   LIEU                 varchar(42) not null,
   primary key (ID_ENTREPRISE)
);

/*==============================================================*/
/* Table : T_USER                                               */
/*==============================================================*/
create table T_USER
(
   ID_USER              int not null auto_increment,
   ID_ENTREPRISE        int not null,
   NOM                  varchar(42) not null,
   PRENOM               varchar(42) not null,
   MAIL                 varchar(142) not null,
   MDP                  char(255) not null,
   primary key (ID_USER)
);

alter table PROPOSER add constraint FK_PROPOSER foreign key (ID_CHAL)
      references T_CHALLENGES (ID_CHAL) on delete restrict on update restrict;

alter table PROPOSER add constraint FK_PROPOSER2 foreign key (ID_ENTREPRISE)
      references T_ENTREPRISE (ID_ENTREPRISE) on delete restrict on update restrict;

alter table T_USER add constraint FK_APPARTENIR foreign key (ID_ENTREPRISE)
      references T_ENTREPRISE (ID_ENTREPRISE) on delete restrict on update restrict;

