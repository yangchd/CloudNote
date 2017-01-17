package com.bjtu.ycd.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.ILoginService;
import com.bjtu.ycd.util.Tool;
import com.bjtu.ycd.vo.User;


@Controller
@RequestMapping("/login")
public class LoginController {  
	
	@Resource
	private User user;
	
	@Resource
	private ILoginService loginService;
    
    @RequestMapping(value="/getLogin",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getLogin(User loginuser){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	Logger logger = Logger.getLogger(LoggerUtil.class);
    	logger.info("login/getLogin请求-- username:"+loginuser.getUsername()+"and password:"+loginuser.getPassword()+"\r\n");
    	
    	if(loginuser.getUsername()==null||"".equals(loginuser.getUsername())){
    		rMap.put("retflag", "1");
    		rMap.put("msg", "请输入用户名");
    		return rMap;
    	}
    	if(loginuser.getPassword()==null||"".equals(loginuser.getPassword())){
    		rMap.put("retflag", "1");
    		rMap.put("msg", "请输入密码");
    		return rMap;
    	}
    	user.setPassword(loginuser.getPassword());
    	int loginFlag = 0;//用户参数标志位，0代表不是邮箱也不是手机号，登录失败，1代表进行登录操作
    	if (Tool.isEmail(loginuser.getUsername())) {
			user.setEmail(loginuser.getUsername());
			loginFlag = 1;
		}else if(Tool.isMobile(loginuser.getUsername())){
			user.setMobile(loginuser.getUsername());
			loginFlag = 1;
		}
    	
    	if(loginFlag==0){
    		rMap.put("retflag", "1");
    		rMap.put("msg", "输入的用户名格式错误!");
    		return rMap;
    	}
    	
    	User reuser = loginService.getUserByName(user);
    	if(reuser==null||"".equals(reuser)){
    		rMap.put("retflag", "1");
    		rMap.put("msg", "输入的用户不存在，请确认！");
    		return rMap;
    	}else{
    		//进行密码判断
    		if(reuser.getPassword().equals(user.getPassword())){
    			//进行登录操作
        		rMap.put("retflag", "0");
        		rMap.put("msg", "登录成功");
        		return rMap;
    		}else{
        		rMap.put("retflag", "1");
        		rMap.put("msg", "密码错误，请重新输入！");
        		return rMap;
    		}
    	}
    }
}  