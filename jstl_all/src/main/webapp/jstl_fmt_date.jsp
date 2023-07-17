<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_fmt_date.jsp : core와 format 라이브러리 사용(날짜)</title>
</head>
<body>
	<%-- ${now} : Mon Jul 17 14:17:39 KST 2023 --%>
	<c:set var="now" value="<%= new Date() %>"></c:set>
	\${now} : ${now}
	
	<hr>
	<!-- 2023. 7. 17. -->
	<fmt:formatDate value="${now}"/> <!-- 기본이 date라 날짜만 나옴 -->
	
	<hr>
	<!-- 날짜 : 2023. 7. 17. -->
	날짜 : <fmt:formatDate value="${now}" type="date"/><br>
	<!-- 시간 : 오후 2:17:39 -->
	시간 : <fmt:formatDate value="${now}" type="time"/><br>
	<!-- 둘다 : 2023. 7. 17. 오후 2:17:39 -->
	둘다 : <fmt:formatDate value="${now}" type="both"/><br>
	
	<hr>
	<fmt:formatDate value="${now}" type="both" dateStyle="default" timeStyle="default"/><br> <!-- default = medium -->
	<fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short"/><br>
	<fmt:formatDate value="${now}" type="both" dateStyle="medium" timeStyle="medium"/><br>
	<fmt:formatDate value="${now}" type="both" dateStyle="long" timeStyle="long"/><br>
	<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br>
	<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/><br>

	<hr>
	<h4>타임존 (지역) 변경</h4>
	korea KST <br>
	<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br>
	
	SWISS GMT <br>
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br>
	</fmt:timeZone>
	
	NewYork GMT-8 <br>
	<fmt:timeZone value="GMT-8">
		<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br>
	</fmt:timeZone>
	
	<hr>
	<h4>지역화폐</h4>
	<!-- 주의점 : 실제로 locale을 바꿔야 적용된다. -->
	톰캣 서버 locale 변경 : <%=response.getLocale() %> <br>
	<fmt:setLocale value="ko_kr"/>
	한국통화(화폐) : <fmt:formatNumber value="10000" type="currency"></fmt:formatNumber> <br>
	날짜 : <fmt:formatDate value="${now}"/> <br>
	
	<fmt:setLocale value="ja_jp"/>
	일본통화(화폐) : <fmt:formatNumber value="10000" type="currency"></fmt:formatNumber> <br>
	날짜 : <fmt:formatDate value="${now}"/> <br>
	
	<fmt:setLocale value="en_US"/>
	미국통화(화폐) : <fmt:formatNumber value="10000" type="currency"></fmt:formatNumber> <br>
	날짜 : <fmt:formatDate value="${now}"/> <br>
</body>
</html>