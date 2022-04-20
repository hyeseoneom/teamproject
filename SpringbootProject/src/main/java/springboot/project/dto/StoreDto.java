package springboot.project.dto;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class StoreDto {
	 private int storeid;          
	 private String storename;       
	 private String  storeaddress;
	 private String storephone;       
	 private String  storecontent;     
	 private String  storeprice;       
	 private String  storefilename;    
	 private String  storefilepath;    
	 private long    storefilesize ;
	 private String  storecomm;        
	 private Date   foodregdate;   
}
