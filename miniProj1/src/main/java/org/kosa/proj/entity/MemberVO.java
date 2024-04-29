package org.kosa.proj.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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
	private String member_roles;
	private String member_account_expired; 
	private String member_account_locked;
	private int    member_login_count;
	private LocalDateTime member_last_login_time;
	
	public boolean isEqualsPwd(String pwd) {
		return this.memberPW.equals(pwd);		
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collections = new ArrayList<GrantedAuthority>();
		Arrays.stream(member_roles.split(",")).forEach(role -> collections.add(new SimpleGrantedAuthority("ROLE_" + role.trim())));
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
		return "N".equalsIgnoreCase(member_account_expired);
	}

	@Override
	public boolean isAccountNonLocked() {
		return "N".equalsIgnoreCase(member_account_locked);
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
