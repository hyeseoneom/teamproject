package springboot.project.dto;

import lombok.Data;

@Data
public class FsFileDto {
	private int fsfileno;
	private int fsno;
	private String fsimgoriname;
	private String fsimgpath;
	private long fsimgsize;
}
