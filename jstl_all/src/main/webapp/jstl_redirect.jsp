<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_redirect.jsp : redirect 태그 (response.sendRedirect()</title>
</head>
<body>
	이동 전
	<c:redirect url="jstl_url.jsp"></c:redirect>
	이동 후
</body>
</html>