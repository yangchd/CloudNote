package com.bjtu.ycd.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.ILoginService;
import com.bjtu.ycd.vo.User;

@Controller
@RequestMapping("/register")
public class RegisterController {


	@Resource
	private User user;
	
	@Resource
	private ILoginService loginService;
    
    @RequestMapping(value="/repeat",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getLogin(User loginuser){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	Logger logger = Logger.getLogger(LoggerUtil.class);
//    	String email = loginuser.getEmail();
//    	String mobile = loginuser.getMobile();
    	
    	user = loginuser;
    	
    	User reuser = loginService.getUserByName(user);
    	
    	if(reuser==null||"".equals(reuser)){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "通过验证！");
    		return rMap;
    	}else{
    		//如果查到数据，说明已经被注册
    		rMap.put("retflag", "1");
    		rMap.put("msg", "已经被注册！");
    		return rMap;
    	}
    }
    
    @RequestMapping(value="/insert",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> insertRegister(User loginuser){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	user = loginuser;
    	user.setId(UUID.randomUUID().toString());
    	
    	int i = loginService.insertByUser(user);
    	
    	if(i>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "注册成功！");
    		return rMap;
    	}else{
       		rMap.put("retflag", "1");
    		rMap.put("msg", "注册失败！");
    		return rMap;
    	}
    }
	
}
