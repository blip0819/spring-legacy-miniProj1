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
	
	public List<BoardVO> list(BoardVO board) throws ServletException, IOException {
		return boardMapper.list(board);
	}
	
	public BoardVO view(BoardVO board) throws ServletException, IOException {
		return boardMapper.view(board);
	}
	
	public int delete(BoardVO board)throws ServletException, IOException {
		return boardMapper.delete(board);
	}
	
	public BoardVO updateForm(BoardVO board)throws ServletException, IOException {
		return boardMapper.view(board);
	}
	
	public int update(BoardVO board) throws ServletException, IOException {
		return boardMapper.update(board);
	}
	
	public BoardVO insertForm(BoardVO board) throws ServletException, IOException {
		return boardMapper.view(board);
	}
	
	public int insert(BoardVO board) throws ServletException, IOException  {
		return boardMapper.insert(board);
	}

}
