# 乱
================================================

## 笔记
- 夏闪闪学长提出私信列表要有一个表作为私信这张表的冗余,里面存放的是两个用户的id和最新聊天的发生内容时间.  
然后有触发器来更新这张表,每次insert message的时候都update或者insert这张表,私信页就按照这张表来显示.
- 组织里面有:创业团队\创业公司\风投\孵化器\特邀企业\政府部门
- 所有文章都可以
- 文章和评论全局id唯一,用户和组织和圈子全局id唯一
- 用户属于圈子要记录用户在圈子中的权限/身份/类型
- 需要的视图:闪闪学长有个视图
- 用户认证信息要有
- 记录用户邮箱验证时的密码,需要单独的一张表

### 触发器笔记
需要的触发器有:
- dialog的触发器 √
- up/down的触发器 √

### Other
- mysql的bigint是64位带符号整数,所以不考虑负数的话,我们有2**63个id可以使用,如果以前3位为前缀的话,有8种id前缀  
  这8种id前缀分别对应,然后就会发现不够用的....   :P     
- 所以我们要用4位前缀,也就是使用bigint unsigned类型,前4位为前缀,这样就有16个前缀,如下:   
  用户(包括组织\普通用户),文章(包括项目\政策\问题\回答\完善\帖子)  ,私信,提醒,圈子,评论,组织类别,admin,config,log,标签   

### 问题
- article这张表要不要有类别来标识articl是哪种?如果有的话,会造成冗余和不安全,但是有了之后会方便很多.    例如收藏的地方,根据收藏的article的id就可以推知article分别是哪些类型.    
- 个人用户详细信息?
- 

### 以后要做的事情
- 触发器
- 完善字段信息
- 考虑如何处理自动生成的sql
- 测试
- 需要插入数据库的初始信息
- 考量需不需要存储过程\视图
- 设计前缀(不同表的id的起始位置)
- 斟酌字段类型(char?Vchar?Text?之类的...还有多长?)
- bigint要改成unsigned
- 
- 
- 优化
- 数据库安全