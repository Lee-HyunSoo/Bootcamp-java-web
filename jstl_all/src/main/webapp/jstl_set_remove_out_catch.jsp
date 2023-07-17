<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_set_remove_out_catch.jsp</title>
</head>
<body>
	<h4>set 태그 이용 변수 초기화</h4>
	<c:set var="age" value="30" scope="page"></c:set>
	
	<h4>out 태그를 이용하여 변수값 출력</h4>
	<c:out value="${age}"></c:out>
	
	<h4>remove 태그를 이용하여 변수 제거</h4>
	<c:remove var="age" scope="page"/>
	<c:out value="${age}"></c:out>
	
	<h4>예외처리</h4>
	<c:catch var="errorMsg">
		예외 발생 전 <br>
		<%= 10 / 0 %> <br>
		예외 발생 후 <br>
	</c:catch>
	<c:out value="${errorMsg}"></c:out>	
</body>
</html>