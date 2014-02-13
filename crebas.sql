/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/2/13 17:37:25                           */
/*==============================================================*/


drop table if exists admin;

drop table if exists answer;

drop table if exists article;

drop table if exists article_have_tag;

drop table if exists belong_to_circle;

drop table if exists belong_to_organization;

drop table if exists block;

drop table if exists category;

drop table if exists circle;

drop table if exists collect_article;

drop table if exists comment;

drop table if exists config;

drop table if exists dialog;

drop table if exists down;

drop table if exists focus_on_article;

drop table if exists focus_on_user;

drop table if exists improvement;

drop table if exists log;

drop table if exists message;

drop table if exists notice;

drop table if exists organization;

drop table if exists policy;

drop table if exists post;

drop table if exists project;

drop table if exists question;

drop table if exists report;

drop table if exists tag;

drop table if exists up;

drop table if exists user;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             bigint not null auto_increment comment '����Աid',
   admin_name           char(8) not null comment '����Ա����',
   admin_privilege      varchar(32) not null comment '����ԱȨ��',
   admin_passwd         char(32) not null comment '����Ա����',
   admin_time           timestamp not null comment '����Ա����ʱ��',
   primary key (admin_id)
);

alter table admin comment '��̨ϵͳ����Ա';

/*==============================================================*/
/* Table: answer                                                */
/*==============================================================*/
create table answer
(
   article_id           bigint not null comment '����id',
   question_article_id  bigint not null comment '����_����id',
   primary key (article_id)
);

alter table answer comment '�ش�';

/*==============================================================*/
/* Table: article                                               */
/*==============================================================*/
create table article
(
   article_id           bigint not null auto_increment comment '����id',
   user_id              bigint not null comment '�û�id',
   article_title        char(32) not null comment '���±���',
   article_time         timestamp not null comment '���·���ʱ��',
   article_content      text not null comment '��������',
   article_profile      text not null comment '���¼��',
   article_effective    bool not null default 1 comment '������Ч',
   article_draft        bool not null default 0 comment '�����ǲݸ���',
   article_focus_number int not null default 0 comment '���±���ע������',
   article_collect_number int not null default 0 comment '���±��ղص�����',
   article_up_number    int not null default 0 comment '���±��޵�����',
   article_down_number  int not null default 0 comment '���±��ȵ�����',
   primary key (article_id)
);

alter table article comment '����';

/*==============================================================*/
/* Table: article_have_tag                                      */
/*==============================================================*/
create table article_have_tag
(
   tag_id               bigint not null comment '��ǩid',
   article_id           bigint not null comment '����id',
   primary key (tag_id, article_id)
);

alter table article_have_tag comment '���¾��б�ǩ';

/*==============================================================*/
/* Table: belong_to_circle                                      */
/*==============================================================*/
create table belong_to_circle
(
   user_id              bigint not null comment '�û�id',
   circle_id            bigint not null comment 'Ȧ��id',
   belong_to_circle_in_request bool not null default 1 comment '�Ƿ�������״̬(in_request)',
   primary key (user_id, circle_id)
);

alter table belong_to_circle comment '�û�����Ȧ��';

/*==============================================================*/
/* Table: belong_to_organization                                */
/*==============================================================*/
create table belong_to_organization
(
   org_user_id          bigint not null comment '��֯_�û�id',
   user_id              bigint not null comment '�û�id',
   belong_to_organization_in_request bool not null default 1 comment '��������״̬',
   primary key (org_user_id, user_id)
);

alter table belong_to_organization comment '������֯';

/*==============================================================*/
/* Table: block                                                 */
/*==============================================================*/
create table block
(
   user_id              bigint not null comment '�û�id',
   user_id_blocked      bigint not null comment '�������û�id',
   primary key (user_id, user_id_blocked)
);

alter table block comment '����(������)';

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   category_id          bigint not null auto_increment comment '��֯���id',
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
   circle_id            bigint not null auto_increment comment 'Ȧ��id',
   circle_name          char(16) not null comment 'Ȧ������',
   circle_limit         int not null default 50 comment 'Ȧ����������',
   circle_time          timestamp not null comment 'Ȧ�Ӵ���ʱ��',
   primary key (circle_id)
);

alter table circle comment 'Ȧ��';

/*==============================================================*/
/* Table: collect_article                                       */
/*==============================================================*/
create table collect_article
(
   article_id           bigint not null comment '����id',
   user_id              bigint not null comment '�û�id',
   primary key (article_id, user_id)
);

