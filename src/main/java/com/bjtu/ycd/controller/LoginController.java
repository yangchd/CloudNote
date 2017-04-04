package com.bjtu.ycd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	private LoggerUtil logger;
	
	@Resource
	private Tool tool;
	
	@Resource
	private ILoginService loginService;
    
    @RequestMapping(value="/getLogin",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getLogin(User loginuser){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	logger.info("用户["+loginuser.getUsername()+"]发起登陆请求 密码["+loginuser.getPassword()+"]\r\n");
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
    	
    	int loginflag = 0;
    	if (tool.isEmail(loginuser.getUsername())) {
			user.setEmail(loginuser.getUsername());
			loginflag = 1;
		}else if(tool.isMobile(loginuser.getUsername())){
			user.setMobile(loginuser.getUsername());
			loginflag = 1;
		}
    	if(loginflag==0){
    		rMap.put("retflag", "1");
    		rMap.put("msg", "输入的用户名有误，请确认！");
    		return rMap;
    	}
    	
    	
    	List<User> reuser = loginService.getUserByName(user);
    	if(reuser==null||reuser.size()==0){
    		rMap.put("retflag", "1");
    		rMap.put("msg", "输入的用户不存在，请确认！");
    		return rMap;
    	}else{
    		//进行密码判断
    		if(reuser.get(0).getPassword().equals(user.getPassword())){
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