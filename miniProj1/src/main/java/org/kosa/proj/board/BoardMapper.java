package org.kosa.proj.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosa.proj.entity.BoardVO;
import org.kosa.proj.page.PageRequestVO;

@Mapper
public interface BoardMapper {

	List<BoardVO> getList(PageRequestVO pageRequestVO);
	int  getTotalCount(PageRequestVO pageRequestVO);
	BoardVO view(BoardVO boardVO);
	int incViewCount(BoardVO boardVO);
	int delete(BoardVO boardVO);
	void clear();
	int update(BoardVO boardVO);
	int insert(BoardVO boardVO);

}
