package org.kosa.proj.code;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosa.proj.entity.CodeVO;

@Mapper
public interface CodeMapper {
	List<CodeVO> getList();
}