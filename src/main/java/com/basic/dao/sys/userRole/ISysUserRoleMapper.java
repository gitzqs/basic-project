package com.basic.dao.sys.userRole;

import com.basic.dao.base.IBaseMapper;
import com.basic.model.sys.userRole.SysUserRole;
/**
 * 
 * 
 * @author qiushi.zhou  
 * @date 2016年8月23日 上午10:59:08
 */
public interface ISysUserRoleMapper extends IBaseMapper<SysUserRole>{
	
	/**
	 * 根据username进行查询
	 * 
	 * @param 
	 * @return SysUserRole
	 */
	SysUserRole loadByUsername(String username);
}
