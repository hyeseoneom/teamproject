package springboot.project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class GBCommentDto {
	private int grno;
	private String memberid;
	private String grcontent;
	private int gsno;
	private Date grdate;
	private int regsno;
}
