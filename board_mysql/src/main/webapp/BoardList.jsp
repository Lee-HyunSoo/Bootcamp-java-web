<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lhs.dao.*" %>
<%
	ArrayList<BoardDAO> boards = (ArrayList<BoardDAO>)request.getAttribute("boards");
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 목록</title>

<style type="text/css">
* {
	font-size: 9pt;
}

p {
	width: 600px;
	text-align: right;
}

table thead tr th {
	background-color: gray;
}
</style>
<script type="text/javascript">
	function boardWrite() {
		document.location = "BoardWrite.jsp";
	}
</script>
</head>
<body>
	<form name="searchForm" action="" method="get">
		<p>
			<select name="search">
				<option value="ALL">전체검색</option>
				<option value="SUBJECT">제목</option>
				<option value="WRITER">작성자</option>
				<option value="CONTENTS">내용</option>
			</select> 
			<input type="text" name="keyword" value="" /> 
			<input type="submit" value="검색" />
		</p>
	</form>

	<table border="1" summary="게시판 목록">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="50" />
			<col width="300" />
			<col width="80" />
			<col width="100" />
			<col width="70" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록 일시</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<%if (boards.size() == 0) { %>
			<tr>
				<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
			</tr>
			<%} else {%>
				<%for (BoardDAO board : boards) {%>
					<tr>
						<td align="center"><%=board.getNum()%></td>
						<td><a href="boardDetail?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
						<td align="center"><%=board.getWriter()%></td>
						<td align="center"><%=board.getReg_date()%></td>
						<td align="center"><%=board.getHit()%></td>
					</tr>
				<%}%>
			<%}%>
		</tbody>
		<tfoot>
			<tr>
				<td align="center" colspan="5">1</td>
			</tr>
		</tfoot>
	</table>
	<!-- //게시판 목록 영역 -->
	<!-- 버튼 영역 -->
	<p>
		<input type="button" value="목록" onclick="boardList()" />
		<input type="button" value="글쓰기" onclick="boardWrite()" />
	</p>
	<!-- //버튼 영역 -->
</body>
</html>