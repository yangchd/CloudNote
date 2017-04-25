package com.bjtu.ycd.vo;

import org.springframework.stereotype.Component;

@Component
public class NoteBook {
	private String notebookid;
	private String notebookname;
	private String msg;
	private String createtime;
	private String edittime;
	private String spaceid;
	private String flag;
	public String getNotebookid() {
		return notebookid;
	}
	public void setNotebookid(String notebookid) {
		this.notebookid = notebookid;
	}
	public String getNotebookname() {
		return notebookname;
	}
	public void setNotebookname(String notebookname) {
		this.notebookname = notebookname;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
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
	public String getSpaceid() {
		return spaceid;
	}
	public void setSpaceid(String spaceid) {
		this.spaceid = spaceid;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
