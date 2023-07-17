<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test_result.jsp : 입력받은 이메일, url 출력</title>
</head>
<body>
	<%-- EL 방식 : ${param.파라미터명} --%>
	email : ${param.email} <br>
	url : ${param.url} <br>
	
	<hr>
	<%-- EL 방식 : ${param["파라미터명"]} : 파라미터명을 for문을 돌릴 수 있다. --%>
	email : ${param["email"]} <br>
	url : ${param["url"]}
</body>
</html>