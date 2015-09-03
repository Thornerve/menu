/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/9/1 19:39:53                            */
/*==============================================================*/


drop table if exists t_attr_group;

drop table if exists t_attr_value;

drop table if exists t_attribute;

drop table if exists t_category;

drop table if exists t_market_solution;

drop table if exists t_solution;

drop table if exists t_spu;

drop table if exists t_spu_attr_mapping;

drop table if exists t_spu_collect;

drop table if exists t_spu_extend;

drop table if exists t_spu_store;

drop table if exists t_stock;

/*==============================================================*/
/* Table: t_attr_group                                          */
/*==============================================================*/
create table t_attr_group
(
   group_id             int not null,
   group_name           varchar(50),
   creator_id           int,
   create_time          timestamp,
   update_time          timestamp,
   row_status           smallint comment '数据状态(1 有效; 2 已删除)',
   primary key (group_id)
);

alter table t_attr_group comment '属性组';

/*==============================================================*/
/* Table: t_attr_value                                          */
/*==============================================================*/
create table t_attr_value
(
   attr_value_id        int not null,
   attr_id              int,
   value                varchar(100),
   sort_num             int,
   creator              int,
   create_time          timestamp,
   update_time          timestamp,
   row_status           smallint comment '数据状态(1 有效; 2 已删除)',
   primary key (attr_value_id)
);

alter table t_attr_value comment '属性值表';

/*==============================================================*/
/* Table: t_attribute                                           */
/*==============================================================*/
create table t_attribute
(
   attr_id              int not null,
   group_id             int,
   name                 varchar(50),
   alias                varchar(50),
   code                 varchar(50) comment '首页编码',
   is_show              smallint comment '1，是  2，否',
   show_type            smallint comment '1. 下拉框  2. 多选项  3.输入项',
   sort_num             int,
   creator              int,
   create_time          timestamp,
   update_time          timestamp,
   row_status           smallint comment '数据状态(1 有效; 2 已删除)',
   primary key (attr_id)
);

alter table t_attribute comment '属性表';

/*==============================================================*/
/* Table: t_category                                            */
/*==============================================================*/
create table t_category
(
   category_id          int not null,
   piid                 int comment '顶级类目为-1',
   group_id             int comment '关联属性组id',
   category_level       smallint comment '节点所在层级',
   category_id_path     varchar(200) comment '节点所在id串路径',
   name                 varchar(50),
   alias                varchar(50) comment '前台对应的类目名（一期）',
   first_char           varchar(10),
   is_show              smallint comment '1，是  2，否',
   type_code            varchar(10) comment '类目分类代码',
   sort_num             int,
   creator_id           int,
   create_time          timestamp,
   update_time          timestamp,
   row_status           smallint comment '数据状态(1 有效; 2 已删除)',
   primary key (category_id)
);

alter table t_category comment '类目表';

/*==============================================================*/
/* Table: t_market_solution                                     */
/*==============================================================*/
create table t_market_solution
(
   detail_id            int not null comment '营销明细id',
   solution_id          int not null,
   solution_name        varchar(100) not null,
   market_type          tinyint(4) not null comment '1：实物，2：油卡，3：保养券，4：其他',
   gift_name            varchar(20),
   gift_desc            varchar(100),
   gift_value           decimal(10,2),
   gift_number          int,
   primary key (detail_id)
);

alter table t_market_solution comment '营销方案表';

/*==============================================================*/
/* Table: t_solution                                            */
/*==============================================================*/
create table t_solution
(
   solution_id          int not null,
   solution_name        varchar(100) not null,
   solution_type        tinyint(4) not null comment '1：红包，2：折扣，3：买就送',
   publisher            int not null comment '经销商id',
   store_id             int,
   province_id          int,
   city_id              int,
   operator_id          int,
   operator_name        varchar(100),
   operator_time        timestamp,
   create_time          timestamp,
   solution_status      tinyint not null comment '1：有效，2：无效',
   primary key (solution_id)
);

alter table t_solution comment '方案基础表';

