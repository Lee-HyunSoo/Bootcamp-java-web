<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="com.lhs.beans.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="member"/> <!-- property 값의 * 을 통해 파라미터 명과 동일한 멤버변수 명에 값을 set -->
<% out.print(member); %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBeans_result.jsp : 전달 된 파라미터 명과 MemberBean의 멤버 변수를 자동 매핑</title>
</head>
<body>
	<hr>
	name : <jsp:getProperty property="name" name="member"/> <br>
	userid : <jsp:getProperty property="userid" name="member"/> <br>
	nickname : <jsp:getProperty property="nickname" name="member"/> <br>
	pwd : <jsp:getProperty property="pwd" name="member"/> <br>
	email : <jsp:getProperty property="email" name="member"/> <br>
	phone : <jsp:getProperty property="phone" name="member"/> <br>	 
</body>
</html>