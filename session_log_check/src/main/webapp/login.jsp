<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<form action="logCheck" method="post">
		<label>아이디 : </label><input type="text" name="ID" maxlength="10" required="required"> <br/>
		<label>비밀번호 : </label><input type="password" name = "PW" maxlength="10" required="required"> <br/>
		<input type="submit" value="로그인">
	</form>
</body>
</html>