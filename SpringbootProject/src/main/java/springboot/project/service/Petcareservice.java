package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.PetcareDao;
import springboot.project.dto.PetFileDto;
import springboot.project.dto.PetcareDto;

@Service
public class Petcareservice {

	@Autowired
	PetcareDao dao;
	
	//寃뚯떆湲� �뿬遺�
	public int count() {
		return dao.count();
	}
	//寃뚯떆湲� 由ъ뒪�듃
	public List<PetcareDto> PetList(int start, int end){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		return dao.PetList(m);
	}
	//寃뚯떆湲� �긽�꽭蹂닿린
	public PetcareDto petlistone(int no) {
		return dao.petlistone(no);
	}
	
	public int pcount(int no) {
		return dao.pcount(no);
	}
	
	//寃��깋李� 寃��깋由ъ뒪�듃 
	public List<PetcareDto> petsearch(int searchn, String search,int start, int end){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		
		return dao.petsearch(m);
	}
	//寃��깋寃곌낵 媛��닔
	public int countSearch(int searchn, String search) {
		System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	//湲��쟻湲�
	public int insert(PetcareDto dto) {
		return dao.pinsert(dto);
	}
	
	//湲��닔�젙
	public int updatepboard(PetcareDto dto) {
		return dao.updatepboard(dto);
	}
	//湲��궘�젣
	public int deletepboard(int pno) {
		return dao.deletepboard(pno);
	}
	
	public List<PetcareDto> pranking(){
		return dao.pranking();
	}
	
	public int deletepetfile(int pno) {
		return dao.deletepetfile(pno);
	}
	
	public int updatepfile(PetFileDto dto) {
		return dao.updatepfile(dto);
	}
	
	public List<PetFileDto> pdata(int pno){
		return dao.pdata(pno);
	}
	public int puploadimg(PetFileDto dto) {
		return dao.puploadimg(dto);
	}
}
