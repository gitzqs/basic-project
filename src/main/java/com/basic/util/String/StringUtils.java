package com.basic.util.String;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * 
 * @author qiushi.zhou  
 * @date 2016年8月26日 下午4:50:16
 */
public class StringUtils {
	
	public static final String EMPTY = "";
	
	/**
	 * 判断是否为字符串是否为空
	 * 
	 * @param 
	 * @return boolean
	 */
	public static boolean isEmpty(String value){
		
		return value==null || value.length()==0 || "".equals(value);
	}
	/**
	 * string to list
	 * 
	 * @param 如"a,b,"
	 * @return List<String>
	 */
	public static List<String> stringToList(String value){
		List<String> list = new ArrayList<String>();
		String temp[] = value.split(",");
		for(int i=0; i<temp.length; i++){
			list.add(temp[i]);
		}
		return list;
	}
	
}
