package springboot.project.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import oracle.jdbc.proxy.annotation.Post;
import springboot.project.dto.FoodListDto;
import springboot.project.dto.FoodboardDto;
import springboot.project.dto.FoodcommentDto;
import springboot.project.dto.MasterDto;
import springboot.project.dto.MemberDto;
import springboot.project.dto.PetFileDto;
import springboot.project.dto.PetcareDto;
import springboot.project.dto.PetcommentDto;
import springboot.project.service.Foodboardservice;
import springboot.project.service.Foodcommentservice;
import springboot.project.service.MasterService;
import springboot.project.service.MemberService;
import springboot.project.service.Petcareservice;
import springboot.project.service.PetcommentService;

@SessionAttributes("user")
@Controller
public class WebController {

	@Autowired
	Foodboardservice f_service;
	@Autowired
	Petcareservice p_service;
	@Autowired
	MemberService m_service;
	@Autowired
	PetcommentService pc_service;
	@Autowired
	Foodcommentservice fc_service;
	@Autowired
	MasterService ms;

	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}

	// ????????? ??????
	@RequestMapping("/foodstore")
	public String foodlist(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		
		// ?????? ????????? ??????
		int count = f_service.count();
		if (count > 0) { // ???????????? ?????????

			int perPage = 10; // ??? ???????????? ?????? ?????? ??????
			int startRow = (page - 1) * perPage + 1; // ?????????.
			int endRow = page * perPage; // ??? ???.

			List<FoodboardDto> F_list = f_service.FoodList(startRow, endRow);// ???????????? ???????????? list.
			m.addAttribute("F_list", F_list);
			List<FoodListDto> foodrank = f_service.franking(1,5);
			m.addAttribute("foodrank", foodrank);
			System.out.println(F_list.size());

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // ?????? ????????? ???

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
		return "Foodstore/foodstore";
	}

	// ????????? ??????
	@RequestMapping("/petcare")
	public String Petlist(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {

		// ?????? ????????? ??????
		int count = p_service.count();
		if (count > 0) { // ???????????? ?????????

			int perPage = 10; // ??? ???????????? ?????? ?????? ??????
			int startRow = (page - 1) * perPage + 1; // ?????????.
			int endRow = page * perPage; // ??? ???.

			List<PetcareDto> P_list = p_service.PetList(startRow, endRow);// ???????????? ???????????? list.
			m.addAttribute("P_list", P_list);
			
			List<PetcareDto> pranking=p_service.pranking();
			m.addAttribute("pranking", pranking);
			
			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // ?????? ????????? ???

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
		return "Petcare/petcare";
	}

	// ????????? ????????? ??????
	@GetMapping("/petcare/write")
	public String petcarewriteform() {
		return "Petcare/petwrite";
	}

	// ????????? ???????????? ?????????
	@GetMapping("/foodstore/content/{no}")
	public String foodcontent(@ModelAttribute("user") MemberDto user, @PathVariable int no, Model m,MasterDto mdto) {
		FoodboardDto dto = f_service.foodlistone(no);
		m.addAttribute("dto", dto);
		List<FoodcommentDto> fcomm = fc_service.fviewcomment(no);
		m.addAttribute("fcomm", fcomm);
		m.addAttribute("master", ms.login(mdto));
		return "Foodstore/foodcontent";
	}

	// ????????? ???????????? ?????????
	@GetMapping("/petcare/content/{no}")
	public String petcontent(@ModelAttribute("user") MemberDto user, @PathVariable int no, Model m,MasterDto mdto) {
		p_service.pcount(no);
		PetcareDto dto = p_service.petlistone(no);
		m.addAttribute("dto", dto);
		List<PetcommentDto> pcomm = pc_service.pviewcomment(no);
		List<PetFileDto> pimages = p_service.pdata(no);
		m.addAttribute("pimages", pimages);
		m.addAttribute("pcomm", pcomm);
		m.addAttribute("master", ms.login(mdto));
		return "Petcare/petcontent";
	}

	// ????????? ????????? ??????
	@RequestMapping("/pcommentinsert")
	@ResponseBody
	public int commentinsert(PetcommentDto pcomment, @ModelAttribute("user") MemberDto dto) throws Exception {
		pcomment.setMemberid(dto.getMemberid());
		return pc_service.pcommentInsert(pcomment);
	}

	// ?????? ????????? ??????
	@RequestMapping("/fcommentInsert")
	@ResponseBody
	public int fcommentInsert(FoodcommentDto fcommdto, @ModelAttribute("user") MemberDto dto) throws Exception {
		fcommdto.setMemberid(dto.getMemberid());
		return fc_service.fcommentInsert(fcommdto);
	}

	// ?????? ?????????
	@GetMapping("/fsearch")
	public String fsearch(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = f_service.countSearch(searchn, search);
		if (count > 0) {

			int perPage = 10; // ??? ???????????? ?????? ?????? ??????
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<FoodboardDto> FoodList = f_service.foodstoresearch(searchn, search, startRow, endRow);
			m.addAttribute("fList", FoodList);
			List<FoodListDto> foodrank = f_service.franking(1,5);
			m.addAttribute("foodrank", foodrank);
			

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // ?????? ????????? ???

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
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "Foodstore/foodsearch";
	}

	@GetMapping("/psearch")
	public String psearch(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = p_service.countSearch(searchn, search);
		if (count > 0) {

			int perPage = 10; // ??? ???????????? ?????? ?????? ??????
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<PetcareDto> PetList = p_service.petsearch(searchn, search, startRow, endRow);
			m.addAttribute("P_list", PetList);
			List<PetcareDto> pranking=p_service.pranking();
			m.addAttribute("pranking", pranking);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // ?????? ????????? ???

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
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "Petcare/petsearch";
	}


	// ????????? ?????? ??????
	@PostMapping("/pcdelete") // ?????? ??????
	@ResponseBody
	public String pcdelete(int pcno) {
		int i = pc_service.pcdelete(pcno);
		return "" + i;
	}

	// ?????? ?????? ??????
	@PostMapping("/fcdelete") // ?????? ??????
	@ResponseBody
	public String fcdelete( int fcno) {
		int i = fc_service.fcdelete(fcno);
		return "" + i;
	}
	// ????????? ??????1??? ??????
	@PostMapping("/pccommentone")
	@ResponseBody
	public String pccommentone(int pcno) {
		PetcommentDto dto = pc_service.pcone(pcno);
		String pccontent = dto.getPccontent();
		return pccontent;
	}

	// ????????? ?????? ??????
	@PostMapping("/updatepcomm")
	@ResponseBody
	public String updatepcomm(int pcno, String pccontent) {
		int i = pc_service.updatepcomm(pcno, pccontent);
		return "" + i;
	}
	
	//???????????? 1?????? ??? ???????????? 
	@PostMapping("/fcommone")
	@ResponseBody
	public String fcommone(int fcno) {
		FoodcommentDto dto = fc_service.fcommone(fcno);
		String fccontent = dto.getFccontent();
		return fccontent;
	}
	//?????? ?????? ??????
	@ResponseBody
	@PostMapping("/updatefcomm")
	public String updatefcomm(int fcno, String fccontent, int fcscore ){
	      int i = fc_service.updatefcomm(fcno, fccontent, fcscore);
	      return "" + i;
	}
	private String upload(MultipartFile file) {
		String origName = file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index+1);//???????????? ?????????????? ????????????
		
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
			if(f.exists()) { // ?????????????????? ???????????????????? 
				f.delete(); // ???????????? ???????????? 
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//????????? ?????????
	@PostMapping("/petcare/write") //??? ????????? ??????????????? ????????????.
	public String write(PetcareDto dto,  Model m,@RequestParam("roompic") MultipartFile[] files) throws IllegalStateException, IOException {

		p_service.insert(dto);
		for(MultipartFile file : files) {
			String fileName = upload(file);
			PetFileDto filedto = new PetFileDto();
			
			filedto.setPimgoriname(file.getOriginalFilename());
			filedto.setPimgpath(fileName);
			filedto.setPimgsize(file.getSize());
			
			p_service.puploadimg(filedto);
			
		}
		
		m.addAttribute("dto", dto);
		return "redirect:/petcare";// ?????????
	}
	//????????? ????????????
	@GetMapping("/petcare/update/{pno}")
	public String updateForm(@PathVariable int pno, Model m, String memberid) {
		PetcareDto dto = p_service.petlistone(pno);
		List<PetFileDto> images = p_service.pdata(pno);
		m.addAttribute("images",images);
		m.addAttribute("dto", dto);
		return "Petcare/petupdate";
	}
	
	//????????? ?????? ????????? 
	@PostMapping("/petcare/update")
	public String update(PetcareDto dto,@RequestParam("roompic") MultipartFile[] files){
		p_service.updatepboard(dto);
		int pno=dto.getPno();
		
		if(files[0].getSize() != 0) {
			List<PetFileDto> images = p_service.pdata(pno);
			
			for(PetFileDto image : images) {
				String fileName = image.getPimgpath();
				deletefile(fileName);
			}
			
			p_service.deletepetfile(pno);
			
			for(MultipartFile file : files) {
				String fileName = upload(file);
				PetFileDto filedto = new PetFileDto();
				
				filedto.setPno(pno);
				filedto.setPimgoriname(file.getOriginalFilename());
				filedto.setPimgpath(fileName);
				filedto.setPimgsize(file.getSize());
				
				p_service.updatepfile(filedto);
				
			}
		}
		return "redirect:/petcare";
	}
	
	//????????? ?????? 
	
	@GetMapping("/petcare/petdelete")
	public String deletepboard(int pno) {
		p_service.deletepboard(pno);
		return "redirect:/petcare";
	}
	

}
