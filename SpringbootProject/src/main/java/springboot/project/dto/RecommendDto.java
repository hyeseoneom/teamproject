package springboot.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RecommendDto {
	private int recmno;
	private String memberid;
	private int no;
	private int status;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date recmdate;
}
