package springboot.project.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderDto {
	private int orderno;
	private int grno;
	private String memberid;
	private String product;
	private int price;
	private String tel;
	private String address;
	private String extraddress;
	private int postcode;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderdate;
}
