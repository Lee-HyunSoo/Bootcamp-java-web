<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%
	// logcheck.jsp는 내부에서 아이디, 비밀번호를 확인 후 main.jsp 또는 logout.jsp로 이동한다.
	// id : admin & pw : 1234
	String id = "admin";
	String pw = "1234";
	String name = "관리자";
	
	if (id.equals(request.getParameter("ID")) && pw.equals(request.getParameter("PW"))) {
		session.setAttribute("user", name);
		response.sendRedirect("main.jsp");
	}
	else {
		response.sendRedirect("login.jsp");
	}


%>
 --%>