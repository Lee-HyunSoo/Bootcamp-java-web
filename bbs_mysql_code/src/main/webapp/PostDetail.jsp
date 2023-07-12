<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.lhs.Post" %>

<%
	String dbName = "bbs";
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/" + dbName + "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	String id_mysql = "root";
	String pw_mysql = "0000";
	
	Connection conn = null;
	try {
	    Class.forName(driver);
	    conn = DriverManager.getConnection(url, id_mysql, pw_mysql);
	    out.println("MySQL 접속 성공");
	} catch (ClassNotFoundException e) {
	    out.println("Class.forName(driver) ERR: " + e.getMessage());
	} catch (SQLException e) {
	    out.println("getConnection() ERR: " + e.getMessage());
	}
	
	request.setCharacterEncoding("UTF-8"); // post로 데이터를 받기 때문
	int idx = Integer.parseInt(request.getParameter("idx"));
	Post post = new Post();
    PreparedStatement pstmt = null;
    
    try {
        pstmt = conn.prepareStatement("update guest set HIT = ? where IDX = ?");
        pstmt.setInt(1, Integer.parseInt(request.getParameter("hit")) + 1);
        pstmt.setInt(2, Integer.parseInt(request.getParameter("idx")));
        
        pstmt.executeUpdate();
    } catch (SQLException e) {
        System.out.println("updateHIT ERR: " + e.getMessage());
    } finally {
        pstmt.close();
    }
    
    PreparedStatement pstmt1 = null;
    ResultSet rs = null;
    try {
        pstmt1 = conn.prepareStatement("select * from guest where IDX = ?");
        pstmt1.setInt(1, idx);
        rs = pstmt1.executeQuery();
        while (rs.next()) {
        	post.setIdx(rs.getInt("IDX"));
            post.setName(rs.getString("NAME"));
            post.setEmail(rs.getString("EMAIL"));
            post.setTitle(rs.getString("TITLE"));
            post.setContent(rs.getString("CONTENT"));
            post.setDate(rs.getString("MOMENT"));
            post.setPw(rs.getString("PASSWORD"));
            post.setHit(rs.getInt("HIT"));
        }
            
    } catch (SQLException e) {
        System.out.println("selectoneGuest ERR: " + e.getMessage());
    } finally {
        rs.close();
        pstmt1.close();
    }
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 상세보기</title>
<script type="text/javascript">
	function postModify(idx, pw) {
		document.location = "PostModify.jsp?idx=" + idx + "&pw=" + pw;
	}
	function postList() {
		document.location = "PostList.jsp";
	}
	function postDelete(idx) {
		document.location = "PostDelete.jsp?idx=" + idx;
	}
</script>

</head>
<body>
	<h2>게시판 글 상세보기</h2>
	<table border="1">
		<th>글번호</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
		<tr>
	    	<td><%=post.getIdx()%></td>
	    	<td><%=post.getName()%></td>
	    	<td><%=post.getDate()%></td>
	    	<td><%=post.getHit()%></td>
		</tr>
		<th>제목: <%=post.getTitle()%></th>
		<tr>
			<td><%=post.getContent()%></td>
		</tr>
    </table>
    <input type="button" value="modify" onclick="postModify(<%=post.getIdx()%>, <%=post.getPw()%>)">
    <input type="button" value="list" onclick="postList()">
    <input type="button" value="delete" onclick="postDelete(<%=post.getIdx()%>)">
</body>
</html>