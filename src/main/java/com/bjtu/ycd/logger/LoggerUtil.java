package com.bjtu.ycd.logger;

import org.apache.log4j.Logger;

public class LoggerUtil {
	
	private static Logger logger = Logger.getLogger(LoggerUtil.class);  
    /** 
     * @param args 
     */  
	public void setInfo(String msg ){
		logger.info(msg);
	}
	
	public void setError(String msg ){
		logger.error(msg);
	}

}