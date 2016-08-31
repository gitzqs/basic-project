package com.basic.service.database;

import com.basic.model.database.UserDatabase;
import com.basic.service.base.IBaseService;
/**
 * 用户-数据库信息
 * 
 * @author qiushi.zhou  
 * @date 2016年8月31日 下午1:06:12
 */
public interface IUserDatabaseService extends IBaseService{
	
	/**
	 * 根据userId获取数据库信息
	 * 
	 * @param 
	 * @return UserDatabase
	 */
	UserDatabase loadByUserId(Long userId);
}
