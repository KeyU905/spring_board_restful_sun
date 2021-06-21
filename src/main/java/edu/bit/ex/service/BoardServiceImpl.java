package edu.bit.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.BoardMapper;
import edu.bit.ex.vo.BoardVO;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardMapper boardMapper;
    
    @Override
    public List<BoardVO> getList() {
        
        return boardMapper.getList();
    }

    @Override
    public BoardVO get(int bid) {
        log.info("service:get()...");
        return boardMapper.read(bid);
    }
   
       
    @Override
    public int remove(int bid) {
        log.info("service:delete()...");
        
        return boardMapper.delete(bid);
        
    }
	
    
    
	
}
