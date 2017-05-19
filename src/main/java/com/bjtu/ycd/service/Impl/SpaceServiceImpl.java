package com.bjtu.ycd.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bjtu.ycd.dao.ISpaceDao;
import com.bjtu.ycd.service.SpaceService;
import com.bjtu.ycd.vo.Space;
import com.bjtu.ycd.vo.User;

@Service("spaceService")
public class SpaceServiceImpl implements SpaceService {
	
	@Resource
	private ISpaceDao spacedao;

	@Override
	public int createSpace(Space space) {
		return this.spacedao.insertBuVo(space);
	}

	@Override
	public Map<String,Object> getTreeById(User user) {
		Space space = new Space();
		space.setSpaceid(user.getSpaceid());
		List<Space> list = this.spacedao.getSpaceByVo(space);
		
		List<Map<String,Object>> mlist = new ArrayList<>();
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("id", list.get(0).getSpaceid());
		rMap.put("name", list.get(0).getSpacename());
		mlist.add(rMap);
		mlist = buildtree(mlist);
		
		Map<String,Object> jsMap = new HashMap<>();
		jsMap.put("tree", mlist);
		
		return jsMap;
	}
	
	
	//写一个递归来组装树
	public List<Map<String,Object>> buildtree(List<Map<String,Object>> tree){
		Space space = new Space();
		List<Space> list = new ArrayList<>();

		for(int i=0;i<tree.size();i++){
			String spaceid = tree.get(i).get("id")==null?"":tree.get(i).get("id").toString();
			if(spaceid!=null&&!"".equals(spaceid)){
				space.setParentid(spaceid);
				list = this.spacedao.getSpaceByVo(space);
				if(list!=null&&list.size()>0){
					//如果还有子节点
					List<Map<String,Object>> mlist = new ArrayList<>();
					for(int j=0;j<list.size();j++){
						Map<String,Object> rMap = new HashMap<>();
						rMap.put("id", list.get(j).getSpaceid());
						rMap.put("name", list.get(j).getSpacename());
						mlist.add(rMap);
					}
					mlist = buildtree(mlist);
					tree.get(i).put("children", mlist);
				}else{
					//没有子节点
				}
			}
		}
		return tree;
	}

	@Override
	public int updateById(Space space) {
		return this.spacedao.updateById(space);
	}

	@Override
	public int deleteById(Space space) {
		return this.spacedao.deleteById(space);
	}

}
