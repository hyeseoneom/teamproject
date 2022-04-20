package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.FsboardDao;
import springboot.project.dto.FscommDto;
import springboot.project.dto.FsorderDto;
import springboot.project.dto.FsboardDto;

@Service
public class FsboardService {
	
	@Autowired
	FsboardDao dao;
	
	public List<FsboardDto> fsList(int start, int end){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return dao.fsList(map);
	}
	
	public int fscount() {
		return dao.fscount();
	}
	
	public int fsboardWrite(FsboardDto dto) {
		return dao.FsboardWrite(dto);
	}
	
	public FsboardDto fsdetail(int fsno) {
		return dao.fsdetail(fsno);
	}
	public int countingFs(int fsno) {
		return dao.countingFs(fsno);
	}
	
	public List<FscommDto> fscommlist(int fsno){
		return dao.fscommlist(fsno);
	}
	
	public List<FscommDto> recommlist(int fsno){
		return dao.recommlist(fsno);
	}
	
	public int fscommdelete(int fscno) {
		return dao.fscommdelete(fscno);
	}
	public int fscommWrite(FscommDto dto) {
		return dao.fscommWrite(dto);
	}
	public FscommDto commentOne(int fscno) {
		return dao.commentOne(fscno);
	}
	public int fscommupdate(String fsccontent, int fscno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("fsccontent", fsccontent);
		map.put("fscno", fscno);
		return dao.fscommupdate(map);		
	}
	public int quitFsboard(int fsno) {
		return dao.quitFsboard(fsno);
	}
	public int deleteFsboard(int fsno) {
		return dao.deleteFsboard(fsno);
	}
	
	public int deleteFsFile(int fsno) {
		return dao.deleteFsFile(fsno);
	}
	
	
	public int updateFsboard(FsboardDto dto) {
		return dao.updateFsboard(dto);
	}
	
	public int countSearch (String search, int searchn) {
		Map map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("searchn",searchn);
		return dao.countSearch(map);
	}
	
	public List<FsboardDto> fsSearch(String search, int searchn,int start,int end){
		Map map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("searchn",searchn);
		map.put("start", start);
		map.put("end", end);
		return dao.fsSearch(map);
	}
	
	public int ordercount(int fsno) {
		return dao.ordercount(fsno);
	}
	
	public List<FsorderDto> orderList(int fsno){
		return dao.orderList(fsno);
	}
	
	public int insertorder(FsorderDto dto) {
		return dao.insertorder(dto);
	}
	
	public int ordersearch(int fsno, String memberid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("fsno",fsno);
		map.put("memberid", memberid);
		return dao.ordersearch(map);
	}

	public int deleteorder(int fsno, String memberid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("fsno",fsno);
		map.put("memberid", memberid);
		return dao.deleteorder(map);
	}
	
	public List<FsboardDto> fsareaList(int start, int end, String fsarea) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		m.put("fsarea", fsarea);
		return dao.fsareaList(m);
	}
	
	public int countFsarea(String fsarea) {
		return dao.countFsarea(fsarea);
	}
	
	public List<FsboardDto> fsareaListSearch(int searchn, String search,int start, int end, String fsarea){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		m.put("fsarea", fsarea);		
		return dao.fsareaListSearch(m);
	}
	public int fsareaCountSearch(int searchn, String search, String fsarea) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("fsarea", fsarea);
		return dao.fsareaCountSearch(m);
	}
	
	public List<String> ranking(){
		return dao.ranking();
	}
}
