DROP DATABASE IF EXISTS blog;
/*创建数据库，并设置编码*/
CREATE DATABASE blog DEFAULT CHARACTER SET utf8mb4;

USE blog;

DROP TABLE IF EXISTS `blogger`;
CREATE TABLE IF NOT EXISTS `blogger`(
  `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '表主键',

  `account` VARCHAR(64) UNIQUE NOT NULL COMMENT '账号',
  `password` VARCHAR(64) COMMENT '密码',
  `salt` VARCHAR(64) COMMENT '盐',
  `head_url` VARCHAR(512) COMMENT '头像',
  `name` VARCHAR(64) COMMENT '昵称',
  `gender` CHAR(1) COMMENT '性别',
  `introduce` VARCHAR(512) COMMENT '介绍'
)ENGINE INNODB DEFAULT CHARSET=utf8 COMMENT='博主' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article`(
  `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '表主键',

  `title` VARCHAR(64) UNIQUE NOT NULL COMMENT '标题',
  `label_id` BIGINT UNSIGNED COMMENT '标签id号',
  `content` TEXT COMMENT '内容',
  `create_time` DATETIME COMMENT '添加时间',
  `update_time` TIMESTAMP COMMENT '更新时间'
)ENGINE INNODB DEFAULT CHARSET=utf8 COMMENT='文章' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `label`;
CREATE TABLE IF NOT EXISTS `label`(
  `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '表主键',

  `name` VARCHAR(64) UNIQUE NOT NULL COMMENT '标签名称'
)ENGINE INNODB DEFAULT CHARSET=utf8 COMMENT='标签' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `login_ticket`;
CREATE TABLE IF NOT EXISTS `login_ticket`(
  `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '表主键',

  `expired` DATETIME NOT NULL COMMENT '超时时间',
  `status` TINYINT NOT NULL DEFAULT '1' COMMENT '是否有效',
  `ticket` VARCHAR(64) NOT NULL COMMENT '票据'
)ENGINE INNODB DEFAULT CHARSET=utf8 COMMENT='token' AUTO_INCREMENT=1;