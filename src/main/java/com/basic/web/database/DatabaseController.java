package com.basic.web.database;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 数据库信息
 * 
 * @author qiushi.zhou  
 * @date 2016年9月1日 上午11:17:59
 */
@Controller
@RequestMapping(value="userDatabase")
public class DatabaseController {
	
	/**
	 * 展示页面
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/")
	public String list(){
		return "database/listDatabase";
	}
}
