/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/2/18 22:43:23                           */
/*==============================================================*/


drop trigger add_article_collect_number;

drop trigger sub_article_collect_number;

drop trigger add_article_comment_number;

drop trigger add_article_down_number;

drop trigger sub_article_down_number;

drop trigger add_comment_down_number;

drop trigger sub_comment_down_number;

drop trigger add_article_focus_number;

drop trigger sub_article_focus_number;

drop trigger update_dialog;

drop trigger add_article_up_number;

drop trigger sub_article_up_number;

drop trigger add_comment_up_number;

drop trigger sub_comment_up_number;

drop table if exists admin;

drop table if exists article;

drop table if exists article_have_tag;

drop table if exists belong_to_circle;

drop table if exists belong_to_organization;

drop table if exists block;

drop table if exists category;

drop table if exists circle;

drop table if exists circle_have_tag;

drop table if exists collect_article;

drop table if exists comment;

drop table if exists config;

drop table if exists dialog;

drop table if exists down_article;

drop table if exists down_comment;

drop table if exists dynamic;

drop table if exists focus_on_article;

drop table if exists focus_on_tag;

drop table if exists focus_on_user;

drop table if exists message;

drop table if exists notice;

drop table if exists organization;

drop table if exists person;

drop table if exists policy;

drop table if exists post;

drop table if exists project;

drop table if exists question;

drop table if exists report_article;

drop table if exists report_comment;

drop table if exists tag;

drop table if exists up_article;

drop table if exists up_comment;

drop table if exists user;

drop table if exists validate;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             int not null auto_increment comment '����Աid',
   admin_name           char(8) not null comment '����Ա����',
   admin_privilege      varchar(32) not null comment '����ԱȨ��',
   admin_passwd         char(32) not null comment '����Ա����',
   admin_time           timestamp not null default CURRENT_TIMESTAMP comment '����Ա����ʱ��',
   primary key (admin_id)
);

alter table admin comment '��̨ϵͳ����Ա';

/*==============================================================*/
/* Table: article                                               */
/*==============================================================*/
create table article
(
   article_id           int not null auto_increment comment '����id',
   user_id              int not null comment '�û�id',
   article_title        char(32) not null comment '���±���',
   article_time         timestamp not null default CURRENT_TIMESTAMP comment '���·���ʱ��',
   article_content      text not null comment '��������',
   article_profile      text not null comment '���¼��',
   article_effective    bool not null default 1 comment '������Ч',
   article_draft        bool not null default 0 comment '�����ǲݸ���',
   article_focus_number int not null default 0 comment '���±���ע������',
   article_collect_number int not null default 0 comment '���±��ղص�����',
   article_up_number    int not null default 0 comment '���±��޵�����',
   article_down_number  int not null default 0 comment '���±��ȵ�����',
   article_type         int not null comment '��������',
   article_comment_number int not null default 0 comment '������������',
   article_hits         int not null default 0 comment '���µ����',
   primary key (article_id)
);

alter table article comment '����';

/*==============================================================*/
/* Table: article_have_tag                                      */
/*==============================================================*/
create table article_have_tag
(
   tag_id               int not null comment '��ǩid',
   article_id           int not null comment '����id',
   primary key (tag_id, article_id)
);

alter table article_have_tag comment '���¾��б�ǩ';

/*==============================================================*/
/* Table: belong_to_circle                                      */
/*==============================================================*/
create table belong_to_circle
(
   user_id              int not null comment '�û�id',
   circle_id            int not null comment 'Ȧ��id',
   belong_to_circle_in_request bool not null default 1 comment '�Ƿ�������״̬(in_request)',
   belong_to_circle_info char(32) comment '�û���Ȧ���е���Ϣ(��λ���͵����߰���Ļ��������Ȧ���Զ���ĵĶ���)',
   primary key (user_id, circle_id)
);

alter table belong_to_circle comment '�û�����Ȧ��';

/*==============================================================*/
/* Table: belong_to_organization                                */
/*==============================================================*/
create table belong_to_organization
(
   organization_user_id int not null comment '��֯id',
   user_id              int not null comment '�û�id',
   belong_to_organization_in_request bool not null default 1 comment '��������״̬',
   belong_to_organization_info char(32) comment '�û�����֯�е���Ϣ',
   primary key (organization_user_id, user_id)
);

alter table belong_to_organization comment '������֯';

/*==============================================================*/
/* Table: block                                                 */
/*==============================================================*/
create table block
(
   user_id              int not null comment '�û�id',
   user_id_blocked      int not null comment '�������û�id',
   primary key (user_id, user_id_blocked)
);

