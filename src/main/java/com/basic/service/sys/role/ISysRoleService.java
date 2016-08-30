package com.basic.service.sys.role;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.basic.service.base.IBaseService;
/**
 * 角色service
 * 
 * @author qiushi.zhou  
 * @date 2016年8月26日 下午4:18:29
 */
public interface ISysRoleService extends IBaseService{
	
	/**
	 * 新增处理
	 * 
	 * @param 
	 * @return void
	 */
	@Transactional
	String addRoleOperation(Map<String,Object> params);
}
