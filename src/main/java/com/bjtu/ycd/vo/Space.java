package com.bjtu.ycd.vo;

import org.springframework.stereotype.Component;

@Component
public class Space {
	private String spaceid;
	private String spacename;
	private String createtime;
	private String edittime;
	private String parentid;
	public String getSpaceid() {
		return spaceid;
	}
	public void setSpaceid(String spaceid) {
		this.spaceid = spaceid;
	}
	public String getSpacename() {
		return spacename;
	}
	public void setSpacename(String spacename) {
		this.spacename = spacename;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getEdittime() {
		return edittime;
	}
	public void setEdittime(String edittime) {
		this.edittime = edittime;
	}
	public String getParentid() {
		return parentid;
	}
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
}
