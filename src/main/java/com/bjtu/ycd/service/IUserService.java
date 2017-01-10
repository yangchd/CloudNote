package com.bjtu.ycd.service;

import org.mybatis.spring.annotation.MapperScan;

import com.bjtu.ycd.vo.User;

@MapperScan
public interface IUserService {
	public User getUserByName(User user);
}
