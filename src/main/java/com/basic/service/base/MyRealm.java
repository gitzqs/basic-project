package com.basic.service.base;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.basic.model.sys.user.SysUser;
import com.basic.model.sys.userRole.SysUserRole;
import com.basic.service.sys.user.ISysUserService;
import com.basic.service.sys.userRole.ISysUserRoleService;
/**
 * shiro权限、登录认证
 * 
 * @author qiushi.zhou  
 * @date 2016年8月24日 上午9:30:53
 */
@Service("myRealm")
public class MyRealm extends AuthorizingRealm{
	
	@Autowired
	ISysUserRoleService sysUserRoleService;
	@Autowired
	ISysUserService sysUserService;
	
	/**
	 * 权限认证
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		//获取用户名
		String username = (String) principals.fromRealm(getName())
				.iterator().next();
		//根据用户名查询用户
		SysUser user = sysUserService.loadByUsername(username);
		if(user != null){
			//根据用户名查询用户所属角色
			SysUserRole userRole = sysUserRoleService.loadByUsername(username);
			if(userRole !=null){
				//将用户角色存放于SimpleAuthorizationInfo中
				SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
				Set<String> role = new HashSet<String>();
				role.add(userRole.getRole().getName());
				info.setRoles(role);
				return info;
			}
		}
		return null;
	}
	
	/**
	 * 登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken anthenticationToken) throws AuthenticationException {
		//基于登录名、密码的令牌
		UsernamePasswordToken token = (UsernamePasswordToken) anthenticationToken;
		//用户存在，获取用户信息
		if(!StringUtils.isEmpty(token.getUsername())){
			SysUser user = sysUserService.loadByUsername(token.getUsername());
			if(user != null){
				//将id跟username放于session中，以便其他地方使用
				this.setSession("LOGIN_ID", user.getId());
				this.setSession("LOGIN_NAME", user.getUsername());
				
				//创建认证信息
				return new SimpleAuthenticationInfo(user.getUsername(),
						user.getPassword(),getName());
			}
		}
		
		return null;
	}
	
	@Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }
    /**
     * 清除所有缓存
     * 
     * @param 
     * @return void
     */
    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }
    
    /**
     * 将一些数据放于shirosession中
     * 
     * @param 
     * @return void
     */
    private void setSession(Object key, Object value){  
        Subject currentUser = SecurityUtils.getSubject();  
        if(null != currentUser){  
            Session session = currentUser.getSession();  
            if(null != session){  
                session.setAttribute(key, value);  
            }  
        }  
    } 
}
