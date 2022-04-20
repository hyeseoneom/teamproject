package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.CommDao;
import springboot.project.dto.CommDto;

@Service
public class CommService {
	@Autowired
	CommDao dao;
	
	public List<CommDto> selectComm(int no){
		return dao.selectComm(no);
	}
	public int insertComm(CommDto dto) {
		return dao.insertComm(dto);
	}
	public int deleteComm(int cno) {
		return dao.deleteComm(cno);
	}
	public int updateComm(String ccontent, int cno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ccontent", ccontent);
		map.put("cno", cno);
		return dao.updateComm(map);
	}
	
	public CommDto commentOne(int cno) {
		return dao.commentOne(cno);
	}
	
	public List<CommDto> commlist(int no){
		return dao.commlist(no);
	}
	
	public List<CommDto> recommlist(int no){
		return dao.recommlist(no);
	}
	

}
