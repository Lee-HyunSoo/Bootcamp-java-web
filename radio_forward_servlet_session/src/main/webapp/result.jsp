<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp : 선택한 혈액형 파일 forward</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%> 
	<jsp:forward page="<%=request.getParameter(\"bloodtype\") + \".jsp\"%>">
		<jsp:param value="" name=""/>
	</jsp:forward>
</body>
</html>