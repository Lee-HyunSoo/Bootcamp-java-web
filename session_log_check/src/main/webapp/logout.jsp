<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<%session.invalidate(); // session 값을 없애는 메서드%>
	<script type="text/javascript">
		alert("로그아웃 되었습니다.")
		document.location = "login.jsp";
	</script>	
</body>
</html>