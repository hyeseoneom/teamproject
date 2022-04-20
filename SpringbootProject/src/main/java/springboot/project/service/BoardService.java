package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.BoardDao;
import springboot.project.dto.BoardDto;
import springboot.project.dto.FileDto;
import springboot.project.dto.RecommendDto;

@Service
public class BoardService {
	
	@Autowired
	BoardDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<BoardDto> boardList(int start, int end){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		return dao.boardList(m);
	}
	
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}
	public BoardDto boardOne(int no) {
		dao.addReadcount(no);
		return dao.boardOne(no);
	}
	public int updateBoard(BoardDto dto) {
		return dao.updateBoard(dto);
	}
	public int deleteBoard(int no) {
		return dao.deleteBoard(no);
	}
	
	public List<BoardDto> boardListSearch(int searchn, String search,int start, int end){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		
		return dao.boardListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	
	public int addRecommend(int no) {
		return dao.addRecommend(no);
	}
	
	public int recommendCount(int no, String memberid) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("memberid", memberid);
		m.put("no", no);
		return dao.recommendCount(m);
	}

	public int recommend(int no, String memberid) {
		RecommendDto dto = new RecommendDto();
		dto.setMemberid(memberid);
		dto.setNo(no);
		return dao.recommend(dto);
	}
	
	public int bBcount() {
		return dao.bBcount();
	}
	
	public List<BoardDto> bBList(int start, int end){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		return dao.bBList(m);
	}
	
	public List<BoardDto> bBListSearch(int searchn, String search,int start, int end){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		
		return dao.bBListSearch(m);
	}
	public int bBcountSearch(int searchn, String search) {
		System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.bBcountSearch(m);
	}
	
	public List<FileDto> bdata(int no){
		return dao.bdata(no);
	}
    
	public List<FileDto> boarddata(int no){
		return dao.boarddata(no);
	}
	
	public int uploadimg(FileDto dto) {
		return dao.uploadimg(dto);
	}
	
	public int deleteFile(int no) {
		return dao.deleteFile(no);
	}
	
	public int updatefile(FileDto dto) {
		return dao.updatefile(dto);
	}

	public List<BoardDto> cateList(int start, int end, String cate) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		m.put("cate", cate);
		return dao.cateList(m);
	}
	
	public int countCate(String cate) {
		return dao.countCate(cate);
	}
	
	public List<BoardDto> cateListSearch(int searchn, String search,int start, int end, String cate){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		m.put("cate", cate);		
		return dao.cateListSearch(m);
	}
	public int cateCountSearch(int searchn, String search, String cate) {
		System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("cate", cate);
		return dao.cateCountSearch(m);
	}
	
}
