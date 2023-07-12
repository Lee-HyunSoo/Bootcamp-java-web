<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// request.getAttribute로 값을 꺼낼 때, 받은 값들이 Object 객체로 감싸져 있기 때문에 형변환을 해야한다.
	String id = (String)request.getAttribute("id");
	String pw = (String)request.getAttribute("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%= id %>
	<%= pw %>
</body>
</html>