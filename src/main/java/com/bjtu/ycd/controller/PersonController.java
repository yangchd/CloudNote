package com.bjtu.ycd.controller;

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
@RequestMapping("/person")
public class PersonController {  
	
	@Resource
	private User user;

	@Resource
	private LoggerUtil logger;
	
	@Resource
	private Tool tool;
	
	@Resource
	private UserService userService;
    
    @RequestMapping(value="/getPersonValue",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getPerson(User person){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	List<User> reuser = userService.getUserByName(person);
    	if(reuser!=null&&reuser.size()>0){
    		rMap.put("retflag", "0");
    		rMap.put("person", reuser.get(0));
    		rMap.put("msg", "个人信息获取成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "session获取失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/update",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> updatePerson(User update,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	try {
			String username = new String(update.getUsername().getBytes("iso-8859-1"),"utf-8");
			update.setUsername(username);
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
    	int result = userService.updateById(update);
    	
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "修改成功");
    		httpSession.setAttribute("username", update.getUsername());
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "修改失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/updatePwd",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> updatePwd(User update){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	int result = userService.updateById(update);
    	
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "修改成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "修改失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/search",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> searchByMsg(String search){
    	
    	try {
    		search = new String(search.getBytes("iso-8859-1"),"utf-8");
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
    	
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	List<User> list = userService.getSearchList(search);
    	
    	if(list!=null&&list.size()>0){
    		rMap.put("retflag", "0");
    		rMap.put("list", list);
    		rMap.put("msg", "修改成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "修改失败");
    	}
    	return rMap;
    }

}  