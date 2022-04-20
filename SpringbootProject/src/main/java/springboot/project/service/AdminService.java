package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import springboot.project.dao.AdminDao;
import springboot.project.dto.AdminDto;
import springboot.project.dto.Chartdto;
import springboot.project.dto.StoreDto;

@Service
public class AdminService {
	@Autowired 
	AdminDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List <AdminDto> memberAll(int start, int end) {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("start", start);
		m.put("end", end);
		return dao.memberAll(m);
	}
	//회원검색
	public List <AdminDto> membersearch (int msearchn,String msearch, int start, int end){
		Map<String, Object>m = new HashMap<String, Object>();
		m.put("msearchn",msearchn);
		m.put("msearch", msearch);
		m.put("start", start);
		m.put("end", end);
		return dao.membersearch(m);	
		}

	public int countSearch (int msearchn, String msearch) {
		Map<String, Object>m = new HashMap<String, Object>();
		m.put("msearchn",msearchn);
		m.put("msearch", msearch);
		return dao.countSearch(m);
	}
	public int updatemember (AdminDto dto) {
		return dao.updatemember(dto);
	}
	public AdminDto updatemem (String id) {
		return dao.updatemem(id);
	}
	public int deletemember (String id) {
		return dao.deletemember(id);
	}
	
	//음식점
	public int insertStore (StoreDto dto) {
		return dao.insertStore(dto);
	}
	public StoreDto selectStore (int storeid) {
		return dao.selectStore(storeid);
	}
	public int updateStore (StoreDto dto) {
		return dao.updateStore(dto);
	}
	public StoreDto storelist (int storeid) {
		return dao.storelist(storeid);
	}
	public List<StoreDto> storeAll (int start, int end){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("start", start);
		m.put("end", end);
		return dao.storeAll(m);
	}
	
	public int deletestore (int storeid) {
		return dao.deletestore(storeid);
	}
	//음식점페이지
	public int countstore() {
		return dao.countstore();
	}
	
	public List<StoreDto> storesearch (int ssearchn,String ssearch, int start, int end){
		Map<String, Object>m = new HashMap<String, Object>();
		m.put("ssearchn",ssearchn);
		m.put("ssearch", ssearch);
		m.put("start", start);
		m.put("end", end);
		return dao.storesearch(m);	
		}
	
	public int storecountsearch (int ssearchn, String ssearch) {
		Map<String, Object>m = new HashMap<String, Object>();
		m.put("ssearchn",ssearchn);
		m.put("ssearch", ssearch);
		return dao.storecountsearch(m);
	}
	//그래프
	public List<Chartdto> countgender(){
		return dao.countgender();
	}
	public int countAll () {
		return dao.countAll();
	}
}
