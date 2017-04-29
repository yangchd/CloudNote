package com.bjtu.ycd.service;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bjtu.ycd.vo.Query;

@MapperScan
public interface QueryService {

	List<Query> getQueryByVo(Query query);

	int updateById(Query query);

	int insertByVo(Query query);
}
