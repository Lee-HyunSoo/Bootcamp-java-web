<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBeans_add_form.jsp : 사용자 값 입력</title>
</head>
<body>
	<form action="useBeans_result.jsp" method="post">
		<input type="text" name="name" size="20"> <br>
		<input type="text" name="userid" size="20"> <br>
		<input type="text" name="nickname" size="20"> <br>
		<input type="password" name="pwd" size="20"> <br>
		<input type="email" name="email" size="20"> <br>
		<input type="tel" name="phone" size="20"> <br>
		<input type="submit" value="전송">
		<input type="reset" value="입력취소">
	</form>
</body>
</html>