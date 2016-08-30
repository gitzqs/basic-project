var strPath = window.document.location.pathname;
var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);

/** 登录认证*/
function loginSubmit(){
	
	var username = $("#username").val();
	var password = $("#password").val();
	if(username == '' || username == null){
		showDiv("用户名不能为空！");
		return false;
	}
	if(password == '' || password == null){
		showDiv("密码不能为空！");
		return false;
	}
	hideDiv();
	$.ajax({
		url : postPath+"/login/login",
		type : 'POST',
		contextType : "application/json;charset=utf-8",
		data : {
			username : username,
			password : password
		},
		dataType : 'JSON',
		cache : false,
		error : function(){
			showDiv("加载失败，请刷新后重新登录！");
		},
		success : function(data){
			if(data.status == 'success'){
				showDiv("认证成功！");
				$("#loginForm").attr("action",postPath+"/admin/").attr("method","GET").submit();
			}else{
				showDiv("用户名或者密码出错！");
			}
			
		}
	});
}

/** 显示提醒*/
function showDiv(value){
	$("#tipsDiv").css("visibility","visible");
	$("#tipsSpan").html(value);
}

/** 隐藏提醒*/
function hideDiv(){
	$("#tipsDiv").css("visibility","hidden");
}
