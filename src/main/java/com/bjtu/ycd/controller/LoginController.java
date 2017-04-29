package com.bjtu.ycd.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.UserService;
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
	private UserService userService;
    
    @RequestMapping(value="/getLogin",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getLogin(User loginuser,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	logger.info("用户["+loginuser.getUsername()+"]发起登陆请求\r\n");
    	
    	//先进行非空判断
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
    	
    	//进行格式判断
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
    	
    	
    	List<User> reuser = userService.getUserByName(user);
    	if(reuser==null||reuser.size()==0){
    		//未注册
    		rMap.put("retflag", "1");
    		rMap.put("msg", "用户名或密码错误！");
    		return rMap;
    	}else{
    		//进行密码判断
    		if(reuser.get(0).getPassword().equals(user.getPassword())){
    			//进行登录操作
    			httpSession.setAttribute("userid", reuser.get(0).getId());
    			httpSession.setAttribute("username", reuser.get(0).getUsername());
        		rMap.put("retflag", "0");
        		rMap.put("msg", "登录成功");
        		return rMap;
    		}else{
        		rMap.put("retflag", "1");
        		rMap.put("msg", "用户名或密码错误！");
        		return rMap;
    		}
    	}
    }
    
    @RequestMapping(value="/getSession",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getSession(User loginuser,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	String userid = httpSession.getAttribute("userid")==null?"":httpSession.getAttribute("userid").toString();
    	String username = httpSession.getAttribute("username")==null?"":httpSession.getAttribute("username").toString();
    	if(!"".equals(userid) && !"".equals(username)){
    		rMap.put("retflag", "0");
    		rMap.put("userid", userid);
    		rMap.put("username", username);
    		rMap.put("msg", "session获取成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "session获取失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/setSession",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> setSession(String sessionname,String value,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	httpSession.setAttribute(sessionname, value);
    	rMap.put("retflag", "0");
		rMap.put("msg", "session设置成功");
    	return rMap;
    }
    
    @RequestMapping(value="/getSessionByName",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getSessionByName(String sessionname,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	rMap.put("retflag", "0");
    	rMap.put("sessionvalue", httpSession.getAttribute(sessionname));
		rMap.put("msg", "session获取成功");
    	return rMap;
    }
    
    @RequestMapping(value="/logout",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> logOut(User loginuser,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	Enumeration<String> em = httpSession.getAttributeNames();
    	while(em.hasMoreElements()){
    		httpSession.removeAttribute(em.nextElement().toString());
    	}
    	rMap.put("retflag", "0");
    	rMap.put("msg", "注销成功");
    	return rMap;
    }
}  