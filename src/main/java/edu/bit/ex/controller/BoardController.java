package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ex.service.BoardService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/**")
public class BoardController {
	
    @Autowired
    private BoardService boardService;
    
	@GetMapping("/list")
	public String list(Model model) {
	    log.info("list()...");
	    log.info(boardService.getList());

	    model.addAttribute("list", boardService.getList());
	    
	    return "list";
	}
	
}
