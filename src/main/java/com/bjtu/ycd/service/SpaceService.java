package com.bjtu.ycd.service;

import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.bjtu.ycd.vo.Space;
import com.bjtu.ycd.vo.User;

@MapperScan
public interface SpaceService {
	int createSpace(Space space);
	Map<String,Object> getTreeById(User user);
	int updateById(Space space);
	int deleteById(Space space);
}
