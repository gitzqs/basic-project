package com.basic.service.sys.user.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.dao.sys.user.ISysUserMapper;
import com.basic.model.sys.user.SysUser;
import com.basic.service.sys.user.ISysUserService;
import com.basic.util.json.JacksonUtils;
@Service("sysUserService")
public class DefaultSysUserServiceImpl implements ISysUserService {
	
	@Autowired
	private ISysUserMapper sysUserMapper;
	
	@SuppressWarnings("unchecked")
	@Override
	public String page(Map<String, Object> params) {
		//当offset跟rows出现没有值的情况，赋值默认
		params.put("offset", Integer.parseInt((params.get("offset")==null ? '0' : params.get("offset")).toString()));
		params.put("rows", Integer.parseInt((params.get("rows")==null ? '5' : params.get("rows")).toString()));
		
		List<Map<String,Object>> rows = (List<Map<String,Object>>)sysUserMapper.page(params);
		Long total = sysUserMapper.total(params);
		params.clear();
		params.put("rows", rows);
		params.put("total", total);
		
		return JacksonUtils.object2json(params);
	}

	@Override
	public Long total(Map<String, Object> params) {
		return sysUserMapper.total(params);
	}

	@Override
	public SysUser loadByUsername(String username) {
		return sysUserMapper.loadByUsername(username);
	}

}
