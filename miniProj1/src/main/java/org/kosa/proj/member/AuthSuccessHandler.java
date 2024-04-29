package org.kosa.proj.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;


@Component
public class AuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
    public void onAuthenticationSuccess(
    		HttpServletRequest request
    		, HttpServletResponse response
    		, Authentication authentication //로그인한 사용자 정보가 있는 객체 
    		) throws IOException, ServletException {
        
		memberMapper.updateMemberLastLogin(authentication.getName());
		
		System.out.println("authentication ->" + authentication);
		
		//성공시 이동할 주소 
        setDefaultTargetUrl("/board/list");
        
        super.onAuthenticationSuccess(request, response, authentication);
    }
}