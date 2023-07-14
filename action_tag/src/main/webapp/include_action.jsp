<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include action.jsp</title>
</head>
<body>
	<hr>
	<jsp:include page="footer.jsp">
		<jsp:param value="<%=request.getParameter(\"strID\") %>" name="strID"/>
		<jsp:param value="<%=request.getParameter(\"strPW\") %>" name="strPW"/>
	</jsp:include>
	<hr>
</body>
</html>