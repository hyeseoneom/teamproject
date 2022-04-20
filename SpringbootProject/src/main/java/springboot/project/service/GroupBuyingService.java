package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.GroupBuyingDao;
import springboot.project.dto.GBCommentDto;
import springboot.project.dto.GBFileDto;
import springboot.project.dto.GroupBuyingDto;
import springboot.project.dto.OrderDto;

@Service
public class GroupBuyingService {
	
	@Autowired
	GroupBuyingDao dao;
	
	public List<GroupBuyingDto> gbList(int start, int end){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return dao.gbList(map);
	}
	
	public int gbcount() {
		return dao.gbcount();
	}

	public List<GBFileDto> gbdata(int grno){
		return dao.gbdata(grno);
	}
	
	public int uploadimg(GBFileDto dto) {
		return dao.uploadimg(dto);
	}
	
	public int groupBuyingWrite(GroupBuyingDto dto) {
		return dao.groupBuyingWrite(dto);
	}
	
	public GroupBuyingDto groupdetail(int grno) {
		return dao.groupdetail(grno);
	}
	public int countingGroup(int grno) {
		return dao.countingGroup(grno);
	}
	
	public List<GBFileDto> groupdata(int grno){
		return dao.groupdata(grno);
	}
	public List<GBCommentDto> gcommlist(int grno){
		return dao.gcommlist(grno);
	}
	
	public List<GBCommentDto> recommlist(int grno){
		return dao.recommlist(grno);
	}
	
	public int gcommdelete(int gsno) {
		return dao.gcommdelete(gsno);
	}
	public int gcommWrite(GBCommentDto dto) {
		return dao.gcommWrite(dto);
	}
	public GBCommentDto commentOne(int gsno) {
		return dao.commentOne(gsno);
	}
	public int gcommupdate(String grcontent, int gsno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("grcontent", grcontent);
		map.put("gsno", gsno);
		return dao.gcommupdate(map);		
	}
	public int quitGroupBuying(int grno) {
		return dao.quitGroupBuying(grno);
	}
	public int deleteGroupBuying(int grno) {
		return dao.deleteGroupBuying(grno);
	}
	
	public int deleteGBFile(int grno) {
		return dao.deleteGBFile(grno);
	}
	
	public int updatefile(GBFileDto dto) {
		return dao.updatefile(dto);
	}
	
	public int updateGroupBuying(GroupBuyingDto dto) {
		return dao.updateGroupBuying(dto);
	}
	
	public int countSearch (String search, int searchn) {
		Map map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("searchn",searchn);
		return dao.countSearch(map);
	}
	
	public List<GroupBuyingDto> gbSearch(String search, int searchn,int start,int end){
		Map map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("searchn",searchn);
		map.put("start", start);
		map.put("end", end);
		return dao.gbSearch(map);
	}
	
	public int order(OrderDto dto) {
		return dao.order(dto);
	}
	
	public List<GroupBuyingDto> orderList(int start, int end, String memberid){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberid", memberid);
		map.put("start", start);
		map.put("end", end);
		return dao.orderList(map);
	}
	public int ordercount(String memberid) {
		return dao.ordercount(memberid);
	}
	
	public List<OrderDto> orderdetail(int start, int end, int grno){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grno", grno);
		map.put("start", start);
		map.put("end", end);
		return dao.orderdetail(map);
	}
	public int orderdetailcount(int grno) {
		return dao.orderdetailcount(grno);
	}
	
	public List<OrderDto> myorders(int start, int end, String memberid){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberid", memberid);
		map.put("start", start);
		map.put("end", end);
		return dao.myorders(map);
	}
	public int myorderscount(String memberid) {
		return dao.myorderscount(memberid);
	}
	
	public int orderCountSearch (String search, int searchn, int grno) {
		Map map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("searchn",searchn);
		map.put("grno",grno);
		return dao.orderCountSearch(map);
	}
	public List<OrderDto> orderSearch(String search, int searchn,int start,int end,int grno){
		Map map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("searchn",searchn);
		map.put("start", start);
		map.put("end", end);
		map.put("grno", grno);
		return dao.orderSearch(map);
	}
}
