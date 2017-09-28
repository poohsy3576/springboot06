package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.vo.PageVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/bootstrap")
@Log
public class BootStrapController {
	
	@GetMapping("/list")
	public String list(PageVO vo, Model model) {
		log.info("/bootstrap/list...");
		
		/*
		 * DB 작업 수행
		 */
		
		model.addAttribute("pageMaker", null);
		
		return "jsp/bootstrap/list";
	}
}
