package com.bjtu.ycd.service.Impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bjtu.ycd.dao.IUserDao;
import com.bjtu.ycd.service.IUserService;
import com.bjtu.ycd.vo.User;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Resource  
    private IUserDao userDao;  
	
	@Override
	public User getUserByName(User user) {
		System.out.println("service");
		return this.userDao.getUserByName(user);
	}
	
	
}