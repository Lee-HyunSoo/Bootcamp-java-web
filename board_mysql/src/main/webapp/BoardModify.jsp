<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lhs.dao.*"%>
<% BoardDAO boarddao = (BoardDAO)request.getAttribute("board"); %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function boardList(){
		document.location = "boardList";
	}
</script>

<meta charset="UTF-8">
<title>게시판 수정 폼</title>
</head>
<body>
	<h2>게시판 수정 폼</h2>
	<form action="boardModify"  method="post" style="width: 70%; height: 40%;">
		제목<input type="text" name="subject" value=<%= boarddao.getSubject() %>><br />
		글쓴이<input type="text" name="writer" value=<%= boarddao.getWriter() %>><br />
		<textarea name="contents" style="width: 100%; height: 150px;"><%= boarddao.getContents() %></textarea> <br />
		<input type="hidden" name="num" value=<%=boarddao.getNum()%>>
		<input type="submit" value="저장">
	</form>
	<input type="button" value="목록" onclick="boardList()">

</body>
</html>