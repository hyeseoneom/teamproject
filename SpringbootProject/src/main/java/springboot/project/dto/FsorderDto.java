package springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FsorderDto {
	private int orderno;
	private int fsno;
	private String memberid;
	private String tel;
	private String food;
	private Date orderdate;
}
