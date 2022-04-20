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

import springboot.project.dto.GBCommentDto;
import springboot.project.dto.GBFileDto;
import springboot.project.dto.GroupBuyingDto;
import springboot.project.dto.MasterDto;
import springboot.project.dto.MemberDto;
import springboot.project.dto.OrderDto;
import springboot.project.dto.RoomCommentDto;
import springboot.project.dto.RoomDto;
import springboot.project.dto.RoomFileDto;
import springboot.project.service.GroupBuyingService;
import springboot.project.service.MasterService;

@SessionAttributes("user")
@Controller
public class GroupBuyingController {
	
	@Autowired
	GroupBuyingService service;
	@Autowired
	MasterService ms;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
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
	
	@GetMapping("/groupbuying/list")
	public String list(Model m,@RequestParam(name="p",defaultValue ="1") int page) {
		int count = service.gbcount();
		if(count > 0) {
			int perPage = 5; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<List<Object>> gbs = new ArrayList<List<Object>>();
			List<GroupBuyingDto> gbList = service.gbList(startRow, endRow);
			
			for (GroupBuyingDto gb : gbList) {
				int grno = gb.getGrno();
				List<GBFileDto> gbfile = service.gbdata(grno);
				List<Object> gbone = new ArrayList<Object>();
				gbone.add(gb);
				gbone.add(gbfile.get(0));
				gbs.add(gbone);
			}
			
			m.addAttribute("gList",gbs);
		
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
		
		
		return "group/list";
	}
	
	@GetMapping("/groupbuying/write")
	public String write(@ModelAttribute("user") MemberDto user) {
		return "group/write";
	}
	
	@PostMapping("/groupbuying/write")
	public String roomwrite(GroupBuyingDto dto,@RequestParam("grpic") MultipartFile[] files) throws IllegalStateException, IOException {
		service.groupBuyingWrite(dto);

		for(MultipartFile file : files) {
			String fileName = upload(file);
			GBFileDto filedto = new GBFileDto();
			
			filedto.setGimgoriname(file.getOriginalFilename());
			filedto.setGimgpath(fileName);
			filedto.setGimgsize(file.getSize());
			
			service.uploadimg(filedto);
			
		}
		
		return "redirect:/groupbuying/list";
	}
	
	@GetMapping("/groupbuying/list/{grno}")
	public String roomdetail(@PathVariable int grno,Model m,@ModelAttribute("user") MemberDto user,MasterDto mdto) {
		int a = service.countingGroup(grno);
		GroupBuyingDto dto = service.groupdetail(grno);
		List<GBFileDto> images = service.groupdata(grno);
		List<GBCommentDto> comment = service.gcommlist(grno);
		List<GBCommentDto> recomment = service.recommlist(grno);
		int count = service.orderdetailcount(grno);
		m.addAttribute("count",count);
		m.addAttribute("groups",dto);
		m.addAttribute("images",images);
		m.addAttribute("comments",comment);
		m.addAttribute("recomments",recomment);
		m.addAttribute("master", ms.login(mdto));
		return "group/detail";
	}
	
	@GetMapping("/groupbuying/gsdelete")
	@ResponseBody
	public String gcommdelete(int gsno) {
		int a = service.gcommdelete(gsno);
		return""+a;
	}
	
	@PostMapping("/groupbuying/{grno}/gswrite")
	public String gcommWrite(GBCommentDto dto,@PathVariable int grno) {
		int a = service.gcommWrite(dto);
		return "redirect:/groupbuying/list/"+grno;
	}
	
	@GetMapping("/groupbuying/rgcommwrite")
	@ResponseBody
	public String rgcommwrite(String memberid, int regsno ,String grcontent, int grno) {
		GBCommentDto dto = new GBCommentDto();
		dto.setMemberid(memberid);
		dto.setRegsno(regsno);
		dto.setGrcontent(grcontent);
		dto.setGrno(grno);
		int a = service.gcommWrite(dto);
		return ""+a;
	}
	
	@PostMapping("/groupbuying/commentone")
	@ResponseBody
	public GBCommentDto commentOne(int gsno) {
		GBCommentDto dto = service.commentOne(gsno);
		return dto;
	}
	
	@GetMapping("/groupbuying/gsupdate")
	@ResponseBody
	public String gcommupdate(int gsno ,String grcontent) {
		int a = service.gcommupdate(grcontent,gsno);
		return ""+a;
	}
	
	@GetMapping("/groupbuying/quit/{grno}")
	public String quitGroupBuying(@PathVariable int grno) {
		int a = service.quitGroupBuying(grno);
		return "redirect:/groupbuying/list/"+grno;
	}
	
	@GetMapping("/groupbuying/delete/{grno}")
	public String deleteGroupBuying(@PathVariable int grno) {
		List<GBFileDto> images = service.gbdata(grno);
		for(GBFileDto image : images) {
			String fileName = image.getGimgpath();
			deletefile(fileName);
		}
		int b = service.deleteGBFile(grno);
		int a = service.deleteGroupBuying(grno);
		return "redirect:/groupbuying/list";
	}
	
	@GetMapping("/groupbuying/update/{grno}")
	public String updateGroupBuying(@PathVariable int grno,Model m) {
		GroupBuyingDto dto = service.groupdetail(grno);
		List<GBFileDto> images = service.groupdata(grno);
		m.addAttribute("group",dto);
		m.addAttribute("images",images);
		return "group/update";
	}
	
	@PostMapping("/groupbuying/update")
	public String update(GroupBuyingDto dto,@RequestParam("grpic") MultipartFile[] files) {
		int a = service.updateGroupBuying(dto);
		int grno = dto.getGrno();
		
		if(files[0].getSize() != 0) {
			List<GBFileDto> images = service.gbdata(grno);
			
			for(GBFileDto image : images) {
				String fileName = image.getGimgpath();
				deletefile(fileName);
			}
			
			int b = service.deleteGBFile(grno);
			
			for(MultipartFile file : files) {
				String fileName = upload(file);
				GBFileDto filedto = new GBFileDto();
				
				filedto.setGrno(grno);
				filedto.setGimgoriname(file.getOriginalFilename());
				filedto.setGimgpath(fileName);
				filedto.setGimgsize(file.getSize());
				
				service.updatefile(filedto);
				
			}
		}
		
		return "redirect:/groupbuying/list/"+grno;
	}
	
	@GetMapping("/groupbuying/list/search")
	public String search(int searchn,String search,Model m,@RequestParam(name="p",defaultValue ="1") int page) {
		
		int count = service.countSearch(search,searchn);
		if(count > 0) {
			int perPage = 5; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<List<Object>> gbs = new ArrayList<List<Object>>();
			List<GroupBuyingDto> searchList = service.gbSearch(search, searchn,startRow,endRow);
			
			for (GroupBuyingDto gb : searchList) {
				int grno = gb.getGrno();
				List<GBFileDto> gbfile = service.gbdata(grno);
				List<Object> gbone = new ArrayList<Object>();
				gbone.add(gb);
				gbone.add(gbfile.get(0));
				gbs.add(gbone);
			}
			
			m.addAttribute("gList",gbs);
		
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
		
		m.addAttribute("search", search);
		m.addAttribute("searchn", searchn);
		m.addAttribute("count", count);
		
		
		return "group/search";
	}
	
	@GetMapping("/groupbuying/order/{grno}")
	public String order(@ModelAttribute("user") MemberDto user,Model m,@PathVariable int grno) {
		GroupBuyingDto dto=service.groupdetail(grno);
		m.addAttribute("detail",dto);
		return "group/order";
	}
	
	@PostMapping("/order")
	@ResponseBody
	public String orderpay(int grno,String memberid,String product,int price,String tel,int postcode,String address,String extraddress,@ModelAttribute("user") MemberDto user) {
		OrderDto dto = new OrderDto();
		dto.setGrno(grno);
		dto.setMemberid(memberid);
		dto.setProduct(product);
		dto.setPrice(price);
		dto.setPostcode(postcode);
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setExtraddress(extraddress);
		int i = service.order(dto);
		return ""+i;
	}
	
	@GetMapping("/groupbuying/myorder")
	public String myorder(@ModelAttribute("user") MemberDto user,Model m,@RequestParam(name="p",defaultValue ="1") int page) {
		String memberid = user.getMemberid();
		int count = service.ordercount(memberid);
		if(count > 0) {
			int perPage = 10; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<List<Object>> orders=new ArrayList<List<Object>>();
			List<GroupBuyingDto> oList = service.orderList(startRow, endRow,memberid);
			
			for(GroupBuyingDto order : oList) {
				int grno = order.getGrno();
				int ordercount = service.orderdetailcount(grno);
				List<Object> orderone=new ArrayList<Object>();
				orderone.add(order);
				orderone.add(ordercount);
				orders.add(orderone);
			}
			m.addAttribute("oList",orders); 
		
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
		return "group/myorder";
	}
	
	@GetMapping("/groupbuying/myorder/{grno}")
	public String myorderlist(@PathVariable int grno,Model m,@RequestParam(name="p",defaultValue ="1") int page, @ModelAttribute("user") MemberDto user) {
		GroupBuyingDto dto = service.groupdetail(grno);
		m.addAttribute("dto",dto);
		m.addAttribute("grno",grno);
		int count = service.orderdetailcount(grno);
		if(count > 0) {
			int perPage = 10; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<OrderDto> orders = service.orderdetail(startRow, endRow,grno);
			m.addAttribute("orders",orders);
		
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
		return "group/myorderlist";
	}
	
	@GetMapping("/groupbuying/orders")
	public String orderslist(@ModelAttribute("user") MemberDto user,Model m,@RequestParam(name="p",defaultValue ="1") int page) {
		String memberid = user.getMemberid();
		int count = service.myorderscount(memberid);
		if(count > 0) {
			int perPage = 10; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<OrderDto> orders = service.myorders(startRow, endRow, memberid);
			m.addAttribute("orders",orders);
		
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
		return "group/orderslist";
	}
	
	@GetMapping("/groupbuying/orders/search/{grno}")
	public String search(int searchn,String search,@ModelAttribute("user") MemberDto user,Model m,@RequestParam(name="p",defaultValue ="1") int page,@PathVariable int grno) {
		GroupBuyingDto dto = service.groupdetail(grno);
		m.addAttribute("dto",dto);
		m.addAttribute("grno",grno);
		int count = service.orderCountSearch(search,searchn,grno);
		if(count > 0) {
			int perPage = 10; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<OrderDto> orders = service.orderSearch(search,searchn,startRow, endRow,grno);
			m.addAttribute("orders",orders);
		
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
		m.addAttribute("search", search);
		m.addAttribute("searchn", searchn);
		m.addAttribute("count", count);
		
		
		return "group/ordersearch";
	}
	
	
}
