package com.bjtu.ycd.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.SpaceService;
import com.bjtu.ycd.service.UserService;
import com.bjtu.ycd.vo.Space;
import com.bjtu.ycd.vo.User;

@Controller
@RequestMapping("/register")
public class RegisterController {


	@Resource
	private User user;
	
	@Resource
	private LoggerUtil logger;
	
	@Resource
	private UserService userService;
	
	@Resource
	private SpaceService spaceService;
    
	
	/**
	 * 检验是否存在重复函数
	 * @param loginuser
	 * @return
	 */
    @RequestMapping(value="/repeat",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getRepeat(User loginuser){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	List<User>  reuser = new ArrayList<User>();
    	user = loginuser;
    	
    	//密码判断
    	if(loginuser.getId()!=null&&loginuser.getPassword()!=null){
    		reuser = userService.getUserByName(user);
    		if(reuser!=null&&reuser.size()>0){
    			rMap.put("retflag", "0");
    			rMap.put("msg", "通过验证！");
    			return rMap;
    		}else{
    			rMap.put("retflag", "1");
    			rMap.put("msg", "oldpassword");
    			return rMap;
    		}
    	}
    	
    	try {
    		if(loginuser.getUsername()!=null&&!"".equals(loginuser.getUsername())){
    			String username = new String(loginuser.getUsername().getBytes("iso-8859-1"),"utf-8");
    			user.setUsername(username);
    		}
		} catch (UnsupportedEncodingException e) {
			logger.info(e.getMessage());
		}
    	//先校验正确性
    	String check = userService.isEmailOrMobile(user);
    	//没有格式问题，则进行重复校验
    	if(check==null||"".equals(check)){
    		reuser = userService.getUserByName(user);
    		if(reuser==null||"".equals(reuser)||reuser.size()==0){
    			rMap.put("retflag", "0");
    			rMap.put("msg", "通过验证！");
    			return rMap;
    		}else{
    			rMap.put("retflag", "1");
    			rMap.put("msg", "已经被注册！");
    			return rMap;
    		}
    	}else{
    		if("email".equals(check)){
    			rMap.put("retflag", "1");
    			rMap.put("msg", "email");
    			return rMap;
    		}else{
    			rMap.put("retflag", "1");
    			rMap.put("msg", "mobile");
    			return rMap;
    		}
    	}
    	
    }
    
    /**
     * 注册用户函数
     * @param loginuser
     * @return
     */
    @RequestMapping(value="/insert",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> insertRegister(User loginuser){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	String spaceid = UUID.randomUUID().toString();
		Space space = new Space();
		space.setSpaceid(spaceid);
		space.setSpacename("默认空间");
    	int result = spaceService.createSpace(space);
    	if(result>0){
    		user = loginuser;
        	user.setId(UUID.randomUUID().toString());
        	user.setSpaceid(spaceid);
        	try {
        		String username = new String(loginuser.getUsername().getBytes("iso-8859-1"),"utf-8");
        		user.setUsername(username);
    		} catch (UnsupportedEncodingException e) {
    			logger.info(e.getMessage());
    		}
        	int i = userService.insertByUser(user);
        	if(i>0){
        		rMap.put("retflag", "0");
        		rMap.put("msg", "注册成功！");
        		return rMap;
        	}else{
           		rMap.put("retflag", "1");
        		rMap.put("msg", "注册失败！");
        		return rMap;
        	}
    	}else{
       		rMap.put("retflag", "1");
    		rMap.put("msg", "空间建立失败！");
    		return rMap;
    	}
    }
}
