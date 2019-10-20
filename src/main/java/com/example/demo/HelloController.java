package com.example.demo;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	@RequestMapping(value="index")
    public String hello(){
        return "/index";
    }
	@RequestMapping(value="login")
    public String login(){
        return "/login";
    }
}
