package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.FscommDto;
import springboot.project.dto.FsorderDto;
import springboot.project.dto.FsboardDto;

@Mapper
public interface FsboardDao {
	public List<FsboardDto> fsList(Map<String, Object> map);
	public int fscount();
	public int FsboardWrite(FsboardDto dto);
	public FsboardDto fsdetail(int fsno);
	public int countingFs(int fsno);
	public List<FscommDto> fscommlist(int fsno);
	public List<FscommDto> recommlist(int fsno);
	public int fscommdelete(int fscno);
	public int fscommWrite(FscommDto dto);
	public FscommDto commentOne(int fscno);
	public int fscommupdate(Map<String,Object> map);
	public int quitFsboard(int fsno);
	public int deleteFsboard(int fsno);
	public int deleteFsFile(int fsno);
	public int updateFsboard(FsboardDto dto);
	public int countSearch (Map<String,Object> map);
	public List<FsboardDto> fsSearch(Map<String,Object> map);
	public int ordercount(int fsno);
	public List<FsorderDto> orderList(int fsno);
	public int insertorder(FsorderDto dto);
	public int ordersearch(Map<String,Object> map);
	public int deleteorder(Map<String,Object> map);
	int countFsarea(String fsarea);
	List<FsboardDto> fsareaList(Map<String, Object> m);
	List<FsboardDto> fsareaListSearch(Map<String, Object> m);
	int fsareaCountSearch(Map<String, Object> m);
	List<String> ranking();
}
