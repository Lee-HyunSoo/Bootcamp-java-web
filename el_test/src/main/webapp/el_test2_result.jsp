<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test_result.jsp : </title>
</head>
<body>
	1. == 비교 결과 : ${param.id == "admin"} <br>
	2. .equals 비교 결과 : ${param.id.equals("admin")} <br>
	3. String 객체로 비교 <br>
		String s1 = "test" <br>
		String s2 = new String("test2") <br>
	4. 값이 없을 경우 확인 <br>
		${empty param.id} : null 이면 true, 아니면 false <br>
</body>
</html>