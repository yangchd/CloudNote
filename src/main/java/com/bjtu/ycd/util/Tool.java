package com.bjtu.ycd.util;

public class Tool {
	
	/**
	 * 判断是否为邮箱格式的工具类
	 * by 杨昌迪 2017-01-16
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email){
		boolean flag = false;
		String rule = "\\w+\\x40\\w+\\x2e\\w+";
		if (email.matches(rule)) {
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 正则表达式验证手机号
	 * by 杨昌迪 2017-01-16
	 * @param mobile
	 * @return
	 */
	public static boolean isMobile(String mobile){
		boolean flag = false;
		String rule = "^[1][3,4,5,7,8][0-9]{9}$";
		if (mobile.matches(rule)) {
			flag = true;
		}
		return flag;
	}

}
