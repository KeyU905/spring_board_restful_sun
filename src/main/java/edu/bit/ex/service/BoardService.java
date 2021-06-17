package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.vo.BoardVO;



public interface BoardService {
   List<BoardVO> getList();
	
	
}