alter table block comment '����(������)';

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   category_id          int not null auto_increment comment '��֯���id',
   category_name        char(32) not null comment '��֯�������',
   category_priviledge  char(32) not null comment '��֯���Ȩ��',
   category_profile     char(64) comment '��֯�����',
   category_standby     text comment '��֯����',
   primary key (category_id)
);

alter table category comment '��֯���category';

/*==============================================================*/
/* Table: circle                                                */
/*==============================================================*/
create table circle
(
   circle_id            int not null auto_increment comment 'Ȧ��id',
   user_id              int not null comment '�û�id',
   circle_name          char(16) not null comment 'Ȧ������',
   circle_limit         int not null default 50 comment 'Ȧ����������',
   circle_time          timestamp not null default CURRENT_TIMESTAMP comment 'Ȧ�Ӵ���ʱ��',
   circle_profile       text not null comment 'Ȧ�Ӽ��',
   circle_avatar_url    char(128) comment 'Ȧ��ͷ��url',
   circle_effective     bool not null default 1 comment 'Ȧ����Чλ',
   primary key (circle_id)
);

alter table circle comment 'Ȧ��';

/*==============================================================*/
/* Table: circle_have_tag                                       */
/*==============================================================*/
create table circle_have_tag
(
   circle_id            int not null comment 'Ȧ��id',
   tag_id               int not null comment '��ǩid',
   primary key (circle_id, tag_id)
);

alter table circle_have_tag comment 'Ȧ�Ӿ��б�ǩ';

/*==============================================================*/
/* Table: collect_article                                       */
/*==============================================================*/
create table collect_article
(
   article_id           int not null comment '����id',
   user_id              int not null comment '�û�id',
   primary key (article_id, user_id)
);

alter table collect_article comment '�ղ�';

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           int not null auto_increment comment '����id',
   comment_id_reply_to  int comment '������id',
   user_id              int not null comment '�������۵��û���id',
   article_id           int not null comment '����id',
   comment_time         timestamp not null default CURRENT_TIMESTAMP comment '���۷���ʱ��',
   comment_content      text not null comment '��������',
   comment_up_number    int not null default 0 comment '�����޵�����',
   comment_down_number  int not null default 0 comment '���۲ȵ�����',
   comment_effective    bool not null default 1 comment '������Чλ',
   comment_type         int not null comment '��������',
   primary key (comment_id)
);

alter table comment comment '����';

/*==============================================================*/
/* Table: config                                                */
/*==============================================================*/
create table config
(
   config_id            int not null auto_increment comment 'config_id',
   config_name          varchar(20) not null comment 'config_name',
   config_content       text not null comment 'config_content',
   config_info          varchar(50) not null comment 'config_info',
   config_time          timestamp not null default CURRENT_TIMESTAMP comment 'config_time',
   primary key (config_id)
);

alter table config comment 'ϵͳ����';

/*==============================================================*/
/* Table: dialog                                                */
/*==============================================================*/
create table dialog
(
   user_id_less         int not null comment '�û���Сid',
   user_id_more         int not null comment '�û��ϴ�id',
   dialog_time          timestamp not null comment '������Ϣʱ��',
   dialog_content       text not null comment '��������',
   dialog_less_effective bool not null default 1 comment 'idС����Чλ',
   dialog_more_effective bool not null default 1 comment 'id�����Чλ',
   primary key (user_id_less, user_id_more)
);

alter table dialog comment '�Ի���(��¼�˶Ի�˫��id������ʱ������)';

/*==============================================================*/
/* Table: down_article                                          */
/*==============================================================*/
create table down_article
(
   article_id           int not null comment '����id',
   user_id              int not null comment '�û�id',
   primary key (article_id, user_id)
);

alter table down_article comment '��';

/*==============================================================*/
/* Table: down_comment                                          */
/*==============================================================*/
create table down_comment
(
   user_id              int not null comment '�û�id',
   comment_id           int not null comment '����id',
   primary key (user_id, comment_id)
);

alter table down_comment comment '������';

/*==============================================================*/
/* Table: dynamic                                               */
/*==============================================================*/
create table dynamic
(
   dynamic_id           int not null auto_increment comment '��̬��id',
   dynamic_subject_id   bigint not null comment '�����id',
   dynamic_object_id    bigint not null comment '�����id',
   dynamic_type         bigint not null comment '��̬����',
   dynamic_time         timestamp not null comment '��̬������ʱ��',
   primary key (dynamic_id)
);

alter table dynamic comment '��̬';

