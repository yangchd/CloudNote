package com.bjtu.ycd.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import com.bjtu.ycd.vo.User;

@MapperScan
public interface IUserDao {
	public List<User> getUserByName(User user);
	public int insertByUser(User user);
	public int updateById(User user);
	public List<User> getSearchList(String search);
	public List<User> getNamesByIds(List<String> idlist);
}
