package com.bjtu.ycd.service;

import org.mybatis.spring.annotation.MapperScan;
import com.bjtu.ycd.vo.User;

@MapperScan
public interface ILoginService {
	User getUserByName(User user);
}
