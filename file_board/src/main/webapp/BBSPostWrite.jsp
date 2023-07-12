<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.util.Date" %>
<%-- 게시판 글쓰기 - 처리 (화면에 보이지 않음) JSP 주석달기 --%>

<%
	request.setCharacterEncoding("UTF-8"); // post로 데이터를 받기 때문
	String name = request.getParameter("NAME");
	String title = request.getParameter("TITLE");
	String content = request.getParameter("CONTENT");
			
	// 파일명(날짜시간) 자동생성
	Date date = new Date();
	Long time = date.getTime(); // 현재 날짜와 시간을 정수로 변환 -> 1970.1.1. 0:0:0부터 현재까지를 정수로 만들어준다.
	String filename = time + ".txt";
	
	// 파일 저장 성공여부 변수
	String result = "";
	
	// JSP에서 파일 다루기 : PrintWriter.class
	PrintWriter writer = null;
	
	// 외부파일을 다루기 때문에 예외처리
	try {
		// 1. WEB-INF/bbs 에 대한 실제 경로 추출 : application.getRealPath("대상")
		String filePath = application.getRealPath("/WEB-INF/bbs/" + filename);
		
		// 2. 전달받은 데이터를 사용 시 PrintWriter 객체가 필요하다.
		writer = new PrintWriter(filePath);
		
		// 3. 전달받은 각 데이터를 쓰기 : PrintWriter.printf();
		writer.printf("제목 : %s %n", title);
		writer.printf("이름 : %s %n", name);
		writer.printf("내용 : %s %n", content);
		
		result = "SUCCESS";
	} catch(IOException e) {
		result = "FAIL";
	} finally {
		try {
			writer.close();	
		} catch(Exception e) {
			
		}
	}
	
	// 다른(지정) 화면으로 바로 이동 : response.sendRedirect("대상");
	response.sendRedirect("BBSPostResult.jsp?RESULT=" + result);
	
	// response.sendRedirect() 사용 시 주의사항 : 메서드 아래에 코드는 무의미해진다. 만나자마자 화면이 넘어가기때문
%>
