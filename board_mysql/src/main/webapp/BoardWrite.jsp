<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 폼</title>
<script type="text/javascript">
	function boardList() {
		document.location = "boardList";
	}
</script>

</head>
<body>
	<h2>게시판 등록 폼</h2>
	<form action="boardWrite" method="POST">
	  제목: <input type="text" name="subject" required="required" autofocus  /><br />
	  글쓴이: <input type="text" name="writer" required="required" /><br />
	  내용: <textarea rows = "5" cols="50" name="contents" required="required"></textarea><br/>
	  <input type="submit" value="저장">
	</form>
	<input type="button" value="List" onclick="boardList()">
</body>
</html>