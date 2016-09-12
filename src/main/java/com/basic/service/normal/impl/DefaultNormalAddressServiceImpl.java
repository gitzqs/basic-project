package com.basic.service.normal.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.dao.normal.INormalAddressMapper;
import com.basic.model.base.ReturnData;
import com.basic.service.normal.INormalAddressService;
import com.basic.util.String.StringUtil;
import com.basic.util.json.JacksonUtils;
@Service("normalAddressService")
public class DefaultNormalAddressServiceImpl implements INormalAddressService {
	
	@Autowired
	private INormalAddressMapper normalAddressMapper;
	
	@Override
	public String page(Map<String, Object> params) {
		return null;
	}

	@Override
	public Long total(Map<String, Object> params) {
		return null;
	}

	@Override
	public List<Map<String,Object>> loadByParam(Map<String, Object> params) {
		return normalAddressMapper.loadByParam(params);
	}

	@Override
	public String address_operate(String id) {
		Map<String,Object> returnParams = new HashMap<String,Object>();
		String returnCode = ReturnData.SUCCESS_CODE;
		String returnMsg = "成功";
		List<Map<String,Object>>  addressList = new ArrayList<Map<String,Object>>();
		
		if(!StringUtil.isEmpty(id)){
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("belongToLevel", Long.parseLong(id));
			addressList = normalAddressMapper.loadByParam(params);
		}else{
			returnCode = ReturnData.EMPTY_PARAMETER_CODE;
			returnMsg  = ReturnData.EMPTY_PARAMETER_MSG;
		}
		returnParams.put("addressList", addressList);
		returnParams.put("returnCode", returnCode);
		returnParams.put("returnMsg", returnMsg);
		
		return JacksonUtils.object2json(returnParams);
	}

}
