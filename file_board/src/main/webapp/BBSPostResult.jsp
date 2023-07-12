<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 게시판 글쓰기 - 처리 결과 (화면에 보이지 않음 : 추후 ERROR 페이지로 사용 --%>

<%
	String result = request.getParameter("RESULT");
	if(result.equals("SUCCESS")) {
		// 웹 브라우저에 출력 : out.print()
		out.println("파일이 성공적으로 저장되었습니다.");
	}
	else {
		out.println("파일 저장을 실패했습니다. 저장 경로를 확인해주세요.");
	}
	
	// 목록 화면으로 이동
	response.sendRedirect("BBSPostList.jsp");
%>