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
    public Map<String, Object> getLogin(User user){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	Logger log = Logger.getLogger(LoggerUtil.class);
    	
    	User reuser = loginService.getUserByName(user);
    	
    	rMap.put("user", reuser);
    	return rMap;
    }
}  