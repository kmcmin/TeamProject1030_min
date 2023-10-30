package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	//시작 시 
	@RequestMapping("/")
	public String start(){
		return "main";
	}//method
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/adminmain")
	public String adminindex() {
		return "ADMIN/index";
	}
	@RequestMapping("/tables")
	public String tables() {
		return "ADMIN/tables";
	}
	
}	
