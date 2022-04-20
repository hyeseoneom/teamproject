package springboot.project.dto;

import lombok.Data;

@Data
public class PetFileDto {
	
	private int pfileno;
	private int pno;
	private String pimgoriname;
	private String pimgpath;
	private long pimgsize;
}
