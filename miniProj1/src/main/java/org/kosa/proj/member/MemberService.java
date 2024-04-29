package org.kosa.proj.member;

import org.kosa.proj.entity.BoardVO;
import org.kosa.proj.entity.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

public class MemberService implements UserDetailsService {
      
	@Autowired
	private MemberMapper  memberMapper;

	
	public static void main(String [] args) {
		BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
		System.out.println(bcryptPasswordEncoder.encode("1004"));
		System.out.println(bcryptPasswordEncoder.encode("0123456789010234567890123456789"));
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.info("username = {}", username);
		MemberVO resultVO = memberMapper.login(MemberVO.builder().memberID(username).build());
		if (resultVO == null) {
			throw new UsernameNotFoundException(username + " 사용자가 존재하지 않습니다");

		}
		
		memberMapper.loginCountInc(resultVO);
		return resultVO;
	}
}
