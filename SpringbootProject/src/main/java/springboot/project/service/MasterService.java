package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.MasterDao;
import springboot.project.dto.MasterDto;

@Service
public class MasterService {
	
	@Autowired
	MasterDao dao;
	
	public int register(MasterDto dto) {
		return dao.masterregister(dto);
	}
	
	public MasterDto login(MasterDto dto) {
		return dao.masterlogin(dto);
	}
	/*

	public int count() {
		return dao.count();
	}
	
	public List<MasterDto> boardList(int start, int end) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		return dao.boardList(m);
	}
	*/
}
