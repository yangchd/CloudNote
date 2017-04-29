package com.bjtu.ycd.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bjtu.ycd.vo.Query;

@MapperScan
public interface IQueryDao {

	List<Query> getQueryByVo(Query query);

	int updateById(Query query);

	int insertByVo(Query query);

}
