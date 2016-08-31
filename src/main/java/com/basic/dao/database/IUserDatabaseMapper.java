package com.basic.dao.database;

import com.basic.dao.base.IBaseMapper;
import com.basic.model.database.UserDatabase;

public interface IUserDatabaseMapper extends IBaseMapper<UserDatabase>{
	
	/**
	 * 根据userId获取数据库信息
	 * 
	 * @param 
	 * @return UserDatabase
	 */
	UserDatabase loadByUserId(Long userId);
}
