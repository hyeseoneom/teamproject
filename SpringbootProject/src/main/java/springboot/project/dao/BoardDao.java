package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.BoardDto;
import springboot.project.dto.FileDto;
import springboot.project.dto.RecommendDto;

@Mapper
public interface BoardDao {
	int insert(BoardDto dto);
	List<BoardDto> boardList(Map<String, Object> m);
	int count();//�쟾泥� 湲� 媛��닔
	BoardDto boardOne(int no);
	int updateBoard(BoardDto dto);
	int deleteBoard(int no);
	List<BoardDto> boardListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);//�쟾泥� 湲� 媛��닔
	int addReadcount(int no);
	int addRecommend(int no);
	int recommendCount(Map<String, Object> m);
	int recommend(RecommendDto dto);
	List<BoardDto> bBList(Map<String, Object> m);
	int bBcount();
	List<BoardDto> bBListSearch(Map<String, Object> m);
	int bBcountSearch(Map<String, Object> m);
	List<FileDto> bdata(int no);
    List<FileDto> boarddata(int no);
	int uploadimg(FileDto dto);
	int deleteFile(int no);
	int updatefile(FileDto dto);
	int countCate(String cate);
	List<BoardDto> cateList(Map<String, Object> m);
	List<BoardDto> cateListSearch(Map<String, Object> m);
	int cateCountSearch(Map<String, Object> m);
}
