<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test_input.jsp : 사용자 입력</title>
</head>
<body>
	<form action="el_test_result.jsp" method="post">
		<input type="email" name="email"> <br>
		<input type="url" name="url"> <br>
		<input type="submit" value="전송">	
	</form>
</body>
</html>