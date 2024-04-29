package org.kosa.proj.member;

import org.apache.ibatis.annotations.Mapper;
import org.kosa.proj.entity.MemberVO;

@Mapper
public interface MemberMapper {

	MemberVO login(MemberVO boardVO);
	int updateMemberLastLogin(String memberID);
	
	void loginCountInc(MemberVO member);
	
	//로그인 성공이 비밀 번호 틀린 회수를 초기화 함  
	void loginCountClear(String email);

}