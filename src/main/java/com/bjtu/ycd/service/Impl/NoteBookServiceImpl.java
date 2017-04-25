package com.bjtu.ycd.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bjtu.ycd.dao.INoteBookDao;
import com.bjtu.ycd.service.NoteBookService;
import com.bjtu.ycd.vo.NoteBook;

@Service("bookService")
public class NoteBookServiceImpl implements NoteBookService {

	@Resource
	private INoteBookDao notebookdao;
	
	@Override
	public int createBook(NoteBook book) {
		return this.notebookdao.insertByVo(book);
	}

	@Override
	public List<NoteBook> getBookByVo(NoteBook book) {
		return this.notebookdao.getBookByVo(book);
	}

	@Override
	public int updateById(NoteBook book) {
		return this.notebookdao.updateById(book);
	}

}
