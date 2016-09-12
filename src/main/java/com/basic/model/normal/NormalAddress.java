package com.basic.model.normal;

import com.basic.model.base.REntity;

/**
 * 地址
 * 
 * @author qiushi.zhou  
 * @date 2016年9月7日 下午12:43:58
 */
public class NormalAddress extends REntity{

	private static final long serialVersionUID = -2864539993457803647L;
	
	/** 级别**/
	private Long level;
	
	/** 名称**/
	private String name;
	
	/** 所属id**/
	private Long belongToLevel;

	public Long getLevel() {
		return level;
	}

	public void setLevel(Long level) {
		this.level = level;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getBelongToLevel() {
		return belongToLevel;
	}

	public void setBelongToLevel(Long belongToLevel) {
		this.belongToLevel = belongToLevel;
	}
	
	
}
