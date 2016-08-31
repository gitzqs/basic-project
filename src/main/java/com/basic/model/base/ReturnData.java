package com.basic.model.base;
/**
 * 返回数据code以及msg
 * 
 * @author qiushi.zhou  
 * @date 2016年8月30日 上午10:28:29
 */
public interface ReturnData {
	
	/** 处理成功**/
	String SUCCESS_CODE = "0000";
	
	String SUCCESS_MSG = "处理成功";
	
	/** 处理失败**/
	String FAIL_CODE = "1111";
	
	String FAIL_MSG = "处理失败";
	
	/** 参数为空**/
	String EMPTY_PARAMETER_CODE = "0001";
	
	String EMPTY_PARAMETER_MSG = "参数为空";
	
	/** 数据已存在 **/
	String DATA_EXIST_CODE = "0002";
	
	String DATA_EXIST_MSG = "数据已经存在";
}