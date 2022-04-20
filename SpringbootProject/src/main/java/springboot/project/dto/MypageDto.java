package springboot.project.dto;

import java.util.Date;

import lombok.Data;
@Data
public class MypageDto {
	private int no;
	private String title;
	private Date regdate;
	private String memberid;

}
