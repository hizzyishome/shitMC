-- 菜单
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,MODULE_CODE,APP_CODE)
VALUES('MC','消息','MC','APPMC');

-- 菜单关系
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) 
VALUES ('MC','1','MC','MC',0,'MC','消息');