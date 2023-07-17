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
<title>foreach_movie_ul.jsp : </title>
</head>
<body>
	<!-- 목록을 만들어주는 태그들. 내부에 li 태그가 있어야 한다. -->
	<ul>
		<li style="color: red; font-weight: bold;">테스트1</li>
		<li>테스트2</li>
		<li>테스트3</li>		
	</ul>
	<hr>
	<ol>
		<li>테스트1</li>
		<li>테스트2</li>
		<li>테스트3</li>		
	</ol>
	<hr>
	<ul>
		<c:forEach var="movie" items="${movieList}" varStatus="status">
			<c:choose>
				<c:when test="${status.count == 1}">
					<li style="color: red; font-weight: bold;">${movie}</li>
				</c:when>
				<c:otherwise>
					<li>${movie}</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	<hr>
	<c:forEach var="movie" items="${movieList}" varStatus="status">
		${movie}
		<c:if test="${not status.last}">,</c:if>
	</c:forEach>
</body>
</html>