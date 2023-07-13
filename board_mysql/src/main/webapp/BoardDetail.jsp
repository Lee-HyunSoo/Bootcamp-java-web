<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lhs.dao.*" %>

<%
	BoardDAO board = (BoardDAO)request.getAttribute("board");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세조회</title>
<script type="text/javascript">
	function boardModify(num) {
		document.location = "boardModify?num=" + num;
	}
	
	function boardList() {
		document.location = "boardList";
	}
	
	function boardDelete(num) {
		document.location = "boardDelete?num=" + num;
	}

</script>

</head>
<body>
	<h2>게시판 상세조회</h2>
	<table border="1">
		<th>제목</th>
		<tr>
			<td><%=board.getSubject()%></td>
		</tr>
		
		<th>작성자 / 조회수</th>
		<tr>
			<td><%=board.getWriter()%> / <%=board.getHit()%></td>
		</tr>
		
		<th>등록일시</th>
		<tr>
			<td><%=board.getReg_date()%></td>
		</tr>
		
		<th>내용</th>
		<tr>
			<td><%=board.getContents()%></td>
		</tr>
    </table>
    <input type="button" value="modify" onclick="boardModify(<%=board.getNum()%>)">
    <input type="button" value="list" onclick="boardList()">
    <input type="button" value="delete" onclick="boardDelete(<%=board.getNum()%>)">
</body>
</html>