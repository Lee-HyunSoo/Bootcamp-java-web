<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_addition_result.jsp : 입력받은 수 출력</title>
</head>
<body>
	1. JSP 방식 <br>
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	%>
	<%= num1 %> + <%= num2 %> = <%= num1 + num2 %>
	<br><hr><br>
	2. EL 방식 <br>
	${param.num1} + ${param.num2} = ${param.num1 + param.num2}
	<br><hr><br>
</body>
</html>