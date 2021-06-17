package edu.bit.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import edu.bit.ex.service.BoardService;
import edu.bit.ex.vo.BoardVO;
import lombok.extern.log4j.Log4j;

// spring v4.0 이후 버전 
// @RestController 라는 어노테이션을 추가해서 
// 해당 Controller의 모든 메서드의 리턴타입을 기존과 다르게 처리한다는 것을 명시


@Log4j
@RestController //(모든 메서드의 리턴타입을 기존과 다르게 처리한다는 것을 명시) 
public class RestBoardSpring4AfterController {
	
    @Autowired
    private BoardService boardService;
    
    
    // 자바객체 list를 json 형태 바꾸어줌
	@GetMapping("/rest/after")
	public List<BoardVO> restBefore(Model model) {
	    log.info("restAfter()...");
	    
	    List<BoardVO> list = boardService.getList();
	    
	    model.addAttribute("list", list);
	    
	    return list;
	}
	
}
