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
		 page(1,5,'sysUser');
	});
</script>

<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray"> 
		<span class="l"> 
			<a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加角色','admin-role-add.html','800')"><i class="Hui-iconfont">&#xe600;</i> 新增</a> 
			<a href="javascript:;" onclick="datadel()" class="btn btn-edit2 radius"><i class="Hui-iconfont">&#xe6df;</i> 编辑</a> 
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 删除</a> 
		</span>
	</div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">角色管理</th>
			</tr>
			<tr class="text-c" id="sysUser_tr">
				<th><input type="checkbox" value="" name=""></th>
				<th>ID</th>
				<th>用户名</th>
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
<script type="text/javascript">
/*管理员-角色-添加*/
function admin_role_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-角色-编辑*/
function admin_role_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-角色-删除*/
function admin_role_del(obj,id){
	layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>
</body>
</html>