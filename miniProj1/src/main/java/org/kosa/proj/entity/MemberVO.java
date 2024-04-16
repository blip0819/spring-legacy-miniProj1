package org.kosa.proj.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
	
	private String memberID;
	private String memberPW;
	private String memberName;
	private String memberADDR;
	private String memberPhone;
	private String memberGen;
	
	public boolean isEqualsPwd(String pwd) {
		return this.memberPW.equals(pwd);		
	}
}
