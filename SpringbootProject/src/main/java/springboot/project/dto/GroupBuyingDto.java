package springboot.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GroupBuyingDto {
	
	private int grno;
	private String grtitle;
	private String grproduct;
	private String grcontent;
	private String memberid;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date grregdate;
	private String grphone;
	private int grcno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date grdate;
	private int grstate;
	private int grprice;
	private int banknum;
	private String accountnum;
}
