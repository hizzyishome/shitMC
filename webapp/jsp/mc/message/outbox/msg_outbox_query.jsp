<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="ui" uri="/tags/GCloud-UI"%>
<%@ page import="com.inspur.gcloud.bsp.BspUtil" %>
<%@ page import="com.inspur.gcloud.mc.common.*" %>
<!DOCTYPE html>
<%
	//登录用户的用户名
	String loginName = BspUtil.getInstance().getLoginUserName();
	//获取当前登录用户id
	String loginId = BspUtil.getInstance().getLoginUserOrganId();
	//设定消息类型
	String messageType = McDataObjectConstants.MESSAGE_TYPE_MESSAGE;
	//设定信箱类型
	String boxType = McSystemConstants.MESSAGE_OUT_BOX;
%>
<html>
<head>
<title>已发送</title>
<ui:ScriptManager hasList="true"></ui:ScriptManager>
<script type="text/javascript">
	var loginName = '<%=loginName%>';
	var loginId = '<%=loginId%>';
	var messageType = '<%=messageType%>';
	var boxType = '<%=boxType%>';
</script>
</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form class="form-inline queryForm" role="form" onsubmit="return false;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="收件人"
								id="receiverName">
							<div class="input-group-addon" id="queryBtn">
								<span class="fa fa-search"></span>
							</div>
						</div>
						
						<a class="btn btn-moresearch" id="moresearch"><i
							class="fa fa-angle-double-down"></i>更多查询</a>
						<div class="pull-right">
							<button class="btn btn-primary" type="button" id="addBtn">
								<i class="fa fa-plus fa-fw"></i>新建
							</button>
							<button class="btn btn-primary" type="button" id="editBtn">
								<i class="fa fa-edit fa-fw"></i>编辑
							</button>
							<button class="btn btn-danger" type="button" id="delBtn">
								<i class="fa fa-trash-o fa-fw"></i>删除
							</button>
						</div>
					</form>
					<div class="panel panel-default">
						<div class="panel-body">
							<table id="messageList" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th data-number="true">
										<th data-checkbox="true">
										<th width="15%" data-field="receiverName" data-sortable="false">收件人</th>
										<th width="25%" data-field ="messageContent" data-render="messageShowLink">消息内容</th>
										<th width="25%" data-field="sendTime">日期</th>
										<th width="25%" data-field="sendState" data-render="renderstatus">状态</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="<ui:context/>jsp/mc/message/outbox/js/msg_outbox_query.js"></script>
		<script id="mypopover" type="text/html">
		<table class="table table-moresearch">
			<tr>
				<td class="fieldInput"><label>状态</label>
					<select class="form-control input-md" name="sendState" id="sendState">
						<option value="">请选择</option>
						<option value="1">已发送</option>
						<option value="4">发送中</option>
						<option value="5">发送失败</option>
					</select>
				</td>
				<td class="fieldInput"><label>短信内容</label>
					<input type="text" id="messageContent" class="form-control" placeholder="短信内容关键字">
				</td>		
			</tr>
			<tr>
				<td class="fieldInput">
					<label>开始于</label>
					<div class="input-group" style="display:inline-table">
					     <input type="text" class="form-control"  id="sendTimeFrom" data-bind="value:startTime" readOnly onclick="selectTime(this)" style="display:inline-table;width: 100%;"></input>
						 <span class="input-group-addon "><i class="fa fa-calendar"></i></span>
					</div>
				</td>
				<td class="fieldInput">
					<label>结束于</label>
					<div class="input-group" style="display:inline-table">
						 <input type="text" class="form-control "  id="sendTimeTo" data-bind="value:sendTime" readOnly onclick="selectTime(this)" style="display:inline-table;width: 100%;"></input>
						 <span class="input-group-addon "><i class="fa fa-calendar"></i></span>
				    </div>

				</td>
			</tr>
			<tr>
				<td colspan="2" class="pull-left">
					<button type="button" class="btn btn-primary" id="moreQueryBtn"><i class="fa fa-search"></i>查询</button>
					<button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-reply"></i>重置</button>
				</td>	
			</tr>
		</table>	
	</script>
	</body>
</html>