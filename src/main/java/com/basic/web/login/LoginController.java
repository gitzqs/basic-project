package com.basic.web.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.basic.util.http.HttpRequestInfoUtil;
import com.basic.util.json.JacksonUtils;

/**
 * 登录
 * 
 * @author qiushi.zhou  
 * @date 2016年8月23日 下午2:15:03
 */
@Controller
@RequestMapping(value="login")
public class LoginController {
	
	 private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * 登录页面
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String login(){
		return "login/login";
	}
	
	/**
	 * 登录验证
	 * 
	 * @param 
	 * @return String
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public String loginValidate(String username,String password,HttpServletRequest request){
		//将密码进行md5加密
		password = DigestUtils.md5Hex(password==null ? StringUtils.EMPTY_STRING : password);
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		//注销当前用户
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		
		if(!currentUser.isAuthenticated()){
			UsernamePasswordToken token = new UsernamePasswordToken(username,password,false,HttpRequestInfoUtil.getRemoteAddr(request));
			try{
				currentUser.login(token);
			}catch(AuthenticationException ex){
				logger.warn("catch AuthenticationException: [{}]", ex.getLocalizedMessage());
				result.put("status", "fail");
				return JacksonUtils.object2json(result);
			}
			
		}else{
			logger.info("user [{}] already login.",username);
		}
		result.put("status", "success");
		return JacksonUtils.object2json(result);
	}
	
	@RequestMapping(value="/test")
	public String test(){
		return "index";
	}
	
	@RequestMapping(value="/welcome")
	public String welcome(){
		return "welcome/welcome";
	}
	
}
