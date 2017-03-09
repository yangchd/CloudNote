package com.bjtu.ycd.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjtu.ycd.vo.User;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Resource
	private User user;
	
}
