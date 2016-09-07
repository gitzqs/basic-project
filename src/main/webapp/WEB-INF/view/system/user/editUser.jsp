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
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<script type="text/javascript" src="${ctx}/js/admin/H-ui.admin.js"></script> 
<script type="text/javascript">
	$(function(){
		edit_operation('sysUser');
	});
</script>
<title>编辑用户角色</title>
</head>
<body>
<article class="page-container pageContainer_other">
	<form id="sysUser_edit_form" class="form form-horizontal" >
		<div id="sysUser_div"style="text-align:center;visibility:hidden;margin-top:-12px"><span id="sysUser_span" style="color:red">编辑用户成功！</span></div>
		<input type="hidden" value="${user.id }" name="userId"/>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  id="username" name="username" value="${user.username}" readonly>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属角色：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="roleId" size="1" required>
					<c:forEach items="${roleList}" var="list">
						<option value="${list.id}" <c:if test='${list.id eq roleId}'>selected="selected"</c:if>>${list.name}</option>
					</c:forEach>
				</select>
				</span> 
			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save" value="确定"/><i class="icon-ok"></i>
			</div>
		</div>
	</form>
</article>

</body>
</html>