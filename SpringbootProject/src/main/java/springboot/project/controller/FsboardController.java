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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import springboot.project.dto.FscommDto;
import springboot.project.dto.FsorderDto;
import springboot.project.dto.MasterDto;
import springboot.project.dto.CommDto;
import springboot.project.dto.FsboardDto;
import springboot.project.dto.MemberDto;
import springboot.project.service.FsboardService;
import springboot.project.service.MasterService;

@SessionAttributes("user")
@Controller
public class FsboardController {
	
	@Autowired
	FsboardService service;
	
	@Autowired
	MasterService ms;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@GetMapping("/fsboard/main")
	public String fsmain() {
		return "mem/main";
	}
	
	@GetMapping("/fsboard/list")
	public String list(Model m,@RequestParam(name="p",defaultValue ="1") int page) {
		int count = service.fscount();
		if(count > 0) {
			int perPage = 5; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<List<Object>> fss = new ArrayList<List<Object>>();
			List<FsboardDto> fsList = service.fsList(startRow, endRow);
			for (FsboardDto fsone : fsList) {
				List<Object> fs = new ArrayList<Object>();
				String time = fsone.getFsdate();
				fsone.setFsdate(time.replace("T"," "));
				fs.add(fsone);
				int fsno = fsone.getFsno();
				int ordercount = service.ordercount(fsno);
				fs.add(ordercount+1);
				fss.add(fs);
			}
			
			
			m.addAttribute("fsList",fss);
		
			int pageNum = 5; //한번에 보일 페이지 수
			int totalPages = count/perPage + (count%perPage > 0 ? 1:0); //전체 페이지 수
			
			int begin = (page -1) / pageNum * pageNum +1;
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
		
		List<String> ranking = service.ranking();
		m.addAttribute("ranking", ranking);
		
		return "fsboard/list";
	}
	
	@GetMapping("/fsboard/write")
	public String write(@ModelAttribute("user") MemberDto user) {
		return "fsboard/write";
	}
	
	@PostMapping("/fsboard/write")
	public String fswrite(FsboardDto dto){
		service.fsboardWrite(dto);
		return "redirect:/fsboard/list";
	}
	
	@GetMapping("/fsboard/content/{fsno}")
	public String fsdetail(@PathVariable int fsno,Model m,@ModelAttribute("user") MemberDto user,MasterDto mdto) {
		int a = service.countingFs(fsno);
		FsboardDto dto = service.fsdetail(fsno);
		String time = dto.getFsdate();
		dto.setFsdate(time.replace("T"," "));
		List<FscommDto> comment = service.fscommlist(fsno);
		List<FscommDto> recomment = service.recommlist(fsno);
		int ordercount= service.ordercount(fsno);
		List<FsorderDto> people = service.orderList(fsno);
		String memberid = user.getMemberid();
		int ordersearch = service.ordersearch(fsno, memberid);
		m.addAttribute("ordersearch",ordersearch);
		m.addAttribute("oList",people);
		m.addAttribute("ordercount",ordercount+1);
		m.addAttribute("fsboards",dto);
		m.addAttribute("comments",comment);
		m.addAttribute("recomments",recomment);
		m.addAttribute("master", ms.login(mdto));
		return "fsboard/content";
	}
	
	@GetMapping("/fsboard/fscdelete/{fscno}")
	@ResponseBody
	public String fscommdelete(int fscno) {
		int a = service.fscommdelete(fscno);
		return""+a;
	}
	
	@GetMapping("/fsboard/fscwrite")
	@ResponseBody
	public String fscommWrite(FscommDto dto) {
		int a = service.fscommWrite(dto);
		return a+"";
	}

	
	@GetMapping("/fsboard/fscommwrite")
	@ResponseBody
	public String fscommwrite(String memberid, int refscno ,String fsccontent, int fsno) {
		FscommDto dto = new FscommDto();
		dto.setMemberid(memberid);
		dto.setRefscno(refscno);
		dto.setFsccontent(fsccontent);
		dto.setFsno(fsno);
		int a = service.fscommWrite(dto);
		return ""+a;
	}
	
	@PostMapping("/fsboard/commentone")
	@ResponseBody
	public FscommDto commentOne(int fscno) {
		FscommDto dto = service.commentOne(fscno);
		return dto;
	}
	
	@GetMapping("/fsboard/fscupdate")
	@ResponseBody
	public String fscommupdate(int fscno ,String fsccontent) {
		int a = service.fscommupdate(fsccontent,fscno);
		return ""+a;
	}
	
	
	@GetMapping("/fsboard/delete/{fsno}")
	public String deleteFsboard(@PathVariable int fsno) {
		int a = service.deleteFsboard(fsno);
		return "redirect:/fsboard/list";
	}
	
	@GetMapping("/fsboard/update/{fsno}")
	public String updateFsboard(@PathVariable int fsno,Model m) {
		FsboardDto dto = service.fsdetail(fsno);
		m.addAttribute("fsboard",dto);
		return "fsboard/updateForm";
	}
	
	@PostMapping("/fsboard/update")
	public String update(FsboardDto dto) {
		int a = service.updateFsboard(dto);
		int fsno = dto.getFsno();
		return "redirect:/fsboard/content/"+fsno;
	}
	
	@GetMapping("/fsboard/list/search")
	public String search(int searchn,String search,Model m,@RequestParam(name="p",defaultValue ="1") int page) {
		
		int count = service.countSearch(search,searchn);
		if(count > 0) {
			int perPage = 5; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			List<List<Object>> fss = new ArrayList<List<Object>>();
			List<FsboardDto> searchList = service.fsSearch(search, searchn,startRow,endRow);
			
			for (FsboardDto fsone : searchList) {
				List<Object> fs = new ArrayList<Object>();
				String time = fsone.getFsdate();
				fsone.setFsdate(time.replace("T"," "));
				fs.add(fsone);
				int fsno = fsone.getFsno();
				int ordercount = service.ordercount(fsno);
				fs.add(ordercount+1);
				fss.add(fs);
			}
			m.addAttribute("fsList",fss);
			int pageNum = 5; //한번에 보일 페이지 수
			int totalPages = count/perPage + (count%perPage > 0 ? 1:0); //전체 페이지 수
			
			int begin = (page -1) / pageNum * pageNum +1;
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
			
		List<String> ranking = service.ranking();
		m.addAttribute("ranking", ranking);
		
		return "fsboard/search";
	}
	
	@GetMapping("/fsboard/order/{fsno}")
	public String order(@PathVariable int fsno,Model m) {
		FsboardDto dto = service.fsdetail(fsno);
		m.addAttribute("dto",dto);
		return "fsboard/order";
	}
	
	@PostMapping("/fsboard/order")
	@ResponseBody
	public String insertorder(FsorderDto dto) {
		int i = service.insertorder(dto);
		return ""+i;
	}
	
	@PostMapping("/fsboard/order/delete")
	@ResponseBody
	public String deleteorder(String memberid,int fsno) {
		int i = service.deleteorder(fsno, memberid);
		return "";
	}
	
	@GetMapping("/fsboard/list/{fsarea}")
	public String fsareaList(@PathVariable String fsarea, @RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		int count = service.countFsarea(fsarea);
		if(count > 0) {
		
		int perPage = 5; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<List<Object>> fss = new ArrayList<List<Object>>();
		List<FsboardDto> fsList = service.fsareaList(startRow, endRow, fsarea);
		for (FsboardDto fsone : fsList) {
			List<Object> fs = new ArrayList<Object>();
			String time = fsone.getFsdate();
			fsone.setFsdate(time.replace("T"," "));
			fs.add(fsone);
			int fsno = fsone.getFsno();
			int ordercount = service.ordercount(fsno);
			fs.add(ordercount+1);
			fss.add(fs);
		}
		
		m.addAttribute("fsareaList",fss);

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
		
		m.addAttribute("fsarea", fsarea);
		m.addAttribute("count", count);
		
		List<String> ranking = service.ranking();
		m.addAttribute("ranking", ranking);
		
		return "fsboard/fsareaList";
	}
	
	@GetMapping("/fsboard/fsareaSearch/{fsarea}")
	public String fsareaSearch(int searchn, String search, @PathVariable String fsarea, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.fsareaCountSearch(searchn,search, fsarea);
		if(count > 0) {
		
		int perPage = 5; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<List<Object>> fss = new ArrayList<List<Object>>();
		List<FsboardDto> searchList = service.fsareaListSearch(searchn, search,startRow,endRow, fsarea);
		
		for (FsboardDto fsone : searchList) {
			List<Object> fs = new ArrayList<Object>();
			String time = fsone.getFsdate();
			fsone.setFsdate(time.replace("T"," "));
			fs.add(fsone);
			int fsno = fsone.getFsno();
			int ordercount = service.ordercount(fsno);
			fs.add(ordercount+1);
			fss.add(fs);
		}
		m.addAttribute("fsareaList",fss);
		
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
		m.addAttribute("fsarea", fsarea);
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		List<String> ranking = service.ranking();
		m.addAttribute("ranking", ranking);
		
		return "fsboard/fsareaSearch";
	}
	

}
