package org.kosa.proj.entity;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO implements UserDetails{
	
	private String memberID;
	private String memberPW;
	private String memberName;
	private String memberADDR;
	private String memberPhone;
	private String memberGen;
	
	public boolean isEqualsPwd(String pwd) {
		return this.memberPW.equals(pwd);		
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collections = new ArrayList<GrantedAuthority>();
		collections.add(() -> "ROLE_USER");
		return collections;
	}

	@Override
	public String getPassword() {
		return memberPW;
	}

	@Override
	public String getUsername() {
		return memberID;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
