package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/send2")
public class SendServlet2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post 방식 전송했을때 한글이 깨지지않도록 인코딩 설정을 해준다.
		req.setCharacterEncoding("utf-8");
		//인코딩 설정을 한 이후에 파라미터를 추출하면 한글이 깨지지 않는다.
		String sendMsg=req.getParameter("msg");
		System.out.println("클라이언트가 전송한 문자열2 : "+sendMsg);
		
		//문자열 응답하기
		PrintWriter pw=resp.getWriter();
		pw.println("/test/send OK! !!");
		pw.close();
	}
}
