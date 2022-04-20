package springboot.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import springboot.project.dto.CSBoardDto;
import springboot.project.dto.CSCommDto;
import springboot.project.dto.MasterDto;
import springboot.project.dto.MemberDto;
import springboot.project.service.CSBoardService;
import springboot.project.service.MasterService;

@Controller
@SessionAttributes("user")

public class CSBoardController {

	@Autowired
	CSBoardService service;
	@Autowired
	MasterService ms;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@GetMapping("CSBoard/write")
	public String writeform(@ModelAttribute("user")MemberDto dto) {
		return "CSBoard/write";
	}
	@PostMapping("CSBoard/write")
	public String write(CSBoardDto dto) {
		service.insert(dto);
		return "redirect:list";
	}
	
	//�슂泥� page 踰덊샇瑜� 諛쏆븘�꽌 �럹�씠吏��뿉 留욌뒗 湲��쓣 媛��닔�뿉 留욊쾶 爰쇰궡�샂
	//�쟾泥� 湲� 媛��닔�뿉 留욎떠 �럹�씠吏� 泥섎━
	@RequestMapping("CSBoard/list")
	public String list(@ModelAttribute("user") MemberDto dto, @RequestParam(name="p",defaultValue ="1") int page, Model m) {
		/*
		//�쉶�썝 �쟾�슜
		if(dto.getMemberid() == null) {
			return "redirect:/loginform";
		}
		*/
		
		//湲��씠 �엳�뒗吏� 泥댄겕
		int count = service.count();
		if(count > 0) {
			int perPage = 10; //�븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			List<CSBoardDto> boardList = service.boardList(startRow, endRow);
			m.addAttribute("bList", boardList);

			int pageNum = 10; // 5媛쒖뵫 蹂댁뿬二쇨쿋�떎 true硫� 1,false硫� 0
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // �쟾泥� �럹�씠吏� 媛��닔
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			
		}
		m.addAttribute("count", count);
		return "CSBoard/list";
	}
	
	
	@GetMapping("CSBoard/content/{csno}")
	public String content(@ModelAttribute("user")MemberDto user, @PathVariable int csno, Model m, MasterDto mdto) {
		CSBoardDto dto = service.CSBoardOne(csno);
		List<CSCommDto> cList = service.showComm(csno);
		int countComm = service.countComm(csno);
		m.addAttribute("dto", dto);
		m.addAttribute("cList", cList);
		m.addAttribute("count",countComm);
		m.addAttribute("master", ms.login(mdto));
		return "CSBoard/content"; 
	}
	@GetMapping("CSBoard/update/{csno}")
	public String updateform(@PathVariable int csno, Model m) {
		CSBoardDto dto = service.CSBoardOne(csno);
		m.addAttribute("dto", dto);
		return "CSBoard/updateform";
	}
	@RequestMapping(value="/CSBoard/update",method= {RequestMethod.POST})
	public String update(CSBoardDto dto) {
		service.updateCSBoard(dto);
		return "redirect:list";
	}
	
	@DeleteMapping("CSBoard/delete")
	@ResponseBody
	public String delete(int csno) {
		int i = service.deleteCSBoard(csno);
		return ""+i;
	}
	
	@GetMapping("CSBoard/search")
	public String search(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<CSBoardDto> boardList = service.boardListSearch(searchn,search,startRow, endRow);
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
		
		return "CSBoard/search";
	}
	@GetMapping("/CSComm/insert")
	@ResponseBody
	public String insertComm(CSCommDto cdto) {
		int i = service.insertComm(cdto);
		return i+"";
	}
	
	@GetMapping("/CSComm/delete/{cscno}")
	@ResponseBody
	public String deleteComm(@PathVariable int cscno) {
		int i = service.deleteComm(cscno);
		return i+"";
	}  
	
	@PostMapping("/CSComm/commentOne")
	@ResponseBody
	public String commentOne(int cscno) {
		CSCommDto cdto = service.commentOne(cscno);
		String csccontent = cdto.getCsccontent();
		return csccontent;
	}
	
	@PostMapping("/CSComm/update")
	@ResponseBody
		public String updateComm(int cscno, String csccontent) {
		int i = service.updateComm(cscno,csccontent);
		return i+"";
	}

	
}
