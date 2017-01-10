package com.bjtu.ycd.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjtu.ycd.dao.IUserDao;
import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.IUserService;
import com.bjtu.ycd.vo.User;
  
@Controller
@RequestMapping("/test")
public class UserController {  
	
	@Resource
	private User user;
	
	@Resource
	private IUserService userService;
      
    @RequestMapping(value="/hello",method=RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> hello(){  
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	rMap.put("helloworld", "lalalalallalal");
        return rMap;  
    }
    
    
    @RequestMapping("/getUser")
    @ResponseBody
    public Map<String, Object> getMsg(){
    	user.setUsername("test");
    	User reuser = userService.getUserByName(user);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("user", reuser);
    	Logger log = Logger.getLogger(LoggerUtil.class);
    	log.info("lalalalalalala");
    	return map;
    }
}  