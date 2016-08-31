package com.basic.aop.database;

import java.util.Map;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import com.basic.model.database.UserDatabase;
import com.basic.service.database.IUserDatabaseService;
import com.basic.util.String.StringUtils;

public class DynamicDataSource extends AbstractRoutingDataSource{
	
	public  static String DEFAULT_DATA_SOURCE = "dataSource_1";
	private Map<Object,Object> _targetDataSources;
	
	@Autowired
	private static IUserDatabaseService userDatabaseService; 
	
	@Override
	protected Object determineCurrentLookupKey() {
		String dataSourceName = DBContextHolder.getDbType();
		if(StringUtils.isEmpty(dataSourceName)){
			dataSourceName = DEFAULT_DATA_SOURCE;
		}else{
			if(!dataSourceName.equals(DEFAULT_DATA_SOURCE)){
				this.selectDataSource(dataSourceName);
			}
		}
		return dataSourceName;
	}
	
	
	public void setTargetDataSources(Map<Object, Object> targetDataSources) {
        this._targetDataSources = targetDataSources;
        super.setTargetDataSources(this._targetDataSources);
        afterPropertiesSet();
    }
 
    public void addTargetDataSource(String key, BasicDataSource dataSource) {
        this._targetDataSources.put(key, dataSource);
        this.setTargetDataSources(this._targetDataSources);
    }
    
    /**
     * 数据源存在时候，不作处理；
     * 数据源不存在，则新建并将其添加至缓存
     * 
     * @param 
     * @return void
     */
    public void selectDataSource(String  dataSourceName) {
    	
        Object obj = this._targetDataSources.get(dataSourceName);
        if(null == obj){
        	BasicDataSource dataSource = this.getDataSource(dataSourceName);
        	if(null != dataSource){
        		this.setDataSource(dataSourceName, dataSource);
        	}
        }
    }
    
    /**
     * 创建数据源
     * 
     * @param 
     * @return BasicDataSource
     */
    public BasicDataSource createDataSource(String driverClassName, String url,
            String username, String password) {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.setTestWhileIdle(true);
        return dataSource;
    }
    
   
    
    /**
     * 设置数据源并连接
     * 
     * @param 
     * @return void
     */
    public void setDataSource(String userId, BasicDataSource dataSource) {
        this.addTargetDataSource(userId, dataSource);
        DBContextHolder.setDbType(userId);
    }
    
    /**
     * 创建连接
     * 
     * @param 
     * @return BasicDataSource
     */
    public BasicDataSource getDataSource(String userId) {
    	BasicDataSource dataSource = null;
    	UserDatabase database = (UserDatabase) SecurityUtils.getSubject().getSession().getAttribute("database");
    	if(database !=null){
    		dataSource = this.createDataSource(database.getDatabaseDriver(), database.getDatabaseUrl(), 
    				database.getDatabaseUser(), database.getDatabasePassword());
    	}
        return dataSource;
    }
	
}
