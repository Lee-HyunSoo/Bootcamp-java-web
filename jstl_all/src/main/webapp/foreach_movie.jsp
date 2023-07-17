<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String[] movieList = {"분질", "알라딘", "위맨", "범죄도시", "범죄도시2"};
	/* 해당 페이지 내에서만 사용하기 위해 */
	pageContext.setAttribute("movieList", movieList); 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foreach_movie.jsp : forEach</title>
</head>
<body>
	<c:forEach var="movie" items="${movieList}">
		${movie} <br>
	</c:forEach>
</body>
</html>