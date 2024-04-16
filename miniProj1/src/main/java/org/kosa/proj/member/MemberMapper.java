package org.kosa.proj.member;

import org.apache.ibatis.annotations.Mapper;
import org.kosa.proj.entity.MemberVO;

@Mapper
public interface MemberMapper {

	MemberVO login(MemberVO boardVO);

}