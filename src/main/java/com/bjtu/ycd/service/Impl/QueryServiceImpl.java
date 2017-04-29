package com.bjtu.ycd.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bjtu.ycd.dao.IQueryDao;
import com.bjtu.ycd.service.QueryService;
import com.bjtu.ycd.vo.Query;

@Service("queryService")
public class QueryServiceImpl implements QueryService {

	@Resource
	private IQueryDao qudao;
	
	@Override
	public List<Query> getQueryByVo(Query query) {
		return this.qudao.getQueryByVo(query);
	}

	@Override
	public int updateById(Query query) {
		return this.qudao.updateById(query);
	}

	@Override
	public int insertByVo(Query query) {
		return this.qudao.insertByVo(query);
	}

}
