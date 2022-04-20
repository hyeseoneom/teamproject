package springboot.project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FscommDto {
	private int fsno;
	private String memberid;
	private String fsccontent;
	private int fscno;
	private Date fsdate;
	private int refscno;
}
