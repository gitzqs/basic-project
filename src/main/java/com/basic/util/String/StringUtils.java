package com.basic.util.String;
/**
 * 
 * 
 * @author qiushi.zhou  
 * @date 2016年8月26日 下午4:50:16
 */
public class StringUtils {
	
	public static final String EMPTY = null;
	
	/**
	 * 判断是否为字符串是否为空
	 * 
	 * @param 
	 * @return boolean
	 */
	public static boolean isEmpty(String value){
		
		return value==null || value.length()==0 || "".equals(value);
	}
	
}
