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
import com.basic.model.sys.user.SysUser;
import com.basic.model.sys.userRole.SysUserRole;
import com.basic.service.sys.role.ISysRoleService;
import com.basic.service.sys.user.ISysUserService;
import com.basic.service.sys.userRole.ISysUserRoleService;
import com.basic.util.String.StringUtils;
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
	@Autowired
	private ISysUserRoleService sysUserRoleService;
	
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
		params.put("roleId", request.getParameter("roleId"));
		params.put("username", request.getParameter("username"));
		params.put("password", request.getParameter("password"));
		params.put("password_again", request.getParameter("password_again"));
		
		return sysUserService.add(params);
	}
	
	/**
	 * 编辑
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String edit(Model model,HttpServletRequest request){
		//获取全部角色
		List<SysRole> roleList = sysRoleService.loadAll();
		model.addAttribute("roleList", roleList);
		
		//获取当前角色id
		String userId = request.getParameter("id");
		if(!StringUtils.isEmpty(userId)){
			SysUser user = sysUserService.load(Long.parseLong(userId));
			if(user != null){
				model.addAttribute("user", user);
				SysUserRole userRole = sysUserRoleService.loadByUserId(Long.parseLong(userId));
				if(userRole != null){
					model.addAttribute("roleId", userRole.getRole().getId());
				}
			}
			
		}
		return "system/user/editUser";
	}
	
	/**
	 * 编辑操作
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/edit_operation",method=RequestMethod.POST)
	@ResponseBody
	public String edit_operation(HttpServletRequest request){
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("userId", request.getParameter("userId"));
		params.put("roleId", request.getParameter("roleId"));
		
		return sysUserService.edit(params);
	}
	
	/**
	 * 删除操作
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	@ResponseBody
	public String remove(String ids){
		
		return null;
	}
}
