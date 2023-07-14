<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 메인페이지</title>
</head>
<body>
	<%if(session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp");	
	}
	else {%>
		<%=session.getAttribute("user")%> 님이 접속되었습니다.
		<form action="logout.jsp" method="post">
			<input type="submit" value="로그아웃">
		</form>
	<%}%>
</body>
</html>