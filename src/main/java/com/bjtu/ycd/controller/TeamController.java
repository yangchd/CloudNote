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

import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.SpaceService;
import com.bjtu.ycd.service.TeamService;
import com.bjtu.ycd.vo.Space;
import com.bjtu.ycd.vo.Team;

@Controller
@RequestMapping("/team")
public class TeamController {

	@Resource
	private Team team;
	
	@Resource
	private LoggerUtil logger;
	
	@Resource
	private TeamService teamService;
	
	@Resource
	private SpaceService spaceService;
	
    @RequestMapping(value="/createteam",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> createTeam(Team team,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	//创建小组前先创建一个空间
    	String spaceid = UUID.randomUUID().toString();
		Space space = new Space();
		space.setSpaceid(spaceid);
		
		try {
			String teamname = new String(team.getTeamname().getBytes("iso-8859-1"),"utf-8");
			team.setTeamname(teamname);
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
		
		space.setSpacename("小组："+team.getTeamname());
    	int result = spaceService.createSpace(space);
    	if(result>0){
    		team.setSpaceid(spaceid);
	    	String teamid = UUID.randomUUID().toString();
	    	team.setTeamid(teamid);
	    	String leader = httpSession.getAttribute("userid").toString();
	    	team.setLeader(leader);
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	team.setCreatetime(sdf.format(new Date()));
	    	try {
				String member = new String(team.getMember().getBytes("iso-8859-1"),"utf-8");
				member = member.substring(0, member.length()-1);
				if(member.indexOf(leader)<0){
					member = member+","+leader;
				}
				team.setMember(member);
			} catch (Exception e) {
				logger.info(e.getMessage()+"\r\n");
			}
    	
    		result = teamService.createTeam(team);
	    	if(result>0){
	    		rMap.put("retflag", "0");
	    		rMap.put("msg", "创建成功");
	    	}else{
	    		rMap.put("retflag", "1");
	    		rMap.put("msg", "创建失败");
	    	}
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "创建失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/getteamlist",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getTeamList(String userid){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	List<Team> list = teamService.getTeamByUserId(userid);
    	
    	if(list!=null&&list.size()>0){
    		rMap.put("retflag", "0");
    		rMap.put("list", list);
    		rMap.put("msg", "获取成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "获取失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/getteamvo",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getTeamVo(Team team){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	List<Team> list = teamService.getTeamByVo(team);
    	if(list!=null&&list.size()>0){
    		rMap.put("retflag", "0");
    		rMap.put("list", list);
    		rMap.put("msg", "获取成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "获取失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/update",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> updateBook(Team team,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	try {
    		if(team.getTeamname()!=null){
    			String name = new String(team.getTeamname().getBytes("iso-8859-1"),"utf-8");
    			team.setTeamname(name);
    		}
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
    	//当组长被删掉时，自动将第一个人变成组长
    	if(team.getMember()!=null){
    		team.setMember(team.getMember().substring(0, team.getMember().length()-1));
    		String leader = httpSession.getAttribute("userid").toString();
    		if(team.getMember().indexOf(leader)<0){
    			team.setLeader(team.getMember().split(",")[0]);
    		}
    	}
    	int result = teamService.updateById(team);
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
    public Map<String, Object> deleteTeam(Team team){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	int result = teamService.deleteById(team);
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "删除成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "删除失败");
    	}
    	return rMap;
    }
}
