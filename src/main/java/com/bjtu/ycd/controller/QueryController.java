package com.bjtu.ycd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjtu.ycd.logger.LoggerUtil;
import com.bjtu.ycd.service.NoteBookService;
import com.bjtu.ycd.service.QueryService;
import com.bjtu.ycd.vo.NoteBook;
import com.bjtu.ycd.vo.Query;

@Controller
@RequestMapping("/query")
public class QueryController {

	@Resource
	private Query query;
	
	@Resource
	private LoggerUtil logger;
	
	@Resource
	private QueryService queryService;
	
	@Resource
	private NoteBookService bookService;
	
    @RequestMapping(value="/searchbykey",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> searchByKey(String key){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	try {
    		key = new String(key.getBytes("iso-8859-1"),"utf-8");
		} catch (Exception e) {
			logger.info(e.getMessage()+"\r\n");
		}
    	List<NoteBook> blist = bookService.getBookByKey(key);
    	
    	if(blist!=null&&blist.size()>0){
    		rMap.put("retflag", "0");
    		rMap.put("list", blist);
    		rMap.put("msg", "查询成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "查询失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/insertorupdate",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> insertOrUpdate(Query query){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	Query qid = new Query();
    	qid.setId(query.getId());
    	List<Query> qlist = queryService.getQueryByVo(qid);
    	int result = -1;
    	if(qlist!=null&&qlist.size()>0){
    		//已存在，更新
    		result = queryService.updateById(query);
    	}else{
    		//不存在，插入
    		result = queryService.insertByVo(query);
    	}
    	if(result>0){
    		rMap.put("retflag", "0");
    		rMap.put("msg", "标记成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "标记失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/getlastread",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getLastRead(String userid,HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	Query query = new Query();
    	query.setId(userid);
    	List<Query> qlist = queryService.getQueryByVo(query);
    	List<NoteBook> blist = new ArrayList<>();
    	
    	if(qlist!=null&&qlist.size()>0){
    		NoteBook book = new NoteBook();
    		book.setNotebookid(qlist.get(0).getLastread().split(",")[1]);
    		blist = bookService.getBookByVo(book);
        	if(blist!=null&&blist.size()>0){
        		rMap.put("retflag", "0");
        		rMap.put("list", blist);
        		rMap.put("spaceid", qlist.get(0).getLastread().split(",")[0]);
        		rMap.put("msg", "查询成功");
        		httpSession.setAttribute("lastread", qlist.get(0).getLastread());
        		httpSession.setAttribute("lastreadlist", blist);
        	}else{
        		rMap.put("retflag", "1");
        		rMap.put("msg", "查询失败");
        	}
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "查询失败");
    	}
    	return rMap;
    }
    
    @RequestMapping(value="/getquickload",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getQuickLoad(HttpSession httpSession){
    	Map<String, Object> rMap = new HashMap<String, Object>();
    	
    	String lastread = httpSession.getAttribute("lastread").toString();
    	NoteBook book = new NoteBook();
    	book.setNotebookid(lastread.split(",")[1]);
    	List<NoteBook> blist = bookService.getBookQuickList(book);
    	if(blist!=null&&blist.size()>0){
    		rMap.put("retflag", "0");
    		rMap.put("booklist", blist);
    		rMap.put("msg", "查询成功");
    	}else{
    		rMap.put("retflag", "1");
    		rMap.put("msg", "查询失败");
    	}
    	return rMap;
    }
}
