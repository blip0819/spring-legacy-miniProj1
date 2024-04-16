package org.kosa.proj.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private String bno;
	private String btitle;
	private String bcontent;
	private String bdate;
	private String memberID;
	private String view_count;
	private String bwriter;
	
}
