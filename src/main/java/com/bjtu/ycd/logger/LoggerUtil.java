package com.bjtu.ycd.logger;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class LoggerUtil {
	
	private static Logger logger = Logger.getLogger(LoggerUtil.class);  
    /** 
     * @param args 
     */  
	public void info(String msg ){
		logger.info(msg);
	}
	
	public void error(String msg ){
		logger.error(msg);
	}

}