/*==============================================================*/
/* Table: focus_on_article                                      */
/*==============================================================*/
create table focus_on_article
(
   article_id           int not null comment '����id',
   user_id              int not null comment '�û�id',
   primary key (article_id, user_id)
);

alter table focus_on_article comment '��ע����';

/*==============================================================*/
/* Table: focus_on_tag                                          */
/*==============================================================*/
create table focus_on_tag
(
   tag_id               int not null comment '��ǩid',
   user_id              int not null comment '�û�id',
   primary key (tag_id, user_id)
);

alter table focus_on_tag comment '��ע��ǩ';

/*==============================================================*/
/* Table: focus_on_user                                         */
/*==============================================================*/
create table focus_on_user
(
   user_id              int not null comment '�û�id',
   user_id_focused      int not null comment '����ע�û�id',
   primary key (user_id, user_id_focused)
);

alter table focus_on_user comment '��ע�û�';

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   message_id           int not null auto_increment comment '˽��id',
   send_user_id         int not null comment '������id',
   receive_user_id      int not null comment '������id',
   message_content      text not null comment '˽������',
   message_time         timestamp not null default CURRENT_TIMESTAMP comment '˽�ŷ���ʱ��',
   message_effective    bool not null default 1 comment '˽����Чλ(Ĭ��Ϊ1,����Ч)',
   message_read         bool not null default 0 comment '˽���Ѷ�(Ĭ��Ϊ0,��δ��)',
   send_effective       bool not null default 1 comment '��������Чλ',
   receive_effective    bool not null default 1 comment '���շ���Чλ',
   primary key (message_id)
);

alter table message comment '˽��';

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   notice_id            int not null auto_increment comment '����id',
   user_id              int not null comment '�û�id',
   notice_type          int not null comment '��������',
   notice_read          bool not null default 0 comment '�����Ѷ�',
   notice_content       text not null comment '��������',
   notice_time          timestamp not null default CURRENT_TIMESTAMP comment '���Ѳ������ݿ��ʱ��',
   notice_effective     bool not null default 1 comment '������Ч',
   primary key (notice_id)
);

alter table notice comment 'ϵͳ����';

/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization
(
   user_id              int not null comment '�û�id',
   category_id          int not null comment '��֯���id',
   organization_customize bool not null default 0 comment '��֯��ҳ�Ƿ���(Ĭ��Ϊ0,��������)',
   organization_certification_infomation char(64) comment '��֯��֤��Ϣ(һ�仰,С��64����)',
   organization_certified bool not null default 0 comment '��֯�Ƿ��Ѿ�������֤(Ĭ��Ϊ0)',
   organization_milestone text comment '��֯��̱���¼',
   primary key (user_id)
);

alter table organization comment '��֯';

/*==============================================================*/
/* Table: person                                                */
/*==============================================================*/
create table person
(
   user_id              int not null comment '�û�id',
   user_sex             char(8) not null comment '�û��Ա�',
   user_location        char(64) comment '�û����ڵ�',
   user_experience      text comment '�û�����',
   user_birthday        date comment '�û�����',
   primary key (user_id)
);

alter table person comment '�����û�����ϸ��Ϣ';

/*==============================================================*/
/* Table: policy                                                */
/*==============================================================*/
create table policy
(
   article_id           int not null comment '����id',
   primary key (article_id)
);

alter table policy comment '����';

/*==============================================================*/
/* Table: post                                                  */
/*==============================================================*/
create table post
(
   article_id           int not null comment '����id',
   circle_id            int not null comment 'Ȧ��id',
   post_type            int not null comment '��������',
   post_hits            int not null default 0 comment '���ӵ����',
   primary key (article_id)
);

alter table post comment 'Ȧ���������(post)';

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project
(
   article_id           int not null comment '����id',
   user_id              int not null comment '������֯��user_id',
   project_avatar_url   char(128) not null comment '��Ŀͷ��ͼƬ',
   primary key (article_id)
);

alter table project comment '��Ŀ';

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   article_id           int not null comment '����id',
   primary key (article_id)
);

alter table question comment '����';

/*==============================================================*/
/* Table: report_article                                        */
/*==============================================================*/
create table report_article
(
   article_id           int not null comment '����id',
   user_id              int not null comment '�û�id',
   report_article_type  int not null comment '���¾ٱ�����',
   report_article_content text comment '���¾ٱ�����',
   primary key (article_id, user_id)
);

alter table report_article comment '�ٱ�����';

/*==============================================================*/
/* Table: report_comment                                        */
/*==============================================================*/
create table report_comment
(
   user_id              int not null comment '�û�id',
   comment_id           int not null comment '����id',
   report_comment_type  int not null comment '���۾ٱ�����',
   report_comment_content text comment '���۾ٱ�����',
   primary key (user_id, comment_id)
);

