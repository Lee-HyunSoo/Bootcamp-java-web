<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript">
	function postList() {
		document.location = "PostList.jsp";
	}
</script>
</head>
<body>
     <h2>게시판 글쓰기</h2>
     <form action="SavePost.jsp" method="POST">
        글쓴이: <input type="text" name="name" required="required" autofocus /><br />
        E-mail: <input type="email" name="email" placeholder="xxx@xxx.xxx" required /><br />
        제목: <input type="text" name="title" required="required" /><br />
        내용: <textarea rows = "5" cols="50" name="content" required="required"></textarea><br/>
        비밀번호: <input type="password" name="pw" required="required"/> [수정/삭제시 필요] <br/>
        <input type="submit" value="Save">
     </form>
     <input type="button" value="List" onclick="postList()">
     
</body>
</html>