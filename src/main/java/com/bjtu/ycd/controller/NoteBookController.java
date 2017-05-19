package com.bjtu.ycd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.NoteBookService;
import com.bjtu.ycd.service.SpaceService;
import com.bjtu.ycd.service.UserService;
import com.bjtu.ycd.vo.NoteBook;
import com.bjtu.ycd.vo.Space;
import com.bjtu.ycd.vo.User;

@Controller
@RequestMapping("/notebook")
public class NoteBookController {

	@Resource
	private NoteBook notebook;
	
	@Resource
	private LoggerUtil logger;
	
	@Resource
	private NoteBookService bookService;
	
	
    @RequestMapping(value="/createbook",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> createBook(NoteBook book){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	String bookid = UUID.randomUUID().toString();
    	book.setNotebookid(bookid);
    	
    	try {
			String bookname = new String(book.getNotebookname().getBytes("iso-8859-1"),"utf-8");
			book.setNotebookname(bookname);
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	book.setCreatetime(sdf.format(new Date()));
    	
    	int result = bookService.createBook(book);
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "创建成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "创建失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/getbooklist",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getBookList(NoteBook book){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	List<NoteBook> blist = bookService.getBookByVo(book);
    	
    	if(blist!=null&&blist.size()>0){
    		rMap.put("retflag", "0");
    		rMap.put("booklist", blist);
    		rMap.put("msg", "获取成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "获取失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/update",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> updateBook(NoteBook book){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	try {
    		if(book.getMsg()!=null){
    			String msg = new String(book.getMsg().getBytes("iso-8859-1"),"utf-8");
    			book.setMsg(msg);
    		}
    		if(book.getNotebookname()!=null){
    			String notebookname = new String(book.getNotebookname().getBytes("iso-8859-1"),"utf-8");
    			book.setNotebookname(notebookname);
    		}
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
    	int result = bookService.updateById(book);
    	
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "修改成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "修改失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> deleteBook(NoteBook book){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	int result = bookService.deleteById(book);
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "删除成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "删除失败");
    	}
    	return rMap;
    }
}
