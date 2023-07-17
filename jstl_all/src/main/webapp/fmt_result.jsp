<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt_result.jsp : 한글 깨짐 방지 (post 방식일때)</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/> <!-- request.setCharacterEncoding("UTF-8") -->
	<c:out value="${param.text}"></c:out>
</body>
</html>