package com.bjtu.ycd.vo;

import org.springframework.stereotype.Component;

@Component
public class Query {
	private String id;
	private String lastread;
	private String keyword;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLastread() {
		return lastread;
	}
	public void setLastread(String lastread) {
		this.lastread = lastread;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
