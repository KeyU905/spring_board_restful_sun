package edu.bit.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ex.service.BoardService;
import edu.bit.ex.vo.BoardVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class RestBoardSpring4BeforeController {
	
    @Autowired
    private BoardService boardService;
    
    
    @ResponseBody
	@GetMapping("/rest/before")
	public List<BoardVO> restBefore(Model model) {
	    log.info("restBefore()...");
	    
	    List<BoardVO> list = boardService.getList();
	    
	    model.addAttribute("list", list);
	    
	    return list;
	}
	
}
