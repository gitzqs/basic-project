package com.basic.service.database.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.dao.database.IUserDatabaseMapper;
import com.basic.model.database.UserDatabase;
import com.basic.service.database.IUserDatabaseService;
import com.basic.util.json.JacksonUtils;
@Service("userDatabaseService")
public class DefultUserDatabaseServiceImpl implements IUserDatabaseService {
	
	@Autowired
	private IUserDatabaseMapper userDatabaseMapper;
	
	@SuppressWarnings("unchecked")
	@Override
	public String page(Map<String, Object> params) {
		//当offset跟rows出现没有值的情况，赋值默认
		params.put("offset", Integer.parseInt((params.get("offset")==null ? '0' : params.get("offset")).toString()));
		params.put("rows", Integer.parseInt((params.get("rows")==null ? '5' : params.get("rows")).toString()));
		List<Map<String,Object>> rows = (List<Map<String,Object>>)
				userDatabaseMapper.page(params);
		Long total = userDatabaseMapper.total(params);
		params.clear();
		params.put("rows", rows);
		params.put("total", total);
				
		return JacksonUtils.object2json(params);
	}

	@Override
	public Long total(Map<String, Object> params) {
		return userDatabaseMapper.total(params);
	}

	@Override
	public UserDatabase loadByUserId(Long userId) {
		return userDatabaseMapper.loadByUserId(userId);
	}

}
