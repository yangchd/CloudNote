package com.bjtu.ycd.service;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bjtu.ycd.vo.NoteBook;

@MapperScan
public interface NoteBookService {
	int createBook(NoteBook book);
	List<NoteBook> getBookByVo(NoteBook book);
	int updateById(NoteBook book);
	int deleteById(NoteBook book);
	List<NoteBook> getBookByKey(String key);
	List<NoteBook> getBookQuickList(NoteBook book);
}
