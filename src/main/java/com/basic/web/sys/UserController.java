package com.basic.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * 用户
 * 
 * @author qiushi.zhou  
 * @date 2016年8月29日 下午1:55:03
 */
@Controller
@RequestMapping(value="sysUser")
public class UserController {
	
	/**
	 * 用户管理页面
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String list(){
		return "system/user/listUser";
	}
}
