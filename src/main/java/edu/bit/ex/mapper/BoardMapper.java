package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.BoardVO;


@Mapper
public interface BoardMapper {
   List<BoardVO> getList();
   BoardVO read(int bid);
	
}