/*==============================================================*/
/* Table: t_spu                                                 */
/*==============================================================*/
create table t_spu
(
   spu_id               int not null,
   title                varchar(100) comment 'spu名称',
   sub_title            varchar(200) comment '商品描述等',
   cover_img_url        varchar(200) comment '商品图片路径',
   spu_status           smallint comment '流转状态（1.新建 2. 待审核 3.审核通过 4,审核不通过 5.已发布给经销商 6.进行中 7.已下线 8. 已撤销）',
   sponsor              int,
   category_id          int,
   stock_id             int,
   food_id              int,
   city_id              int,
   out_price            decimal,
   in_price             decimal,
   market_solution_id   int,
   tag                  varchar(200) comment '营销标签',
   hot_zone             smallint,
   sort_num             int,
   total_member         int comment '关注人数',
   total_member_show    int comment '默认关注人数',
   perchase_num         char(10) comment '默认销售数',
   store_id             int comment '经销商门店id',
   age_tag              smallint,
   start_time           timestamp,
   end_time             timestamp,
   spu_desc_id          int,
   row_status           smallint comment '数据状态(1 有效; 2 已删除)',
   primary key (spu_id)
);

alter table t_spu comment '商品（菜）';

/*==============================================================*/
/* Table: t_spu_attr_mapping                                    */
/*==============================================================*/
create table t_spu_attr_mapping
(
   mapping_id           int not null,
   spu_id               int,
   attr_id              int,
   attr_value_id        int,
   primary key (mapping_id)
);

alter table t_spu_attr_mapping comment '商品属性关联表(新建 菜 时维护)';

/*==============================================================*/
/* Table: t_spu_collect                                         */
/*==============================================================*/
create table t_spu_collect
(
   collect_id           int not null,
   user_id              int not null,
   spu_id               int not null,
   create_time          timestamp,
   row_status           smallint comment '数据状态(1 有效; 2 已删除)',
   primary key (collect_id)
);

alter table t_spu_collect comment '我的收藏';

/*==============================================================*/
/* Table: t_spu_extend                                          */
/*==============================================================*/
create table t_spu_extend
(
   spu_id               int not null,
   creator_id           int,
   creator_name         varchar(50),
   approver_id          int,
   approver_name        varchar(50),
   modify_id            int,
   modify_name          varchar(50),
   create_time          timestamp,
   update_time          timestamp,
   approve_time         timestamp,
   last_approval_comment varchar(500) comment '最后审核意见',
   canceller_name       varchar(50),
   canceller_id         int,
   cancel_reason        varchar(500),
   cancel_time          timestamp,
   del_person_id        int,
   del_person_name      varchar(50),
   delete_time          timestamp,
   primary key (spu_id)
);

alter table t_spu_extend comment 'spu拓展表';

/*==============================================================*/
/* Table: t_spu_store                                           */
/*==============================================================*/
create table t_spu_store
(
   spu_store_id         int not null,
   spu_id               int,
   province_id          int comment '省ID',
   city_id              int comment '城市ID',
   district_id          int comment '区ID',
   store_id             int comment '店铺ID',
   row_status           smallint comment '数据状态(1 有效; 2 已删除)',
   accept_status        smallint comment '1.未承接 2.已承接',
   primary key (spu_store_id)
);

alter table t_spu_store comment 'spu_store';

/*==============================================================*/
/* Table: t_stock                                               */
/*==============================================================*/
create table t_stock
(
   stock_id             int not null,
   food_id              int,
   batch_name           varchar(50),
   store_id             int,
   total_num            int,
   locked_num           int,
   used_num             int,
   available_num        int,
   row_status           smallint comment '数据状态(1 有效; 2 已删除)',
   create_time          timestamp comment '创建时间',
   primary key (stock_id)
);

alter table t_stock comment '库存总表';

alter table t_attr_value add constraint FK_Reference_5 foreign key (attr_id)
      references t_attribute (attr_id) on delete restrict on update restrict;

alter table t_attribute add constraint FK_Reference_13 foreign key (group_id)
      references t_attr_group (group_id) on delete restrict on update restrict;

alter table t_category add constraint FK_Reference_4 foreign key (group_id)
      references t_attr_group (group_id) on delete restrict on update restrict;

alter table t_market_solution add constraint FK_Reference_15 foreign key (solution_id)
      references t_solution (solution_id) on delete restrict on update restrict;

alter table t_spu add constraint FK_Reference_6 foreign key (stock_id)
      references t_stock (stock_id) on delete restrict on update restrict;

alter table t_spu_attr_mapping add constraint FK_Reference_17 foreign key (spu_id)
      references t_spu (spu_id) on delete restrict on update restrict;

alter table t_spu_attr_mapping add constraint FK_Reference_18 foreign key (attr_id)
      references t_attribute (attr_id) on delete restrict on update restrict;

alter table t_spu_attr_mapping add constraint FK_Reference_19 foreign key (attr_value_id)
      references t_attr_value (attr_value_id) on delete restrict on update restrict;

alter table t_spu_store add constraint FK_Reference_20 foreign key (spu_id)
      references t_spu (spu_id) on delete restrict on update restrict;
