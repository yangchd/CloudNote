package com.bjtu.ycd.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bjtu.ycd.dao.IUserDao;
import com.bjtu.ycd.service.ILoginService;
import com.bjtu.ycd.vo.User;


@Service("loginService")
public class LoginServiceImpl implements ILoginService {

	@Resource  
    private IUserDao userDao;  

	@Override
	public User getUserByName(User user) {
		return this.userDao.getUserByName(user);
	}


}
