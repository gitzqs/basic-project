package com.basic.web.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.basic.model.sys.role.SysRole;
import com.basic.service.sys.role.ISysRoleService;
import com.basic.service.sys.user.ISysUserService;
/**
 * 用户
 * 
 * @author qiushi.zhou  
 * @date 2016年8月29日 下午1:55:03
 */
@Controller
@RequestMapping(value="sysUser")
public class UserController {
	
	@Autowired
	private ISysUserService sysUserService;
	@Autowired
	private ISysRoleService sysRoleService;
	
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
	
	/**
	 * 新增用户
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		List<SysRole> roleList = sysRoleService.loadAll();
		model.addAttribute("roleList", roleList);
		return "system/user/addUser";
	}
	
	/**
	 * 新增处理
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/add_operation",method=RequestMethod.POST)
	@ResponseBody
	public String add_operation(HttpServletRequest request){
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("username", request.getParameter("username"));
		params.put("password", request.getParameter("password"));
		params.put("password_again", request.getParameter("password_again"));
		
		return sysUserService.add(params);
	}
}
