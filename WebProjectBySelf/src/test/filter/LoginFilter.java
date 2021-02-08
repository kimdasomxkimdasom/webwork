package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/users/private/*"})
public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 1.로그인된 클라이언트인지 확인한다.
		//부모 type을 자식 type으로 casting!
		HttpServletRequest req=(HttpServletRequest)request;
		//자식 type을 이용해서 HttpSession 객체의 참조값을 얻어낸다.
		HttpSession session=req.getSession();
		//로그인된 아이디가 있는지 읽어와 본다.
		String id=(String)session.getAttribute("id");
		//만일 로그인된 상태라면 (세션에 "id"라는 키값으로 문자열이 저장이 되어있는지)
		if(id != null) {
			// 2.만일 로그인을 했으면 관여하지 않고 요청의 흐름을 이어간다.
			chain.doFilter(request, response);
		}else {
			// 3.로그인을 하지 않았으면 로그인 폼으로 이동할 수 있도록 리다이렉트 응답을 준다.
			String cPath=req.getContextPath();
			// ServletResponse type을 HttpServletResponse type으로 casting
			HttpServletResponse res=(HttpServletResponse)response;
			//이( ) 경로로 다시 재요청 페이지를 넘겨준다.
			res.sendRedirect(cPath+"/users/login_form.jsp");
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
