package com.basic.service.sys.user;

import org.springframework.transaction.annotation.Transactional;

import com.basic.model.sys.user.SysUser;
import com.basic.service.base.IBaseService;
/**
 * user的service
 * 
 * @author qiushi.zhou  
 * @date 2016年8月24日 上午10:06:28
 */
public interface ISysUserService extends IBaseService{
	
	/**
	 * 根据username进行查询
	 * 
	 * @param username
	 * @return SysUser
	 */
	@Transactional
	SysUser loadByUsername(String username);
}
