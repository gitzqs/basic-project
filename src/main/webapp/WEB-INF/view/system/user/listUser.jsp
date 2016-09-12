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

<script type="text/javascript" src="${ctx}/js/layer.js"></script>  
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx}/js/admin/H-ui.admin.js"></script> 
<script type="text/javascript">
	$(function(){
		 page(1,5);
	});
</script>

<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray"> 
		<span class="l"> 
			<a class="btn btn-primary radius" href="javascript:;" onclick="add('添加用户','${ctx}/sysUser/add','600','450')"><i class="Hui-iconfont">&#xe600;</i> 新增</a> 
			<a href="javascript:;" onclick="edit('编辑','${ctx}/sysUser/edit','400','300','sysUser')" class="btn btn-edit2 radius"><i class="Hui-iconfont">&#xe6df;</i> 编辑</a> 
			<a href="javascript:;" onclick="remove('sysUser');" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 删除</a>
			<a href="javascript:;" onclick="exportExcel('sysUser');" class="btn  radius"><i class="Hui-iconfont">&#xe644;</i> 导出成excel</a>
			<a href="javascript:;" onclick="exportCvs('sysUser');" class="btn  radius"><i class="Hui-iconfont">&#xe644;</i> 导出成CVS</a> 
		</span>
	</div>
	
	<div style="display:none">
		<form id="sysUser_requestForm" action="${ctx}/sysUser/exportXls">
			<input type="hidden" id="bean" name="bean" value="sysUser">
			<input type="hidden" id="sysUser_method" name="method" value="page">
			<input type="hidden" id="sysUser_offset" name="offset" value="0">
			<input type="hidden" id="sysUser_rows" name="rows" value="5">
			
			<input type="hidden" id="id" name="id"/>
			<input type="hidden" id="username" name="username"/>
			<input type="hidden" id="rolename" name="rolename">
		</form>
	</div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr class="text-c">
				<th></th>
					<th><input class="tail_table_query_input" type="text" onkeyup="javascript:queryForm($(this),'id');"/></th>
					<th><input class="tail_table_query_input" type="text" onkeyup="javascript:queryForm($(this),'username');"/></th>
					<th><input class="tail_table_query_input" type="text" onkeyup="javascript:queryForm($(this),'rolename');"/></th>
			</tr>
			<tr class="text-c" id="sysUser_tr">
				<th><input type="checkbox" value="" name=""></th>
				<th>ID</th>
				<th>用户名</th>
				<th>所属角色</th>
				<th>用户状态</th>
				<th>创建人</th>
				<th>创建时间</th>
				<th>最后修改人</th>
				<th>最后修改时间</th>
			</tr>
		</thead>
		<tbody id="sysUser_tableData">
		</tbody>
	</table>
	
	<div id="sysUser_paramsDiv" style="display:none">
		<input type="text" value="ID"/>
		<input type="text" value="USERNAME"/>
		<input type="text" value="ROLENAME"/>
		<input type="text" value="STATUS"/>
		<input type="text" value="CREATOR"/>
		<input type="text" value="CREATED_TIME"/>
		<input type="text" value="LAST_OPERATOR"/>
		<input type="text" value="LAST_OPERATED_TIME"/>
	</div>
	
	<!-- 尾部导航 begin -->
	<div id="sysUser_tail_navigation_1"class="tail_div_1">
	</div>
	<div  class="tail_div_2">
		<table cellspacing="10" id="sysUser_tail_navigation_2">
		</table>
	</div>
	<!-- 尾部导航 end -->
</div>
</body>
</html>