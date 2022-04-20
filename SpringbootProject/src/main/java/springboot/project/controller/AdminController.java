package springboot.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import springboot.project.dto.AdminDto;
import springboot.project.dto.Chartdto;
import springboot.project.dto.StoreDto;
import springboot.project.service.AdminService;

@Controller
public class AdminController implements ApplicationContextAware{
   @Autowired
   AdminService service;
   //의존하는 객체주입
   private WebApplicationContext context =null;
   
   /*
    * private MultipartFile file; private int count;
    */
    
   
   @GetMapping("/Adminmain")
   public String Adminmain() {
      return"Adminmain";
   }
   @GetMapping("/index")
   public String index() {
      return "index";
   }
   
   @GetMapping("/main")
   public String main() {
      return "main";
   }
   @GetMapping("/member/memberAll")
     public String memberAll(@RequestParam(name="p",defaultValue="1")int page,Chartdto dto,Model m) {
          //성별그래프
         List<Chartdto> select = service.countgender();
          Gson json = new Gson();
          String t_dto = json.toJson(select);
          m.addAttribute("dto",t_dto);
      
          //전체회원수카운트
          int count2 = service.countAll();
         m.addAttribute("count",count2);
      
         int count = service.count();
         if (count >0){
         int perPage = 10; //한페이지에 보일 글의 갯수
         int startRow =(page-1) *perPage +1;
         int endRow = page *perPage;
         
         List<AdminDto> memberAll = service.memberAll(startRow, endRow);
         m.addAttribute("mList", memberAll);
            
         int pageNum= 10;
         int totalPages = count/perPage+(count%perPage >0 ? 1:0);
         
         int begin =(page-1)/pageNum * pageNum +1;
         int end = begin + pageNum -1;
         if (end >totalPages) {
            end =totalPages;
         }
         m.addAttribute("begin",begin);
         m.addAttribute("end",end);
         m.addAttribute("pageNum",pageNum);
         m.addAttribute("totalPages",totalPages);
         }
         m.addAttribute("count",count);
         return "member/memberAll";
      }
     //회원검색
     @GetMapping("/member/membersearch")
      public String membersearch(int msearchn, String msearch,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
         int count = service.countSearch(msearchn,msearch);
         if(count > 0) {
         
         int perPage = 10; // 한 페이지에 보일 글의 갯수
         int startRow = (page - 1) * perPage + 1;
         int endRow = page * perPage;
         
         List<AdminDto> memberlist = service.membersearch(msearchn,msearch,startRow, endRow);
         m.addAttribute("mList", memberlist);

         int pageNum = 5;
         int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
         
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
         m.addAttribute("msearchn", msearchn);
         m.addAttribute("msearch", msearch);
         
         return "member/membersearch";
      }
     //회원정보수정폼?
     @GetMapping("/member/updatemember")
      public String updatememberform(String id, AdminDto dto, Model m){
        //id로 select 해올 것
        dto = service.updatemem(id);
        m.addAttribute("Member", dto);
        return "member/updatemember";
      }
     //회원정보수정
     @PostMapping("/member/updatemember")
     public String updatemember (AdminDto dto) {
        service.updatemember(dto);
        return "redirect:/member/memberAll";
     }
     //회원삭제
     @GetMapping("/member/deletemember")
      public String deletemember (String id){
        service.deletemember(id);
        return "redirect:/member/memberAll";
      }

     //음식점등록
     @GetMapping("/store/Storeform")
     public String Storeform() {
        return "store/Storeform";
     }
     @PostMapping("/store/Storeform")
     public String insertStore (StoreDto dto,MultipartFile file, Model m) {
        String fileName = Storefile(file);
       
       // StoreDto dto1 = new StoreDto();
        dto.setStorefilename(file.getOriginalFilename());
        dto.setStorefilepath(fileName);
        dto.setStorefilesize(file.getSize());
       
        service.insertStore(dto);
        return "redirect:/store/storelist";
     }
        //업로드할 파일 받아오기
        private String Storefile(MultipartFile file) {
        String origName=file.getOriginalFilename();//원본파일받아와서 확장자 알기
        int index = origName.lastIndexOf(".");
        String ext = origName.substring(index+1);
        
        Random r = new Random();
        
        String fileName= System.currentTimeMillis()+"_"+r.nextInt(50)+"."+ext;
        File f = new File(getFile(fileName));//getFile메서드와 fileName을 넘기면 여기에 옮기다.
        
        try {
           file.transferTo(f);
        } catch(IllegalStateException | IOException e) {
           e.printStackTrace();
        }
        return fileName; //db에 이름만 저장함.
        }

     //프로젝트 내의 upload폴더에 업로드
     private String getFile(String filename) {
        String path=context.getServletContext().getRealPath("/upload/"+filename);
        return path;
     }
     //음식점수정폼
     @GetMapping("/store/updateStore")
     public String selectStore (int storeid, StoreDto dto, Model m, MultipartFile file){
       dto = service.selectStore(storeid);
        m.addAttribute("Store", dto);
        return "store/updateStore";
     }
     //음식점수정
     @PostMapping("/store/updateStore")
     public String updateStore (StoreDto dto,MultipartFile file,Model m) {
        int storeid = dto.getStoreid();
        if(file.getSize() != 0) {
        	String fileName = Storenewfile(file);
            dto.setStorefilename(file.getOriginalFilename());
            dto.setStorefilepath(fileName);
            dto.setStorefilesize(file.getSize());
        	
        }else {
        	StoreDto sdto = service.selectStore(storeid);
        	dto.setStorefilename(sdto.getStorefilename());
            dto.setStorefilepath(sdto.getStorefilepath());
            dto.setStorefilesize(sdto.getStorefilesize());
        }
        service.updateStore(dto);
        
        return "redirect:/store/storelist";
     }
        //업로드할 파일 받아오기
        private String Storenewfile(MultipartFile file) {
        String origName=file.getOriginalFilename();//원본파일받아와서 확장자 알기
        int index = origName.lastIndexOf(".");
        String ext = origName.substring(index+1);
        
        Random r = new Random();
        
        String fileName= System.currentTimeMillis()+"_"+r.nextInt(50)+"."+ext;
        File f = new File(newgetFile(fileName));//getFile메서드와 fileName을 넘기면 여기에 옮기다.
        
        try {
           file.transferTo(f);
        } catch(IllegalStateException | IOException e) {
           e.printStackTrace();
        }
        return fileName; //db에 이름만 저장함.
        }
        //프로젝트 내의 upload폴더에 업로드
        private String newgetFile(String filename) {
           String path=context.getServletContext().getRealPath("/upload/"+filename);
           return path;
        }
     //음식점리스트
     @GetMapping("/store/storelist")
     public String  storeAll (@RequestParam(name="p",defaultValue="1")int page,Model m) {
        int countstore = service.countstore();
         if (countstore>0){
         int perPage = 10; //한페이지에 보일 글의 갯수
         int startRow =(page - 1) * perPage +1;
         int endRow = page * perPage;
        
         //List<StoreDto> storeAll = service.storeAll(startRow,endRow);
         //m.addAttribute("sList", storeAll);
          m.addAttribute("sList", service.storeAll(startRow,endRow));
        
         int pageNum= 10;
         int totalPages = countstore / perPage+(countstore % perPage > 0 ? 1:0);
         
         int begin =(page-1)/pageNum * pageNum +1;
         int end = begin + pageNum -1;
         if (end >totalPages) {
            end =totalPages;
         }
         m.addAttribute("begin",begin);
         m.addAttribute("end",end);
         m.addAttribute("pageNum",pageNum);
         m.addAttribute("totalPages",totalPages);
         }
         m.addAttribute("countstore",countstore);
          return "store/storelist";
     }
     //음식점페이지
     @GetMapping("/store/storesearch")
      public String storesearch(int ssearchn, String ssearch,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
         int countstore = service.storecountsearch(ssearchn,ssearch);
         if(countstore > 0) {
         
         int perPage = 10; // 한 페이지에 보일 글의 갯수
         int startRow = (page - 1) * perPage + 1;
         int endRow = page * perPage;
         
         List<StoreDto> storelist = service.storesearch(ssearchn,ssearch,startRow, endRow);
         m.addAttribute("sList", storelist);

         int pageNum = 5;
         int totalPages = countstore / perPage + (countstore % perPage > 0 ? 1 : 0); //전체 페이지 수
         
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
         m.addAttribute("countstore", countstore);
         m.addAttribute("ssearchn", ssearchn);
         m.addAttribute("ssearch", ssearch);
         
         return "store/storesearch";
      }
     //음식점삭제
     @GetMapping("/store/deletestore")
     public String deletestore (int storeid) {
        service.deletestore(storeid);
        return "redirect:/store/storelist";
     }
     
     @Override
   public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
      context= (WebApplicationContext)applicationContext;
   
   }
}