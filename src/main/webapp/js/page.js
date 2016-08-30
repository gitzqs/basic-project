var strPath = window.document.location.pathname;
var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);

/**  分页查询主函数*/
function page(curPage,pageSize,bean){
	var map = {
			bean : bean,
			method : 'page',
			offset : (curPage -1) * pageSize,
			rows : pageSize
	};
	$.ajax({
		url : postPath+"/base/page",
		type : 'POST',
		contextType : 'application/json;charset=utf-8',
		dataType : 'JSON',
		data : map,
		cache : false,
		error : function(){
			/** 暂不设置*/
		},
		success : function(data){
			/** 清空原有数据*/
			emptyTableData(bean);
			/** 加入现有数据*/
			data_generate(data.rows,bean);
			/** 设置尾部导航*/
			setTailNavigation(data.total,curPage,pageSize,bean);
		}
	});
}

/** 清空table原有数据*/
function emptyTableData(bean){
	$("#"+bean+"_tableData").html("");
}

/** 尾部导航*/
function setTailNavigation(total,curPage,pageSize,bean){
	
	/** 设置尾部导航1*/
	setTailNavigationOne(total,curPage,pageSize,bean);
	/** 设置尾部导航2*/
	setTailNavigationTwo(total,curPage,pageSize,bean);
}

/** 设置尾部导航1*/
function setTailNavigationOne(total,curPage,pageSize,bean){
	
	total = parseInt(total);
	curPage = parseInt(curPage);
	pageSize = parseInt(pageSize);
	
	var idName = bean+"_tail_navigation_1";
	$("#"+idName).empty();
	/** 添加每页个数选择*/
	$("#"+idName).append("<select id='"+bean+"_select"+"'class='tail_select' onchange='changeRowNumber(\""+bean+"\");'>" +
			"<option value='3'>&nbsp;&nbsp;&nbsp;&nbsp;3</option>" +
			"<option value='5'>&nbsp;&nbsp;&nbsp;&nbsp;5</option>"+
			"<option value='10'>&nbsp;&nbsp;&nbsp;10</option>"+
			"</select>");
	
	$("#"+idName+" option[value='"+pageSize+"']").attr("selected","true");
	
	/** 添加当前页个数/总个数*/
	if(total <= pageSize){
		$("#"+idName).append("<span class='tail_span_word_1'>共<span class='tail_span_word_2'>"+total
				+"</span>/"+total+"条</span>");
	}else{
		if(curPage * pageSize <= total){
			$("#"+idName).append("<span class='tail_span_word_1'>共<span class='tail_span_word_2'>"+pageSize
					+"</span>/"+total+"条</span>");
		}else{
			$("#"+idName).append("<span class='tail_span_word_1'>共<span class='tail_span_word_2'>"+(total-curPage*pageSize+pageSize)
					+"</span>/"+total+"条</span>");
		}
		
	}
}

