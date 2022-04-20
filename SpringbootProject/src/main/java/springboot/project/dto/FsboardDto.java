package springboot.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FsboardDto {
	private int fsno;
	private String memberid;
	private String storename;
	private String fscontent;
	private String fstitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	private int fsreadcount;
	private String fsmeeting;
	private String fstel;
	private String fsarea;
	private int fspeople;
	private String fsdate;
	private int fsprice;
	private String fsfood;
}
