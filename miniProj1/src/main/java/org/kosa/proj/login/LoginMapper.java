package org.kosa.proj.login;

import org.apache.ibatis.annotations.Mapper;
import org.kosa.proj.entity.MemberVO;

@Mapper
public interface LoginMapper {

	MemberVO login(String memberID);
	//마지막 로그인 시간 변경 
	int updateMemberLastLogin(String memberID);
	
	//로그인시 비밀 번호 틀린 회수를 1 증가 함
	//틀린 횟수가 5회 이상이면 계정을 잠근다  
	int loginCountInc(String memberID);
	
	//로그인 성공이 비밀 번호 틀린 회수를 초기화 함  
	int loginCountClear(String memberID);


}