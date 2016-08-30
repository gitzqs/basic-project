package com.basic.web.sys;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.basic.service.sys.role.ISysRoleService;

/**
 * 角色管理
 * 
 * @author qiushi.zhou  
 * @date 2016年8月26日 下午1:29:16
 */
@Controller
@RequestMapping(value="/sysRole")
public class RoleController {
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	/**
	 * 展示页面
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String listRole(){
		return "system/role/sysRole";
	}
	
	/**
	 * 新增角色
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "system/role/addRole";
	}
	/**
	 * 新增角色处理
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/add_operation",method=RequestMethod.POST)
	@ResponseBody
	public String add_role_operation(HttpServletRequest request){
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("code", request.getParameter("roleCode"));
		params.put("name", request.getParameter("roleName"));
		params.put("description", request.getParameter("description"));
		
		return sysRoleService.addRoleOperation(params);
	}
	
}
