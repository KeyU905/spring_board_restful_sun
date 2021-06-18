package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ex.service.BoardService;
import edu.bit.ex.vo.BoardVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/ajax/**")
public class AjaxBoardController {
    
    @Autowired
    private BoardService boardService;
    
	@GetMapping("/list")
	public String ajaxList(Model model) {
	    log.info("ajaxList()...");

	    
	    return "ajax/ajaxList";
	}
	
	 @GetMapping("/delete")
     public String delete(BoardVO boardVO, Model model) {
         log.info("delete()..");
         
         boardService.delete(boardVO);
         
         String message = new String("SUCCESS");
         
         
         return message;
         
     }
  
	
}