alter table report_comment comment '�ٱ�����';

/*==============================================================*/
/* Table: tag                                                   */
/*==============================================================*/
create table tag
(
   tag_id               int not null auto_increment comment '��ǩid',
   tag_title            char(32) not null comment '��ǩ����',
   tag_hits             bigint not null default 0 comment '��ǩ�ȶ�',
   tag_profile          text comment '��ǩ��Ϣ(����)',
   primary key (tag_id)
);

alter table tag comment '��ǩ';

/*==============================================================*/
/* Table: up_article                                            */
/*==============================================================*/
create table up_article
(
   article_id           int not null comment '����id',
   user_id              int not null comment '�û�id',
   primary key (article_id, user_id)
);

alter table up_article comment '��';

/*==============================================================*/
/* Table: up_comment                                            */
/*==============================================================*/
create table up_comment
(
   user_id              int not null comment '�û�id',
   comment_id           int not null comment '����id',
   primary key (user_id, comment_id)
);

alter table up_comment comment '������';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null auto_increment comment '�û�id',
   user_time            timestamp not null default CURRENT_TIMESTAMP comment '�û�����ʱ��',
   user_nickname        char(16) not null comment '�û��ǳ�(����)',
   user_email           char(32) not null comment '�û�email',
   user_passwd          char(32) not null comment '�û������ϣֵ',
   user_profile         text not null comment '�û����',
   user_avatar_url      char(128) not null comment '�û�ͷ��url',
   user_effective       bool not null default 1 comment '�û���Чλ',
   user_last_time       timestamp not null default '0' comment '�û����һ�β�����ʱ���(last_time)',
   user_type            int not null default 0 comment '�û����',
   user_signature       char(32) comment '�û�ǩ��',
   primary key (user_id)
);

alter table user comment '�û�';

/*==============================================================*/
/* Table: validate                                              */
/*==============================================================*/
create table validate
(
   validate_id          int not null comment '��֤�Ķ�����id',
   validate_key         char(16) not null comment '��֤����',
   validate_time        timestamp not null default CURRENT_TIMESTAMP comment '��֤ʱ��',
   primary key (validate_id)
);

alter table validate comment '��֤��';

alter table article add constraint FK_post_article foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table article_have_tag add constraint FK_article_have_tag foreign key (tag_id)
      references tag (tag_id) on delete restrict on update restrict;

alter table article_have_tag add constraint FK_article_have_tag2 foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table belong_to_circle add constraint FK_belong_to_circle foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table belong_to_circle add constraint FK_belong_to_circle2 foreign key (circle_id)
      references circle (circle_id) on delete restrict on update restrict;

alter table belong_to_organization add constraint FK_belong_to_organization foreign key (organization_user_id)
      references organization (user_id) on delete restrict on update restrict;

alter table belong_to_organization add constraint FK_belong_to_organization2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table block add constraint FK_block foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table block add constraint FK_block2 foreign key (user_id_blocked)
      references user (user_id) on delete restrict on update restrict;

alter table circle add constraint FK_create_circle foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table circle_have_tag add constraint FK_circle_have_tag foreign key (circle_id)
      references circle (circle_id) on delete restrict on update restrict;

alter table circle_have_tag add constraint FK_circle_have_tag2 foreign key (tag_id)
      references tag (tag_id) on delete restrict on update restrict;

alter table collect_article add constraint FK_collect_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table collect_article add constraint FK_collect_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment_belong_to_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table comment add constraint FK_post_comment foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table comment add constraint FK_reply foreign key (comment_id_reply_to)
      references comment (comment_id) on delete restrict on update restrict;

alter table dialog add constraint FK_dialog foreign key (user_id_less)
      references user (user_id) on delete restrict on update restrict;

alter table dialog add constraint FK_dialog2 foreign key (user_id_more)
      references user (user_id) on delete restrict on update restrict;

alter table down_article add constraint FK_down_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table down_article add constraint FK_down_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table down_comment add constraint FK_down_comment foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table down_comment add constraint FK_down_comment2 foreign key (comment_id)
      references comment (comment_id) on delete restrict on update restrict;

alter table focus_on_article add constraint FK_focus_on_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table focus_on_article add constraint FK_focus_on_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_tag add constraint FK_focus_on_tag foreign key (tag_id)
      references tag (tag_id) on delete restrict on update restrict;

