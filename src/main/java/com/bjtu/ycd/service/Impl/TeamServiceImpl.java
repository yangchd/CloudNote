package com.bjtu.ycd.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bjtu.ycd.dao.ITeamDao;
import com.bjtu.ycd.dao.IUserDao;
import com.bjtu.ycd.service.TeamService;
import com.bjtu.ycd.vo.NoteBook;
import com.bjtu.ycd.vo.Team;
import com.bjtu.ycd.vo.User;

@Service("teamServide")
public class TeamServiceImpl implements TeamService {
	@Resource
	private ITeamDao teamdao;
	
	@Resource
	private IUserDao userdao;

	@Override
	public int createTeam(Team team) {
		return this.teamdao.insertByVo(team);
	}

	@Override
	public List<Team> getTeamByVo(Team team) {
		List<Team> list = this.teamdao.getTeamByVo(team);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				list.get(i).setLeadername(idToNma(list.get(i).getLeader()));
				list.get(i).setMembername(idToNma(list.get(i).getMember()));
				String createtime = list.get(i).getCreatetime();
				if(createtime!=null&&!"".equals(createtime)){
					list.get(i).setCreatetime(createtime.substring(0, 10));
				}
			}
		}
		return list;
	}

	@Override
	public int updateById(Team team) {
		return this.teamdao.updateById(team);
	}

	@Override
	public int deleteById(Team team) {
		return this.teamdao.deleteById(team);
	}

	@Override
	public List<Team> getTeamByUserId(String userid) {
		List<Team> list = this.teamdao.getTeamByUserId(userid);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				list.get(i).setLeadername(idToNma(list.get(i).getLeader()));
				list.get(i).setMembername(idToNma(list.get(i).getMember()));
				String createtime = list.get(i).getCreatetime();
				if(createtime!=null&&!"".equals(createtime)){
					list.get(i).setCreatetime(createtime.substring(0, 10));
				}
			}
		}
		return list;
	}
	
	public String idToNma(String id){
		StringBuffer names = new StringBuffer();
		if(id!=null&&!"".equals(id)){
			List<String> idlist = new ArrayList<>();
			String[] ids = id.split(",");
			for(int i=0;i<ids.length;i++){
				idlist.add(ids[i]);
			}
			List<User> ulist = userdao.getNamesByIds(idlist);
			for(int m=0;m<ids.length;m++){
				for(int j=0;j<ulist.size();j++){
					if(ids[m].equals(ulist.get(j).getId())){
						names.append(ulist.get(j).getUsername()+",");
					}
				}
			}
			names.deleteCharAt(names.length()-1);
		}else{
			names.append("");
		}
		return names.toString();
	}

}
