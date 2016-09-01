package com.basic.util.mysql;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.basic.model.base.ReturnData;
import com.basic.util.PropertiesUtils;
/**
 * 创建数据库并导入sql文件
 * 
 * @author qiushi.zhou  
 * @date 2016年9月1日 上午8:54:06
 */
public class DatabaseCreatorMysql{
	
	private static Logger logger = LoggerFactory.getLogger(DatabaseCreatorMysql.class);
	
	private static String mysqlDriver = PropertiesUtils.getPropertyByKey("jdbc.properties", "jdbc.driver");
	private static String url = PropertiesUtils.getPropertyByKey("jdbc.properties", "jdbc.url");
	private static String username = PropertiesUtils.getPropertyByKey("jdbc.properties", "jdbc.username");
	private static String password = PropertiesUtils.getPropertyByKey("jdbc.properties", "jdbc.username");
	Connection conn = null;
	Connection newConn = null;
	
	
	public String databaseCreateAndImportMysql(String databaseName,String sqlFilePath){
		String result = null;
		if(this.createDatabase(databaseName).equals(ReturnData.SUCCESS_CODE)){
			result = this.initializeDatabase(databaseName, sqlFilePath);	
		}
		return result;
	}
	
	/** 
	 * 创建数据库
	 * 
	 * @param 
	 * @return String
	 */
	@Transactional
	public String createDatabase(String database){
		String returnResult = ReturnData.FAIL_CODE;
		try{
			Class.forName(mysqlDriver);
			
			try{
				String databaseSql = "create database " +database;
				conn = DriverManager.getConnection(url,username,password);
				if(conn !=null){
					Statement smt = conn.createStatement();
					smt.executeUpdate(databaseSql);
					returnResult = ReturnData.SUCCESS_CODE;
				}
			}catch(Exception e2){
				logger.error("创建数据库失败：[{}]",e2);
			}
		}catch(Exception e){
			logger.error("加载mysql驱动失败：[{}]",e);
		}
		
		return returnResult;
	}
	
	/** 
	 * 导入sql文件
	 * 
	 * @param 
	 * @return void
	 */
	@Transactional
	public String initializeDatabase(String databaseName, String sqlFilePath) {
		String returnResult = ReturnData.SUCCESS_CODE;
		try {

			StringBuffer sb = new StringBuffer("cmd.exe /C mysql -u");
			sb.append(username);

			if (password != null && !password.equalsIgnoreCase(""))
				sb.append(" -p").append(password);

			sb.append(" ").append(databaseName).append("<")
					.append(sqlFilePath);
			java.lang.Runtime.getRuntime().exec(sb.toString());

		} catch (IOException e) {
			returnResult = ReturnData.FAIL_CODE;
			logger.error("导入sql文件失败:[{}]",e);
		}
		return returnResult;

	} 
	 
	 public static void main(String[] args){
		 String databaseName = "test3";
		 String sqlFilePath = "D:/root.sql";
		 new DatabaseCreatorMysql().databaseCreateAndImportMysql(databaseName, sqlFilePath);
		}
}
