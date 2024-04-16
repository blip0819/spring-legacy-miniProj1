package org.kosa.proj.member;

import org.kosa.proj.entity.BoardVO;
import org.kosa.proj.entity.MemberVO;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/*
 * MVC 
 * Model : B/L 로직을 구현하는 부분(service + dao)  
 * View  : 출력(jsp) 
 * Controller : model와 view에 대한 제어를 담당 
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class MemberService {
      
	private final MemberMapper  memberMapper;

	public MemberVO login(MemberVO memberVO)  {
		//view Count의 값이 증가된 객체를 얻는다
		MemberVO resultVO = memberMapper.login(memberVO);
		if (resultVO != null && memberVO.isEqualsPwd(resultVO.getMemberPW())) {
			return resultVO;
		}
		return null;
	}
	
}