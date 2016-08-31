package com.basic.model.database;

import com.basic.model.base.REntity;
import com.basic.model.sys.user.SysUser;
/**
 * 用户-数据连接信息
 * 
 * @author qiushi.zhou  
 * @date 2016年8月31日 下午12:47:34
 */
public class UserDatabase extends REntity{

	private static final long serialVersionUID = -9151318980067603483L;
	
	/** 用户*/
	private SysUser user;
	
	/** 数据库驱动*/
	private String databaseDriver;
	
	/** 数据库地址*/
	private String databaseUrl;
	
	/** 数据库名称*/
	private String databaseName;
	
	/** 数据库用户名*/
	private String databaseUser;
	
	/** 数据库密码*/
	private String databasePassword;
	
	/** 状态{@link EBaseStatus.java}*/
	private String status;
	
	/** 备注*/
	private String description;

	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public String getDatabaseName() {
		return databaseName;
	}

	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}

	public String getDatabaseUser() {
		return databaseUser;
	}

	public void setDatabaseUser(String databaseUser) {
		this.databaseUser = databaseUser;
	}

	public String getDatabasePassword() {
		return databasePassword;
	}

	public void setDatabasePassword(String databasePassword) {
		this.databasePassword = databasePassword;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDatabaseDriver() {
		return databaseDriver;
	}

	public void setDatabaseDriver(String databaseDriver) {
		this.databaseDriver = databaseDriver;
	}

	public String getDatabaseUrl() {
		return databaseUrl;
	}

	public void setDatabaseUrl(String databaseUrl) {
		this.databaseUrl = databaseUrl;
	}
	
	
}
