package springboot.project.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import springboot.project.service.CommService;
import springboot.project.service.MasterService;
import springboot.project.dto.CommDto;
import springboot.project.dto.FileDto;
import springboot.project.dto.MasterDto;
import springboot.project.dto.MemberDto;
import springboot.project.dto.OrderDto;
import springboot.project.dao.CommDao;
import springboot.project.dto.BoardDto;
import springboot.project.service.BoardService;

@SessionAttributes("user")
@Controller
public class BoardController {

	@Autowired
	BoardService service;
	@Autowired
	CommService c_service;
	@Autowired
	MasterService ms;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@RequestMapping("/board/main")
	public String main(@ModelAttribute("user") MemberDto dto) {
		return "mem/main";
	}

	@GetMapping("/board/write")
	public String writeForm(@ModelAttribute("user")MemberDto dto) {
		return "board/write";
	}
	
	@PostMapping("/board/write")
	public String write(BoardDto dto, @RequestParam("pic") MultipartFile[] files) throws IllegalStateException, IOException {
		service.insert(dto);
		for(MultipartFile file : files) {
			String fileName = upload(file);
			FileDto filedto = new FileDto();
			
			filedto.setImgoriname(file.getOriginalFilename());
			filedto.setImgpath(fileName);
			filedto.setImgsize(file.getSize());
			
			service.uploadimg(filedto);
			
		}
		
		return "redirect:list";// 湲�紐⑸줉
	}
	
	
	//�슂泥� page 踰덊샇瑜� 諛쏆븘�꽌 �럹�씠吏��뿉 留욌뒗 湲��쓣 媛��닔�뿉 留욊쾶 爰쇰궡�샂
	//�쟾泥� 湲� 媛��닔�뿉 留욎떠 �럹�씠吏� 泥섎━
	@RequestMapping("/board/list")
	public String list(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		//湲��씠 �엳�뒗吏� 泥댄겕
		int count = service.count();
		
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<BoardDto> boardList = service.boardList(startRow, endRow);
		m.addAttribute("bList", boardList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		
		m.addAttribute("count", count);
		return "board/list";
	}
	
	@GetMapping("board/content/{no}")
	public String content(@ModelAttribute("user")MemberDto user, @PathVariable int no, Model m,MasterDto mdto) {
		String memberid = user.getMemberid();
		int status = service.recommendCount(no, memberid);
		m.addAttribute("status", status);
		
		BoardDto dto = service.boardOne(no);
		List<FileDto> images = service.bdata(no);
		List<CommDto> cList = c_service.commlist(no);
		List<CommDto> recomment = c_service.recommlist(no);
		m.addAttribute("dto", dto);
		m.addAttribute("images", images);
		m.addAttribute("cList", cList);
		m.addAttribute("recomments", recomment);
		m.addAttribute("master", ms.login(mdto));
		return "board/content";
		
	}
	
	
	@GetMapping("/board/update/{no}")
	public String updateForm(@PathVariable int no, Model m) {
		BoardDto dto = service.boardOne(no);
		List<FileDto> images = service.bdata(no);
		m.addAttribute("dto", dto);
		m.addAttribute("images",images);
		return "board/updateForm";
	}

	
	@PostMapping("/board/update")
	public String update(BoardDto dto, @RequestParam("pic") MultipartFile[] files) {
		int a = service.updateBoard(dto);
		int no = dto.getNo();
		
		if(files[0].getSize() != 0) {
			List<FileDto> images = service.bdata(no);
			
			for(FileDto image : images) {
				String fileName = image.getImgpath();
				deletefile(fileName);
			}
			
			int b = service.deleteFile(no);
			
			for(MultipartFile file : files) {
				String fileName = upload(file);
				FileDto filedto = new FileDto();
				
				filedto.setNo(no);
				filedto.setImgoriname(file.getOriginalFilename());
				filedto.setImgpath(fileName);
				filedto.setImgsize(file.getSize());
				
				service.updatefile(filedto);
				
			}
		}
		
		return "redirect:/board/content/"+no;
	}
	
	
	@DeleteMapping("/board/delete")
	@ResponseBody
	public String delete(int no) {
		List<FileDto> images = service.bdata(no);
		for(FileDto image : images) {
			String fileName = image.getImgpath();
			deletefile(fileName);
		}
		int b = service.deleteFile(no);
		int a = service.deleteBoard(no);
		return "redirect:list";
	}
	
	
	@GetMapping("/board/search")
	public String search(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<BoardDto> boardList = service.boardListSearch(searchn,search,startRow, endRow);
		/*
		List<List<Object>> bs = new ArrayList<List<Object>>();
		for (BoardDto b : boardList) {
			int no = b.getNo();
			List<FileDto> bfile = service.bdata(no);
			List<Object> bone = new ArrayList<Object>();
			bone.add(b);
			bone.add(bfile.get(0));
			bs.add(bone);
		}
		*/
		m.addAttribute("bList", boardList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "board/search";
	}
	
	@GetMapping("/board/recommend")
	@ResponseBody
	public String recommend(int no, String memberid) {
		int a = service.addRecommend(no);
		int b = service.recommend(no, memberid);
		return "";
	}
	
	@RequestMapping("/board/bestBoard")
	public String bBlist(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		//湲��씠 �엳�뒗吏� 泥댄겕
		int count = service.bBcount();
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		
		List<BoardDto> bestBoard = service.bBList(startRow, endRow);
		/*
		List<List<Object>> bbs = new ArrayList<List<Object>>();
		for (BoardDto bb : bestBoard) {
			int no = bb.getNo();
			List<FileDto> bfile = service.bdata(no);
			List<Object> bone = new ArrayList<Object>();
			bone.add(bb);
			bone.add(bfile.get(0));
			bbs.add(bone);
		}
		*/
		m.addAttribute("bBList", bestBoard);
		
		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		m.addAttribute("count", count);
		return "board/bestBoard";
	}
	
	@GetMapping("/board/bBsearch")
	public String bBsearch(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.bBcountSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		
		List<BoardDto> bestBoard = service.bBListSearch(searchn,search,startRow, endRow);
		m.addAttribute("bBList", bestBoard);
		
		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "board/bBsearch";
	}
	
	private String upload(MultipartFile file) {
		String origName = file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index+1);//파일 확장자 저장
		
		Random r = new Random();
		String fileName= System.currentTimeMillis()+"_"+r.nextInt(50)+"."+ext;
	
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			File f = new File(path,fileName);
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		return fileName;
	}
	
	private void deletefile(String fileName) {
		String path;
		try {
			path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			File f = new File(path,fileName);
			if(f.exists()) { // 파일이 존재하면 
				f.delete(); // 파일 삭제 
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GetMapping("/board/list/{cate}")
	public String cateList(@PathVariable String cate, @RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		int count = service.countCate(cate);
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<BoardDto> cateList = service.cateList(startRow, endRow, cate);
		m.addAttribute("cateList", cateList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		
		m.addAttribute("cate", cate);
		m.addAttribute("count", count);
		return "board/cateList";
	}
	
	@GetMapping("/board/cateSearch/{cate}")
	public String cateSearch(int searchn, String search, @PathVariable String cate, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.cateCountSearch(searchn,search, cate);
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		
		List<BoardDto> cateList = service.cateListSearch(searchn,search,startRow, endRow, cate);
		m.addAttribute("cateList", cateList);
		
		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		m.addAttribute("cate", cate);
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "board/cateSearch";
	}
	
	@GetMapping("/comm/insert")
	@ResponseBody
	public String insertComm(CommDto dto) {
		int i = c_service.insertComm(dto);
		return i+"";
	}

	@GetMapping("/comm/delete/{cno}")
	@ResponseBody
	public String deleteComm(@PathVariable int cno) {
		int i = c_service.deleteComm(cno);
		return i+"";
	}
	
	@GetMapping("/comm/rgcommwrite")
	@ResponseBody
	public String rgcommwrite(String memberid, int recno ,String ccontent, int no) {
		CommDto dto = new CommDto();
		dto.setMemberid(memberid);
		dto.setRecno(recno);
		dto.setCcontent(ccontent);
		dto.setNo(no);
		int a = c_service.insertComm(dto);
		return ""+a;
	}
	
	@PostMapping("/comm/commentone")
	@ResponseBody
	public CommDto commentOne(int cno) {
		CommDto dto = c_service.commentOne(cno);
		return dto;
	}
	
	@GetMapping("/comm/update")
	@ResponseBody
	public String updatecomm(int cno ,String ccontent) {
		int a = c_service.updateComm(ccontent,cno);
		return ""+a;
	}
	
}








