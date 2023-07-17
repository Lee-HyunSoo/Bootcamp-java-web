<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_basic.jsp</title>
</head>
<body>
<%-- 	EL 표현식 : <%= %> 대신 ${"출력내용"} 를 이용하여 화면에 출력 --%>
	1. JSP 방식 <br>
	<% out.print("EL"); %> <br><br>
	
	2. JSP 방식 <br>
	<%= "EL" %> <br><br>
	
	3. EL 방식 <br>
	${"EL"} <br><br>

</body>
</html>