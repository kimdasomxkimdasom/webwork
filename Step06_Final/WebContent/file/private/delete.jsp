<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//1. GET방식 전달되는 삭제할 파일 번호를 읽어온다.
 	int num=Integer.parseInt(request.getParameter("num"));
 
 	//2. DB에서 해당 파일의 정보를 읽어온다.
 	FileDto dto=FileDao.getInstance().getData(num);
 	//만일 로그인된 아이디와 글작성자가 다르면 에러를 응답한다.
 	String id=(String)session.getAttribute("id"); //로그인된 아이디
 	if(!dto.getWriter().equals(id)){
 		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일 지우면 혼난당 ! ");
 												//403페이지
 		return; //메소드 종료
 	}
 	//3. DB에서 파일 정보를 삭제한다.
 	FileDao.getInstance().delete(num);
 	
 	//4. 파일시스템 (upload 폴더)에 저장된 파일을 삭제한다.
 	/*
 		Linux 파일 경로 구분자가 슬래시(/)
 		Window 파일 경로 구분자가 역슬래시(\)
 		File.separtor로 운영체제에 맞게끔 알맞은 파일 구분자를 얻어 낼 수 있다.
 	*/
 	//삭제할 파일의 경로 
 	String path=application.getRealPath("/upload")+
 		File.separator+dto.getSaveFileName(); //File import
 	//삭제할 파일을 access할 수 있는 File객체 생성
 	File file=new File(path);
 	if(file.exists()){
 		file.delete();
 	}
 	
 	//5. 응답하기(리다이렉트) 
 	String cPath=request.getContextPath();
 	response.sendRedirect(cPath+"/file/list.jsp");
 	
 	//리다이렉트 방식으로 응답할거기 때문에 html필요없음
 %>