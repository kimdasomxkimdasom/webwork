package test.filter;

import java.io.IOException;
import java.net.URLEncoder;

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

// web.xm1 필터 설정 대신에 annotation을 활용해서 필터를 동작하게 할 수 도 있다.
// 어느 위치를 필터를 적용할건지 괄호에 적는다
// 한개 이상의 위치를 적용할때는 urlPatterns = {}배열을 이용하면 된다.
// 자바에서의 배열은{ } 
@WebFilter(urlPatterns = {"/users/private/*","/cafe/private/*","/file/private/*","/gallery/private/*"})
public class LoginFilter implements Filter { //Filter implements해주기

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	//필터가 동작되면 호출되는 메소드
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
			/*
			*	로그인 페이지로 강제 리다이렉트가 됐다면,
			*	로그인 성공후에 원래 가려던 목적지로 다시 보내야 하고,
			*	GET방식 전송 파라미터가 있다면, 파라미터 정보도 같이 가져갈 수 있도록 해야한다.
			*
			*/
			//원래 가려던 url정보 읽어오기
			String url=req.getRequestURI();
			//GET방식 전송 파라미터를 query문자열로 읽어오기 (a=xxx&b=xxx)
			String query=req.getQueryString();
			//특수문자는 인코딩을 해야한다.
			String encodedUrl=null;
			if(query==null) {//전송 파라미터가 없다면
				encodedUrl=URLEncoder.encode(url);
			}else{
				// 원래 목적지가 /test/xxx.jsp 라고 가정하면 아래와 같은 형식의 문자열을 만든다.
				// "/test/xxx.jsp?a=xxx&b=xxx ..."
				encodedUrl=URLEncoder.encode(url+"?"+query);
			}
			
			// 3.로그인을 하지 않았으면 로그인 폼으로 이동할 수 있도록 리다이렉트 응답을 준다.
			String cPath=req.getContextPath();
			// ServletResponse type을 HttpServletResponse type으로 casting
			HttpServletResponse res=(HttpServletResponse)response;
			//이( ) 경로로 다시 재요청 페이지를 넘겨준다.
			res.sendRedirect(cPath+"/users/loginform.jsp?url="+encodedUrl);
		}
		
		
		
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
