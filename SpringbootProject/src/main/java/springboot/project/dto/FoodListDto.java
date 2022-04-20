package springboot.project.dto;

import lombok.Data;

@Data
public class FoodListDto {
	
	
	private int storeid;
	private String storename;
	private String storeaddress;
	private String storeprice;
	private int favg;
	private String storefilename;
	private String storefilepath;
	private String storefilesize;
	private int fcount;
}
