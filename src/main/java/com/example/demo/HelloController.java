package com.example.demo;

import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

@Controller
public class HelloController {

	@RequestMapping(value="index")
    public String hello(){
        return "main/index";
    }
	@RequestMapping(value="login")
    public String login(){
        return "/login";
    }
	
	@RequestMapping(value="author/login")
	@ResponseBody
    public String author_login(){
		//成功登录
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> urlmap = new HashMap<String,Object>();
		map.put("code", 1);
		map.put("message", "成功登录");
		map.put("url", "index");
		//map.put("redirect", urlmap);
		String success = JSON.toJSONString(map);
        return success;
    }
}
