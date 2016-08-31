package com.basic.aop.database;
/**
 * 多个登录用户可能需要同时切换数据源，所以这里需要写一个线程安全的ThreadLocal
 *
 * @author: qiushi.zhou
 * @since: 2016年7月6日下午4:35:34
 */
public class DBContextHolder {
	
	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();
	
	public static void setDbType(String dbType){
		contextHolder.set(dbType);
	}
	
	public static String getDbType(){
		return (contextHolder.get());
	}
	
	public static void clearDbType(){
		contextHolder.remove();
	}
}
