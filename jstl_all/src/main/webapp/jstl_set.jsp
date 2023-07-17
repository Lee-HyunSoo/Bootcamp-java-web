<%@ page import="com.lhs.beans.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_set : set 태그</title>
</head>
<body>
	변수 설정 <br>
	<c:set var="msg" value="Hello"></c:set>
	\${msg} : ${msg}
	<hr>
	<c:set var="age">100</c:set>
	\${age} : ${age}
	<hr>
	<c:set var="add" value="${100 + 200}"></c:set>
	\${add} : ${add}
	<hr>
	<c:set var="flag" value="${10 > 5}"></c:set>
	\${flag} : ${flag}
	<hr>
	<c:set var="member" value="<%= new MemberBean() %>"></c:set>
	\${member} : ${member}
	<hr>
</body>
</html>