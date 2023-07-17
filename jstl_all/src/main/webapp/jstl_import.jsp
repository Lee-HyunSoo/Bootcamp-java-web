<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_import.jsp : import 태그</title>
</head>
<body>
	<c:import url="http://localhost:8080/jstl_all/jstl_url.jsp" var="data"></c:import>
	${data}
</body>
</html>