package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.AdminDto;
import springboot.project.dto.Chartdto;
import springboot.project.dto.StoreDto;

@Mapper
public interface AdminDao {
	int count();

	List<AdminDto> memberAll(Map<String, Object> m);

	List<AdminDto> membersearch(Map<String, Object> m);

	int countSearch(Map<String, Object> m);

	int updatemember(AdminDto dto);

	AdminDto updatemem(String id);

	int deletemember(String memberid);

	//음식점
	int insertStore (StoreDto dto);
	
	StoreDto selectStore (int storeid);
	
	int updateStore (StoreDto dto);
	//음식점수정
	StoreDto storelist (int storeid);
	//음식점리스트
	List<StoreDto> storeAll(Map<String, Object> m);
	int deletestore (int storeid);
	
	//음식점페이지
	int countstore();
	
	List<StoreDto> storesearch (Map<String, Object> m);
	
	int storecountsearch (Map<String, Object> m);
	
	//그래프 
	 List<Chartdto> countgender();
	 
	 int countAll ();
	 
}