alter table collect_article comment '�ղ�';

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           bigint not null auto_increment comment '����id',
   user_id              bigint not null comment '�û�id',
   article_id           bigint not null comment '����id',
   comment_time         timestamp not null comment '���۷���ʱ��',
   comment_content      text not null comment '��������',
   primary key (comment_id)
);

alter table comment comment '����';

/*==============================================================*/
/* Table: config                                                */
/*==============================================================*/
create table config
(
   config_id            bigint not null auto_increment comment 'config_id',
   config_name          varchar(20) not null comment 'config_name',
   config_content       text not null comment 'config_content',
   config_info          varchar(50) not null comment 'config_info',
   config_time          timestamp not null comment 'config_time',
   primary key (config_id)
);

alter table config comment 'ϵͳ����';

/*==============================================================*/
/* Table: dialog                                                */
/*==============================================================*/
create table dialog
(
   user_id_one          bigint not null comment '�û�_�û�id',
   user_id_another      bigint not null comment '�û�id',
   dialog_time          timestamp not null comment '������Ϣʱ��',
   dialog_content       text not null comment '��������',
   primary key (user_id_one, user_id_another)
);

alter table dialog comment '�Ի���(��¼�˶Ի�˫��id������ʱ������)';

/*==============================================================*/
/* Table: down                                                  */
/*==============================================================*/
create table down
(
   article_id           bigint not null comment '����id',
   user_id              bigint not null comment '�û�id',
   primary key (article_id, user_id)
);

alter table down comment '��';

/*==============================================================*/
/* Table: focus_on_article                                      */
/*==============================================================*/
create table focus_on_article
(
   article_id           bigint not null comment '����id',
   user_id              bigint not null comment '�û�id',
   article_dynamic      text comment '���¶�̬',
   primary key (article_id, user_id)
);

alter table focus_on_article comment '��ע����';

/*==============================================================*/
/* Table: focus_on_user                                         */
/*==============================================================*/
create table focus_on_user
(
   user_id_focused      bigint not null comment '�û�_�û�id',
   user_id              bigint not null comment '�û�id',
   user_dynamic         text comment '��̬',
   primary key (user_id_focused, user_id)
);

alter table focus_on_user comment '��ע�û�';

/*==============================================================*/
/* Table: improvement                                           */
/*==============================================================*/
create table improvement
(
   article_id           bigint not null comment '����id',
   project_article_id   bigint not null comment '��Ŀ_����id',
   improvement_accepted bool not null default 0 comment '�����Ƿ񱻲���',
   primary key (article_id)
);

alter table improvement comment '����';

/*==============================================================*/
/* Table: log                                                   */
/*==============================================================*/
create table log
(
   log_id               bigint not null auto_increment comment '��¼id',
   log_target           bigint not null comment '��¼����',
   log_content          text not null comment '��¼����',
   primary key (log_id)
);

alter table log comment '��¼';

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   message_id           bigint not null auto_increment comment '˽��id',
   send_user_id         bigint not null comment '������id',
   receive_user_id      bigint not null comment '������id',
   message_content      text not null comment '˽������',
   message_time         timestamp not null comment '˽�ŷ���ʱ��',
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
   notice_id            bigint not null auto_increment comment '����id',
   user_id              bigint not null comment '�û�id',
   notice_type          int not null comment '��������',
   notice_read          bool not null default 0 comment '�����Ѷ�',
   notice_content       text not null comment '��������',
   notice_time          timestamp not null comment '���Ѳ������ݿ��ʱ��',
   notice_effective     bool not null default 1 comment '������Ч',
   primary key (notice_id)
);

alter table notice comment 'ϵͳ����';

/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization
(
   user_id              bigint not null comment '�û�id',
   category_id          bigint not null comment '��֯���id',
   organization_customize bool not null default 0 comment '��֯��ҳ�Ƿ���(Ĭ��Ϊ0,��������)',
   organization_certification_infomation char(64) comment '��֯��֤��Ϣ(һ�仰,С��64����)',
   organization_certified bool not null default 0 comment '��֯�Ƿ��Ѿ�������֤(Ĭ��Ϊ0)',
   organization_milestone text comment '��֯��̱���¼',
   primary key (user_id)
);

alter table organization comment '��֯';

/*==============================================================*/
/* Table: policy                                                */
/*==============================================================*/
create table policy
(
   article_id           bigint not null comment '����id',
   policy_hits          int not null default 0 comment '���ߵ����',
   primary key (article_id)
);

alter table policy comment '����';

/*==============================================================*/
/* Table: post                                                  */
/*==============================================================*/
create table post
(
   article_id           bigint not null comment '����id',
   circle_id            bigint not null comment 'Ȧ��id',
   post_type            int not null default 0 comment '��������',
   post_hits            bigint not null default 0 comment '���ӵ����',
   primary key (article_id)
);

