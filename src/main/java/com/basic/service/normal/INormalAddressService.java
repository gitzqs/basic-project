package com.basic.service.normal;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.basic.service.base.IBaseService;

public interface INormalAddressService extends IBaseService{
	
	/**
	 * 根据level 或者belongToLevel 查询
	 * 
	 * @param 
	 * @return List<NormalAddress>
	 */
	@Transactional
	List<Map<String,Object>> loadByParam(Map<String,Object> params);
	
	/**
	 * 地址处理
	 * 
	 * @param 
	 * @return String
	 */
	@Transactional
	String address_operate(String id);
}
