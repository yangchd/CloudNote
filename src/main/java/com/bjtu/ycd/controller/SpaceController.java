package com.bjtu.ycd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.SpaceService;
import com.bjtu.ycd.service.UserService;
import com.bjtu.ycd.vo.Space;
import com.bjtu.ycd.vo.User;

@Controller
@RequestMapping("/spaceController")
public class SpaceController {

	@Resource
	private Space space;
	
	@Resource
	private LoggerUtil logger;
	
	@Resource
	private SpaceService spaceService;
	
	@Resource
	private UserService userService;
	
    @RequestMapping(value="/createspace",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> createSpace(Space createspace){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	String spaceid = UUID.randomUUID().toString();
    	createspace.setSpaceid(spaceid);
    	
    	try {
			String spacename = new String(createspace.getSpacename().getBytes("iso-8859-1"),"utf-8");
			createspace.setSpacename(spacename);
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	createspace.setCreatetime(sdf.format(new Date()));
    	
    	int result = spaceService.createSpace(createspace);
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "创建成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "创建失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/update",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> updateSpace(Space space){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	try {
			String spacename = new String(space.getSpacename().getBytes("iso-8859-1"),"utf-8");
			space.setSpacename(spacename);
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
    	int result = spaceService.updateById(space);
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "修改成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "修改失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> deleteSpace(Space space){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	int result = spaceService.deleteById(space);
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "删除成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "删除失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/gettree",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getTreeById(User user,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	String spaceid = user.getSpaceid();
    	if(spaceid==null||"".equals(spaceid)){
    		user.setId(httpSession.getAttribute("userid").toString());
    		List<User> usertree = userService.getUserByName(user);
    		user.setSpaceid(usertree.get(0).getSpaceid());
    	}else{
    		user.setSpaceid(spaceid);
    	}
    	Map<String,Object> treeMap = spaceService.getTreeById(user);
    	JSONObject obj = new JSONObject(treeMap);
    	String treearr = obj.getJSONArray("tree").toString();
    	if(treeMap!=null){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "树获取成功");
    		rMap.put("tree", treearr);
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "session获取失败");
    	}
    	return rMap;
    }
}
