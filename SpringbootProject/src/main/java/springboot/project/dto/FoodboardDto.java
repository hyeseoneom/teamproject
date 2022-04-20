package springboot.project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FoodboardDto {

	private int storeid;
	private String storename;
	private String storeaddress;
	private String storephone;
	private String storecontent;
	private String storeprice;
	private String fcscore;
	private String storecomm;
	private Date foodregdate;
	private int favg;
	private String storefilename;
	private String storefilepath;
	private String storefilesize;
	private int fcount;

	
}
