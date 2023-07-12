<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.lhs.Post" %>

<%
	request.setCharacterEncoding("UTF-8"); // post로 데이터를 받기 때문
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pw = (String)request.getParameter("pw");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정</title>
</head>
<body>
	<h2>게시판 글 수정</h2>
	<hr/>
 	<form action="ModifyPost.jsp?idx=<%=idx%>&pw=<%=pw%>" method="POST">
        글쓴이: <input type="text" name="name" required="required" autofocus /><br />
        E-mail: <input type="email" name="email" placeholder="xxx@xxx.xxx" required /><br />
        제목: <input type="text" name="title" required="required" /><br />
        내용: <textarea rows = "5" cols="50" name="content" required="required"></textarea><br/>
        비밀번호: <input type="password" name="pwd" required="required"/> [수정시 필요] <br/>
        <input type="submit" value="Save">
    </form>

</body>
</html>