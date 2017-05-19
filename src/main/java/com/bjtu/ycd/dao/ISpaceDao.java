package com.bjtu.ycd.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bjtu.ycd.vo.Space;

@MapperScan
public interface ISpaceDao {
	public int insertBuVo(Space space);
	public List<Space> getSpaceByVo(Space space);
	public int updateById(Space space);
	public int deleteById(Space space);
}
