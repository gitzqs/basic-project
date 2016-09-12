package com.basic.dao.normal;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.basic.dao.base.IBaseMapper;
import com.basic.model.normal.NormalAddress;

public interface INormalAddressMapper extends IBaseMapper<NormalAddress>{
	
	/**
	 * 根据level 或者belongToLevel 查询
	 * 
	 * @param 
	 * @return List<NormalAddress>
	 */
	@Transactional
	List<Map<String,Object>> loadByParam(Map<String,Object> params);
}
