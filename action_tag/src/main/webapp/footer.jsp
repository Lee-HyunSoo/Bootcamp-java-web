<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer.jsp 전달 받은 값 출력</title>
</head>
<body>
아이디 : <%= request.getParameter("strID") %>
비밀번호 : <%= request.getParameter("strPW") %>
</body>
</html>