alter table post comment 'Ȧ���������(post)';

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project
(
   article_id           bigint not null comment '����id',
   project_hits         bigint not null default 0 comment '��Ŀ�����',
   project_avater_url   char(128) not null comment '��Ŀͷ��ͼƬ',
   primary key (article_id)
);

alter table project comment '��Ŀ';

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   article_id           bigint not null comment '����id',
   question_hits        int not null default 0 comment '��������',
   primary key (article_id)
);

alter table question comment '����';

/*==============================================================*/
/* Table: report                                                */
/*==============================================================*/
create table report
(
   article_id           bigint not null comment '����id',
   user_id              bigint not null comment '�û�id',
   report_type          int not null comment '�ٱ�����',
   report_content       text not null comment '�ٱ�����',
   primary key (article_id, user_id)
);

alter table report comment '�ٱ�';

/*==============================================================*/
/* Table: tag                                                   */
/*==============================================================*/
create table tag
(
   tag_id               bigint not null auto_increment comment '��ǩid',
   tag_title            char(32) not null comment '��ǩ����',
   tag_hits             bigint not null default 0 comment '��ǩ�ȶ�',
   tag_profile          text comment '��ǩ��Ϣ(����)',
   primary key (tag_id)
);

alter table tag comment '��ǩ';

/*==============================================================*/
/* Table: up                                                    */
/*==============================================================*/
create table up
(
   article_id           bigint not null comment '����id',
   user_id              bigint not null comment '�û�id',
   primary key (article_id, user_id)
);

alter table up comment '��';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              bigint not null auto_increment comment '�û�id',
   user_time            timestamp not null comment '�û�����ʱ��',
   user_nickname        char(16) not null comment '�û��ǳ�',
   user_email           char(32) not null comment '�û�email',
   user_passwd          char(32) not null comment '�û������ϣֵ',
   user_profile         text not null comment '�û����',
   user_avater_url      char(128) not null comment '�û�ͷ��url',
   user_sex             char(8) not null default 'unknown' comment '�û��Ա�',
   user_effective       bool not null default 1 comment '�û���Чλ',
   user_last_time       timestamp not null comment '�û����һ�β�����ʱ���(last_time)',
   primary key (user_id)
);

alter table user comment '�û�';

alter table answer add constraint FK_answer_belong_to_question foreign key (question_article_id)
      references question (article_id) on delete restrict on update restrict;

alter table answer add constraint FK_answer_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

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

alter table belong_to_organization add constraint FK_belong_to_organization foreign key (org_user_id)
      references organization (user_id) on delete restrict on update restrict;

alter table belong_to_organization add constraint FK_belong_to_organization2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table block add constraint FK_block foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table block add constraint FK_block2 foreign key (user_id_blocked)
      references user (user_id) on delete restrict on update restrict;

alter table collect_article add constraint FK_collect_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table collect_article add constraint FK_collect_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment_belong_to_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table comment add constraint FK_post_comment foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table dialog add constraint FK_dialog foreign key (user_id_one)
      references user (user_id) on delete restrict on update restrict;

alter table dialog add constraint FK_dialog2 foreign key (user_id_another)
      references user (user_id) on delete restrict on update restrict;

alter table down add constraint FK_down foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table down add constraint FK_down2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_article add constraint FK_focus_on_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table focus_on_article add constraint FK_focus_on_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_user add constraint FK_focus_on_user foreign key (user_id_focused)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_user add constraint FK_focus_on_user2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table improvement add constraint FK_improvement_belong_to_project foreign key (project_article_id)
      references project (article_id) on delete restrict on update restrict;

alter table improvement add constraint FK_improvement_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table message add constraint FK_receive_message foreign key (receive_user_id)
      references user (user_id) on delete restrict on update restrict;

alter table message add constraint FK_send_message foreign key (send_user_id)
      references user (user_id) on delete restrict on update restrict;

alter table notice add constraint FK_notice_sen_to_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table organization add constraint FK_organization_belong_to_category foreign key (category_id)
      references category (category_id) on delete restrict on update restrict;

alter table organization add constraint FK_organization_isa_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table policy add constraint FK_policy_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table post add constraint FK_post_belong_to_circle foreign key (circle_id)
      references circle (circle_id) on delete restrict on update restrict;

alter table post add constraint FK_post_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table project add constraint FK_project_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table question add constraint FK_question_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table report add constraint FK_report foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table report add constraint FK_report2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table up add constraint FK_up foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table up add constraint FK_up2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

