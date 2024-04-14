package org.kosa.proj.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.kosa.proj.board.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class BoardService {
	private static final long serialVersionUID = 1L;
    
	private final BoardMapper boardMapper;
	
	 public PageResponseVO<BoardVO> getList(PageRequestVO pageRequestVO) {
	    	List<BoardVO> list = boardMapper.getList(pageRequestVO);
	        int total = boardMapper.getTotalCount(pageRequestVO);
	        
	        log.info("list {} ", list);
	        log.info("total  = {} ", total);

	        PageResponseVO<BoardVO> pageResponseVO = PageResponseVO.<BoardVO>withAll()
	                .list(list)
	                .total(total)
	                .size(pageRequestVO.getSize())
	                .pageNo(pageRequestVO.getPageNo())
	                .build();

	        return pageResponseVO;
	}
	
	public BoardVO view(BoardVO board){
		return boardMapper.view(board);
	}
	
	public int delete(BoardVO board){
		return boardMapper.delete(board);
	}
	
	public BoardVO updateForm(BoardVO board){
		return boardMapper.view(board);
	}
	
	public int update(BoardVO board){
		return boardMapper.update(board);
	}
	
	public BoardVO insertForm(BoardVO board){
		return boardMapper.view(board);
	}
	
	public int insert(BoardVO board){
		return boardMapper.insert(board);
	}

}
