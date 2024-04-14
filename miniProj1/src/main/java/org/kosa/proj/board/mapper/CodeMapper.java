package org.kosa.proj.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosa.proj.board.BoardVO;
import org.kosa.proj.board.CodeVO;
import org.kosa.proj.board.PageRequestVO;

@Mapper
public interface CodeMapper {

	List<CodeVO> getList();
}