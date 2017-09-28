package com.example.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.WebBoard;
import com.example.persistence.WebBoardRepository;
import com.example.vo.PageMaker;
import com.example.vo.PageVO;
import com.querydsl.core.types.Predicate;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/board/")
@Log
public class WebBoardController {
	
	@Inject
	WebBoardRepository repo;

	@GetMapping("/list")
	public String list(@ModelAttribute("xxx")PageVO vo, Model model){
		
		Pageable pageable = vo.makePageable(0, "bno");
		Predicate predicate = repo.makePredicate(vo.getType(), vo.getKeyword());
		
		Page<WebBoard> result = repo.findAll(predicate, pageable);
		
		log.info("board/list()...");
		log.info("PageVO=" + vo);
		
		model.addAttribute("pageMaker", new PageMaker(result));
		
		return "jsp/board/list";
	}

}


