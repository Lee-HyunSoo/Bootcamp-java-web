<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String[] movieList = {"분질", "알라딘", "위맨", "범죄도시", "범죄도시2"};
	/* 해당 페이지 내에서만 사용하기 위해. JSTL에 movieList를 쓰려면 있어야한다. */
	pageContext.setAttribute("movieList", movieList); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foreach_movie_table.jsp : forEach</title>
</head>
<body>
	<table>
		<tr>
			<th>INDEX</th>
			<th>COUNT</th>
			<th>TITLE</th>
		<tr>
		<!-- varStatus : index, count 값을 가지고 있다. -->
		<c:forEach var="movie" items="${movieList}" varStatus="status">
			<tr>
				<td>${status.index}</td>
				<td>${status.count}</td>
				<td>${movie}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>