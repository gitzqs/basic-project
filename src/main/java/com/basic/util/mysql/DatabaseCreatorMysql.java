package com.basic.util.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseCreatorMysql{
	
	String mysqlDriver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test";
	String newUrl = "jdbc:mysql://localhost:3306/";
	String username = "root";
	String password = "root";
	Connection conn = null;
	Connection newConn = null;
	
	public static void main(String[] args){
		String database = "test3";
		new DatabaseCreatorMysql().getConn(database);
	}
	
	public Connection getConn(String database){
		
		try{
			Class.forName(mysqlDriver);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		try{
			String databaseSql = "create database " +database;
			conn = DriverManager.getConnection(url,username,password);
			Statement smt = conn.createStatement();
			if(conn !=null){
				System.out.println("数据库连接成功！");
				smt.executeUpdate(databaseSql);
				newConn = DriverManager.getConnection(newUrl+database,username,password);
				if(newConn !=null){
					System.out.println("已经连接到新创建的数据库:"+database);
				}
			}
		}catch(Exception e2){
			e2.printStackTrace();
		}
		return conn;
	}
}
