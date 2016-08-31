package com.basic.service.database.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.dao.database.IUserDatabaseMapper;
import com.basic.model.database.UserDatabase;
import com.basic.service.database.IUserDatabaseService;
@Service("userDatabaseService")
public class DefultUserDatabaseServiceImpl implements IUserDatabaseService {
	
	@Autowired
	private IUserDatabaseMapper userDatabaseMapper;
	
	@Override
	public String page(Map<String, Object> params) {
		return null;
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
