package springboot.project.intercepter;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import springboot.project.dto.MasterDto;
import springboot.project.dto.MemberDto;

@Component
public class Loginintercepter implements HandlerInterceptor {
	public List<String> loginEssential = Arrays.asList("/CSBoard/**","/room/**","/groupbuying/**","/Adminmain","/board/**","/fsboard/**","/foodstore/**","/petcare/**");

public List<String> loginInessential
     = Arrays.asList("/CSBoard/list/**","/CSBoard/content/**","/room/list","/groupbuying/list","/board/list","/fsboard/list","/foodstore","/petcare");

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberDto dto = (MemberDto) request.getSession().getAttribute("user");
		MasterDto mdto = (MasterDto) request.getSession().getAttribute("master");
		//System.out.println(dto != null);
		if (dto != null && dto.getMemberid() != null) {
			return true;
		}else if(mdto != null && mdto.getMasterid() != null){
			return true;
		}else {
			response.sendRedirect("/loginform");
			return false;
		}
	}
}