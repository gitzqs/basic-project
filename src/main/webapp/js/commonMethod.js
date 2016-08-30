var strPath = window.document.location.pathname;
var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);

/** 新增-页面跳转**/
function add(title,url,w,h){
	layer_show(title,url,w,h);
}

/** 新增-逻辑处理**/
function add_operation(bean){
	var formName = bean+"_add_form";
	
	$("#"+formName).validate({
		submitHandler : function(form){
			$.ajax({
				url : postPath+"/"+bean+"/add_operation",
				type : 'post',
				data : $("#"+formName).serialize(),
				dataType : 'json',
				contextType : 'applicationContext/json;charset=utf-8',
				cache : false,
				success : function(data){
					if(data.returnCode == '0000'){
						$("#"+bean+"_span").html(data.returnMsg);
						$("#"+bean+"_div").css('visibility','visible');
						setTimeout(function(){
							layer_close();
						},1000);
						
						
					}else{
						alert(data.returnMsg);
					}
				}
			});
		}
	});
}


/** 编辑**/
function edit(title,url,w,h){
	
}





/************  表单验证   ******************/
$.extend($.validator.messages, {
    required: "必填字段",
    remote: "请修正该字段",
    email: "请输入正确格式的电子邮件",
    url: "请输入合法的网址",
    date: "请输入合法的日期",
    dateISO: "请输入合法的日期 (ISO).",
    number: "请输入合法的数字",
    digits: "只能输入整数",
    creditcard: "请输入合法的信用卡号",
    equalTo: "请再次输入相同的值",
    accept: "请输入拥有合法后缀名的字符串",
    maxlength: $.validator.format("请输入一个长度最多是 {0} 的字符串"),
    minlength: $.validator.format("请输入一个长度最少是 {0} 的字符串"),
    rangelength: $.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
    range: $.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
    max: $.validator.format("请输入一个最大为 {0} 的值"),
    min: $.validator.format("请输入一个最小为 {0} 的值")
});