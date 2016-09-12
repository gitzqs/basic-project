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
<link rel="stylesheet" type="text/css" href="${ctx}/css/zTreeStyle.css" />
<script>
	function optionsLoad(value,nextValue){
		var id = $("#"+value+" option:selected").val();
		$.ajax({
			url : '${ctx}/login/address_operation',
			type : 'POST',
			data : {
				id : id
			},
			dataType : 'JSON',
			contextType : 'applicationContext/json;charset=utf-8',
			cache : false,
			success : function(data){
				if(data.returnCode == '0000'){
					$("#"+nextValue).empty();
					var address = data.addressList;
					$("#"+nextValue).append("<option>请选择</option>");
					for(var i=0; i<address.length; i++){
						$("#"+nextValue).append("<option value='"+address[i].ID+"'>"+address[i].NAME+"</option>");
					}
				}else{
					alert(data.returnMsg);
				}
				
			}
		})
	}
</script>
<title>主页</title>
</head>
<body>
	
	<div style="display:none">
		WELCOME!
		<ul class="ztree">
		<li class="">
		<span class="button level0 switch roots_close"></span>
		<span class="button level0 ico_close"></span>
	</li>
	</ul>
	</div>
	
	<div>
		多级联动展示
		<br>
		洲：&nbsp;<select id="delta" name="delta" onchange="optionsLoad('delta','country');">
			<option>请选择</option>
			<c:forEach items="${addressList }" var="list">
				<option value="${list.ID}">${list.NAME}</option>
			</c:forEach>
		</select>
		
		<br>
		国：&nbsp;<select id="country"name="country" onchange="optionsLoad('country','provice');">
			<option>请选择</option>
		</select>
		
		<br>
		省：&nbsp;<select id = "provice" name="provice" onchange="optionsLoad('provice','city');">
			<option>请选择</option>
		</select>
		
		<br>
		市：&nbsp;<select id = "city" name="city">
			<option>请选择</option>
		</select>
		
		
	</div>
	
</body>
</html>