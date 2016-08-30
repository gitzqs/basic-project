package com.basic.service.sys.role.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.dao.sys.role.ISysRoleMapper;
import com.basic.model.base.ReturnData;
import com.basic.model.sys.role.SysRole;
import com.basic.service.sys.role.ISysRoleService;
import com.basic.util.String.StringUtils;
import com.basic.util.json.JacksonUtils;
@Service("sysRoleService")
public class DefaultSysRoleServiceImpl implements ISysRoleService {
	
	private static final Logger logger = LoggerFactory.getLogger(DefaultSysRoleServiceImpl.class);
	
	@Autowired
	private ISysRoleMapper sysRoleMapper;
	
	@SuppressWarnings("unchecked")
	@Override
	public String page(Map<String, Object> params) {
		//当offset跟rows出现没有值的情况，赋值默认
		params.put("offset", Integer.parseInt((params.get("offset")==null ? '0' : params.get("offset")).toString()));
		params.put("rows", Integer.parseInt((params.get("rows")==null ? '5' : params.get("rows")).toString()));
		List<Map<String, Object>> rows = (List<Map<String, Object>>) sysRoleMapper
				.page(params);
		Long total = sysRoleMapper.total(params);
		params.clear();
		params.put("rows", rows);
		params.put("total", total);

		return JacksonUtils.object2json(params);
	}

	@Override
	public Long total(Map<String, Object> params) {
		
		return sysRoleMapper.total(params);
	}

	@Override
	public String  addRoleOperation(Map<String, Object> params) {
		
		Map<String,Object> returnParams = new HashMap<String,Object>();
		String returnCode = ReturnData.SUCCESS_CODE;
		String returnMsg = "新增角色成功";
		
		//1、获取参数
		String code = params.get("code")==null ? StringUtils.EMPTY : params.get("code").toString();
		String name = params.get("name")==null ? StringUtils.EMPTY : params.get("name").toString();
		String description = params.get("description")==null ? StringUtils.EMPTY : params.get("description").toString();
		
		//2、验证code、name是否为空
		if(!StringUtils.isEmpty(code) && !StringUtils.isEmpty(name)){
			//3、验证code是否唯一
			params.clear();
			params.put("code", code);
			params.put("status", "ENABLED");
			int index = sysRoleMapper.judgeOnlyByCodeOrName(params);
			if(index == 0){
				//4、验证那么是否唯一
				params.clear();
				params.put("name", name);
				params.put("status", "ENABLED");
				index = sysRoleMapper.judgeOnlyByCodeOrName(params);
				if(index == 0){
					//5、新增
					try{
						SysRole role = new SysRole();
						role.setCode(code);
						role.setName(name);
						role.setDescription(description);
						
						sysRoleMapper.save(role);
					}catch(Exception e){
						returnCode = ReturnData.FAIL_CODE;
						returnMsg = "新增失败";
						logger.error("request parameters : code : {},name : {},with error message : \n\t {}",
								new Object[]{code,name,e.getLocalizedMessage()});
					}
				}else{
					returnCode = ReturnData.DATA_EXIST_CODE;
					returnMsg = "角色名称已经存在";
				}
			}else{
				returnCode = ReturnData.DATA_EXIST_CODE;
				returnMsg = "角色编码已经存在";
			}
		}else{
			returnCode = ReturnData.EMPTY_PARAMETER_CODE;
			returnMsg = ReturnData.EMPTY_PARAMETER_MSG;
		}
		returnParams.put("returnCode", returnCode);
		returnParams.put("returnMsg", returnMsg);
		return JacksonUtils.object2json(returnParams);
	}

}
