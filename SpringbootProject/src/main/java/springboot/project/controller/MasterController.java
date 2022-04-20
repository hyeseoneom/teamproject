package springboot.project.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import springboot.project.dto.MasterDto;
import springboot.project.service.MasterService;


@Controller
@SessionAttributes("master")
public class MasterController {
	
	@Autowired
	MasterService service;
	
	@ModelAttribute("master")
	public MasterDto getDto() {
		return new MasterDto();
	}
	
	@GetMapping("/masterloginform")
	public String masterloginform() {
		return "masterlogin";
	}
	@PostMapping("/masterlogin")
	public String masterlogin(@ModelAttribute("m_command") @Valid MasterDto mdto, BindingResult error, Model m) {
		MasterDto resultdto = service.login(mdto);
		if (resultdto == null) {
			error.reject("nocode", "아이디 또는 비밀번호가 다릅니다");
			return "masterlogin";
		} else {
			m.addAttribute("master", resultdto);
			System.out.println("아이디 또는 비밀번호가 다릅니다");
		}
		return "redirect:/";
	}

	@PostMapping("/masterregister")
	public String masterregister(MasterDto mdto) {
		service.register(mdto);
		return "redirect:/";
	}
	@GetMapping("/masterlogout")
	public String masterlogout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	/*
	@RequestMapping("CSBoard/list")
	public String mlist(@ModelAttribute("master") MasterDto mdto, @RequestParam(name="p",defaultValue ="1") int page, Model m) {
		
		//�쉶�썝 �쟾�슜
		if(mdto.getMasterid() == null) {
			return "redirect:/masterloginform";
		}
		
		//湲��씠 �엳�뒗吏� 泥댄겕
		int count = service.count();
		if(count > 0) {
			int perPage = 10; //�븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			List<MasterDto> boardList = service.boardList(startRow, endRow);
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
	*/
	
}
