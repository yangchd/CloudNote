package com.bjtu.ycd.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bjtu.ycd.vo.NoteBook;
import com.bjtu.ycd.vo.Team;

@MapperScan
public interface ITeamDao {
	
	int insertByVo(Team team);

	List<Team> getTeamByVo(Team team);

	int updateById(Team team);

	int deleteById(Team team);

	List<Team> getTeamByUserId(String userid);
}
