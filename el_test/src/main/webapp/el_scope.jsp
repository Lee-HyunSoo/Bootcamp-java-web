<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 어떤 값을 저장할 때, 해당 값에 대한 수명 설정 : setAttribute() 를 이용
	// 1. 현재 페이지 내에서만 사용가능
	pageContext.setAttribute("name", "page Name");
	
	// 2. request객체가 살아있을 때 까지 사용가능
	request.setAttribute("name", "request Name");
	
	// 3. session객체가 invalidate 될 때까지 or 지정한 수명값이 다 될때까지 사용가능
	session.setAttribute("name", "session Name");
	
	// 4. application이 구동되는 동안 사용가능
	application.setAttribute("name", "application Name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_scope.jsp : 데이터를 저장하는 변수에 대한 scope</title>
</head>
<body>
	EL 방식으로 추출<br>
	pageContext (현재 페이지 내에 선언) : ${name} <br>
	request (request 객체 내에 선언) : ${requestScope.name} <br> <!-- request.getAttribute("name") 과 동일 -->
	session (session 객체 내에 선언) : ${sessionScope.name} <br> <!-- session.getAttribute("name") 과 동일 -->
	application (application 내에 선언) : ${applicationScope.name} <br>
	params (외부에서 전달받은 파라미터) : ${param.name} <br>	
</body>
</html>