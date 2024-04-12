package org.kosa.proj.board.mapper;

import java.util.List;

import org.kosa.proj.board.BoardVO;


public interface BoardMapper {

	List<BoardVO> list(BoardVO boardVO);
	BoardVO view(BoardVO boardVO);
	int delete(BoardVO boardVO);
	void clear();
	int update(BoardVO boardVO);
	int insert(BoardVO boardVO);

}
