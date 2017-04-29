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

	@Override
	public int deleteById(NoteBook book) {
		return this.notebookdao.deleteById(book);
	}

	@Override
	public List<NoteBook> getBookByKey(String key) {
		return this.notebookdao.getBookByKey(key);
	}

	@Override
	public List<NoteBook> getBookQuickList(NoteBook book) {
		List<NoteBook> spacebook = this.notebookdao.getBookByVo(book);
		NoteBook bslist = new NoteBook();
		bslist.setSpaceid(spacebook.get(0).getSpaceid());
		List<NoteBook> blist = this.notebookdao.getBookByVo(bslist);
		return blist;
	}

}
