package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.CSBoardDto;
import springboot.project.dto.MasterDto;


@Mapper
public interface MasterDao {
	
	public int masterregister(MasterDto dto);
	MasterDto masterlogin(MasterDto dto);
//	int count();
//	List<MasterDto> boardList(Map<String, Object> m);

}