alter table focus_on_tag add constraint FK_focus_on_tag2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_user add constraint FK_focus_on_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_user add constraint FK_focus_on_user2 foreign key (user_id_focused)
      references user (user_id) on delete restrict on update restrict;

alter table message add constraint FK_receive_message foreign key (receive_user_id)
      references user (user_id) on delete restrict on update restrict;

alter table message add constraint FK_send_message foreign key (send_user_id)
      references user (user_id) on delete restrict on update restrict;

alter table notice add constraint FK_notice_send_to_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table organization add constraint FK_organization_belong_to_category foreign key (category_id)
      references category (category_id) on delete restrict on update restrict;

alter table organization add constraint FK_organization_isa_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table person add constraint FK_user_details_isa_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table policy add constraint FK_policy_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table post add constraint FK_post_belong_to_circle foreign key (circle_id)
      references circle (circle_id) on delete restrict on update restrict;

alter table post add constraint FK_post_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table project add constraint FK_project_belong_to_organization foreign key (user_id)
      references organization (user_id) on delete restrict on update restrict;

alter table project add constraint FK_project_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table question add constraint FK_question_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table report_article add constraint FK_report_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table report_article add constraint FK_report_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table report_comment add constraint FK_report_comment foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table report_comment add constraint FK_report_comment2 foreign key (comment_id)
      references comment (comment_id) on delete restrict on update restrict;

alter table up_article add constraint FK_up_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table up_article add constraint FK_up_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table up_comment add constraint FK_up_comment foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table up_comment add constraint FK_up_comment2 foreign key (comment_id)
      references comment (comment_id) on delete restrict on update restrict;


create trigger add_article_collect_number after insert
on collect_article for each row
begin
    update article
    set article.article_collect_number = article.article_collect_number+1
    where article.article_id = new.article_id
end;


create trigger sub_article_collect_number after delete
on collect_article for each row
begin
    update article
    set article.article_collect_number = article.article_collect_number-1
    where article.article_id = old.article_id
end;


create trigger add_article_comment_number after insert
on comment for each row
begin
    update article
    set article.article_comment_number = article.article_comment_number+1
    where article.article_id = new.article_id
end;


create trigger add_article_down_number after insert
on down_article for each row
begin
    update article
    set article.article_down_number = article.article_down_number+1
    where article.article_id = new.article_id
end;


create trigger sub_article_down_number after delete
on down_article for each row
begin
    update article
    set article.article_down_number = article.article_down_number-1
    where article.article_id = old.article_id
end;


create trigger add_comment_down_number after insert
on down_comment for each row
begin
    update 'comment'
    set 'comment'.comment_down_number = 'comment'.comment_down_number+1
    where 'comment'.comment_id = new.comment_id
end;


create trigger sub_comment_down_number after delete
on down_comment for each row
begin
    update 'comment'
    set 'comment'.comment_down_number = 'comment'.comment_down_number-1
    where 'comment'.comment_id = old.comment_id
end;


create trigger add_article_focus_number after insert
on focus_on_article for each row
begin
    update article
    set article.article_focus_number = article.article_focus_number+1
    where article.article_id = new.article_id
end;


create trigger sub_article_focus_number after delete
on focus_on_article for each row
begin
    update article
    set article.article_focus_number = article.article_focus_number-1
    where article.article_id = old.article_id
end;


create trigger update_dialog after insert
on message for each row
begin
    set @l=if(new.send_user_id<new.receive_user_id,
              new.send_user_id,new.receive_user_id);
    set @m=if(new.send_user_id>new.receive_user_id,
              new.send_user_id,new.receive_user_id);
              
    insert into dialog(dialog_time,dialog_content,user_id_less,user_id_more)
    value(new.message_time, new.message_content, @l, @m)
    on duplicate key update dialog_time=new.message_time,
        dialog.dialog_content=new.message_content
end;


create trigger add_article_up_number after insert
on up_article for each row
begin
    update article
    set article.article_up_number = article.article_up_number+1
    where article.article_id = new.article_id
end;


create trigger sub_article_up_number after delete
on up_article for each row
begin
    update article
    set article.article_up_number = article.article_up_number-1
    where article.article_id = old.article_id
end;


create trigger add_comment_up_number after insert
on up_comment for each row
begin
    update 'comment'
    set 'comment'.comment_up_number = 'comment'.comment_up_number+1
    where 'comment'.comment_id = new.comment_id
end;


create trigger sub_comment_up_number after delete
on up_comment for each row
begin
    update 'comment'
    set 'comment'.comment_up_number = 'comment'.comment_up_number-1
    where 'comment'.comment_id = old.comment_id
end;

