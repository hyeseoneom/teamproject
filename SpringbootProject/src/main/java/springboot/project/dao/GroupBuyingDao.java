package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.GBCommentDto;
import springboot.project.dto.GBFileDto;
import springboot.project.dto.GroupBuyingDto;
import springboot.project.dto.OrderDto;

@Mapper
public interface GroupBuyingDao {
	public List<GroupBuyingDto> gbList(Map<String, Object> map);
	public int gbcount();
	public List<GBFileDto> gbdata(int grno);
	public int uploadimg(GBFileDto dto);
	public int groupBuyingWrite(GroupBuyingDto dto);
	public GroupBuyingDto groupdetail(int grno);
	public int countingGroup(int grno);
	public List<GBFileDto> groupdata(int grno);
	public List<GBCommentDto> gcommlist(int grno);
	public List<GBCommentDto> recommlist(int grno);
	public int gcommdelete(int gsno);
	public int gcommWrite(GBCommentDto dto);
	public GBCommentDto commentOne(int gsno);
	public int gcommupdate(Map<String,Object> map);
	public int quitGroupBuying(int grno);
	public int deleteGroupBuying(int grno);
	public int deleteGBFile(int grno);
	public int updatefile(GBFileDto dto);
	public int updateGroupBuying(GroupBuyingDto dto);
	public int countSearch (Map<String,Object> map);
	public List<GroupBuyingDto> gbSearch(Map<String,Object> map);
	public int order(OrderDto dto);
	public List<GroupBuyingDto> orderList(Map<String, Object> map);
	public int ordercount(String memberid);
	public List<OrderDto> orderdetail(Map<String, Object> map);
	public int orderdetailcount(int grno);
	public List<OrderDto> myorders(Map<String, Object> map);
	public int myorderscount(String memberid);
	public int orderCountSearch (Map<String,Object> map);
	public List<OrderDto> orderSearch(Map<String,Object> map);
}
