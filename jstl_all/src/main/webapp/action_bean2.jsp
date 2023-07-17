<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 빈(beans) 객체 다루는 action tag(jsp:태그명)</title>
</head>
<body>
	<!-- id : MemberBean member & class : new MemberBean() -->
	<jsp:useBean id="member" class="com.lhs.beans.MemberBean"></jsp:useBean>
	
	<!-- property : 클래스 내부의 변수명 & name : 객체의 이름 -->
	<jsp:getProperty property="name" name="member"/> <!-- member.getName() -->
	<jsp:getProperty property="userid" name="member"/> <!-- member.getUserid() -->
	<hr>
	<!-- property : 클래스 내부의 변수명 & name : 객체의 이름 & value : 설정할 값 -->
	<jsp:setProperty property="name" name="member" value="lhs"/> <!-- member.setName() -->
	<jsp:setProperty property="userid" name="member" value="lhs"/> <!-- member.setUserid() -->
	
	<jsp:getProperty property="name" name="member"/>
	<jsp:getProperty property="userid" name="member"/>
</body>
</html>