/** 设置尾部导航2*/
function setTailNavigationTwo(total,curPage,pageSize,bean){
	var idName2 = bean+"_tail_navigation_2";
	$("#"+idName2).empty();
	
	var total_page = Math.ceil(total/pageSize);
	
	if(total_page == 1 || total_page == 0){
		$("#"+idName2).append("<tr>");
		$("#"+idName2).append("<td><a class='btn btn-primary2 radius' href='javascript:void(0);'>首页</a></td>");
		$("#"+idName2).append("<td><a class='btn btn-primary2 radius' href='javascript:void(0);'>上页</a></td>");
		$("#"+idName2).append("<td><input type='text' class='tail_table_input' value='1'/></td>");
		$("#"+idName2).append("<td><a class='btn btn-primary2 radius' href='javascript:void(0);'>下页</a></td>");
		$("#"+idName2).append("<td><a class='btn btn-primary2 radius' href='javascript:void(0);'>尾页</a></td>");
		$("#"+idName2).append("<td><span class='tail_span_word_1'>第<span class='tail_span_word_2'>1</span>/1页</span></td></tr></table>");
		$("#"+idName2).append("</tr>");
	}else{
		
		$("#"+idName2).append("<tr>");
		if(curPage == 1){
			$("#"+idName2).append("<td><a class='btn btn-primary2 radius' href='javascript:void(0);'>首页</a></td>");
			$("#"+idName2).append("<td><a class='btn btn-primary2 radius' href='javascript:void(0);'>上页</a></td>");
		}else{
			$("#"+idName2).append("<td><a class='btn btn-primary radius' href='javascript:goFirstPage(\""+bean+"\",\""+pageSize+"\");'>首页</a></td>");
			$("#"+idName2).append("<td><a class='btn btn-primary radius' href='javascript:goPrePage(\""+curPage+"\",\""+bean+"\",\""+pageSize+"\");'>上页</a></td>");
		}
		$("#"+idName2).append("<td><input type='text' class='tail_table_input' value='"+curPage+"' onkeyup='if(event.keyCode==13){setPageNumber($(this),\""+bean+"\",\""+pageSize+"\");}'/></td>");
		if(curPage == total_page){
			$("#"+idName2).append("<td><a class='btn btn-primary2 radius' href='javascript:void(0);'>下页</a></td>");
			$("#"+idName2).append("<td><a class='btn btn-primary2 radius' href='javascript:void(0);'>尾页</a></td>");
		}else{
			$("#"+idName2).append("<td><a class='btn btn-primary radius' href='javascript:goNextPage(\""+curPage+"\",\""+bean+"\",\""+pageSize+"\");'>下页</a></td>");
			$("#"+idName2).append("<td><a class='btn btn-primary radius' href='javascript:goLastPage(\""+total_page+"\",\""+bean+"\",\""+pageSize+"\");'>尾页</a></td>");
		}
		
		$("#"+idName2).append("<td><span class='tail_span_word_1'>第<span class='tail_span_word_2'>"+curPage+"</span>/"+total_page+"页</span></td>");
		$("#"+idName2).append("</tr>");
	}
}

/** 首页*/
function goFirstPage(bean,pageSize){
	page(1,pageSize,bean);
}

/** 上一页*/
function goPrePage(curPage,bean,pageSize){
	page(parseInt(curPage)-1,pageSize,bean);
}

/** 尾页*/
function goLastPage(total_page,bean,pageSize){
	page(parseInt(total_page),pageSize,bean);
}

/** 下一页*/
function goNextPage(curPage,bean,pageSize){
	page(parseInt(curPage)+1,pageSize,bean);
}

/** 输入页码直接跳转*/
function setPageNumber(number,bean,pageSize){
	page(parseInt(number.val()),pageSize,bean);
}

/** 数据生成*/
function data_generate(rows,bean){
	/** 存储参数名称*/
	var params = {};
	var params_size = 0;
	var idName_div = bean+"_paramsDiv";
	$("#"+idName_div+" input[type='text']").each(function(){
		params[params_size] = $(this).val();
		params_size++;
	});
	
	/** 数据生成*/
	var divName = bean + "_tableData";
	/** 清空之前数据*/
	$("#"+divName).html();
	for(var j=0; j < rows.length; j++){
		$("#"+divName).append("<tr class='text-c' id='tr_"+j+"'>");
		$("#tr_"+j).append("<td><input type='checkbox'/></td>");
		for(var k=0; k<params_size; k++){
			if(rows[j][params[k]] == undefined){
				rows[j][params[k]] = '-';
			}
			$("#tr_"+j).append("<td>"+rows[j][params[k]]+"</td>");
		}
		$("#"+divName).append("</tr>");
	}
}

/** 改变分页行数*/
function changeRowNumber(bean){
	var idName_select = bean+"_select";
	var number = $("#"+idName_select+" option:selected").text();
	page(1,parseInt(number),bean);
}


/************* 以下是权限页面特殊处理方式  ****************/

/** 获得子列表*/
/*function setChildren(value){
	value = 'sysPermission_tableData';
	$("#sysPermission_tableData tr:eq(0)").after("<tr class='text-c'><td>2</td></tr>");
}*/
