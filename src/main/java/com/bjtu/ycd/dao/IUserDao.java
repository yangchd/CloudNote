package com.bjtu.ycd.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.bjtu.ycd.vo.User;

@MapperScan
public interface IUserDao {
	public User getUserByName(User user);
}
