<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwared action.jsp</title>
</head>
<body>
	<hr>
	<jsp:forward page="footer.jsp">
		<jsp:param value="<%=request.getParameter(\"strID\") %>" name="strID"/>
		<jsp:param value="<%=request.getParameter(\"strPW\") %>" name="strPW"/>
	</jsp:forward>
	<hr>
</body>
</html>