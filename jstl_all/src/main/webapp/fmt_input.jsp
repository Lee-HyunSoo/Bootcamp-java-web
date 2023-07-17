<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt_input.jsp : 한글 입력</title>
</head>
<body>
	<form action="fmt_result.jsp" method="post">
		<input type="text" name="text" maxlength="20" placeholder="text">
		<input type="submit" value="전송">
	</form>
</body>
</html>