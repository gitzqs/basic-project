<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspf/taglibs.jsp" %>
<%@ include file="/WEB-INF/view/jspf/base_js_css.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" type="text/css" href="${ctx}/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/admin/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/zTreeStyle.css" />

<script type="text/javascript" src="${ctx}/js/layer.js"></script>  
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx}/js/admin/H-ui.admin.js"></script> 
<script type="text/javascript">
	$(function(){
		 page(1,5);
	});
</script>

<title>权限管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 权限管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray"> 
		<span class="l"> 
			<a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加角色','admin-role-add.html','800')"><i class="Hui-iconfont">&#xe600;</i> 新增</a> 
			<a href="javascript:;" onclick="datadel()" class="btn btn-edit2 radius"><i class="Hui-iconfont">&#xe6df;</i> 编辑</a> 
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 删除</a> 
		</span>
	</div>
	
	<!-- 查询条件 begin -->
	<div style="display:none" >
		<form id="sysPermission_requestForm">
			<input type="hidden" id="bean" name="bean" value="sysPermission">
			<input type="hidden" id="sysPermission_method" name="method" value="page">
			<input type="hidden" id="sysPermission_offset" name="offset" value="0">
			<input type="hidden" id="sysPermission_rows" name="rows" value="5">
		</form>
	</div>
	<!-- 查询条件 end -->
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr class="text-c" id="sysPermission_tr">
				<th><input type="checkbox" value="" name=""></th>
				<th>权限名称</th>
				<th>权限类型</th>
				<th>权限地址</th>
				<th>优先级</th>
			</tr>
		</thead>
		<tbody id="sysPermission_tableData">
		</tbody>
	</table>
	
	<div id="sysPermission_paramsDiv" style="display:none">
		<input type="text" value="NAME"/>
		<input type="text" value="TYPE"/>
		<input type="text" value="URL"/>
		<input type="text" value="PRIORITY"/>
		
	</div>
	
	<!-- 尾部导航 begin -->
	<div id="sysPermission_tail_navigation_1"class="tail_div_1">
	</div>
	<div  class="tail_div_2">
		<table cellspacing="10" id="sysPermission_tail_navigation_2">
		</table>
	</div>
	<!-- 尾部导航 end -->
</div>
</body>
</html>