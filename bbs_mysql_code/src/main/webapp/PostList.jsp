<%@page import="java.util.ArrayList"%>
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
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String pw = request.getParameter("pw");
	int count = 0;
	
	ArrayList<Post> posts = new ArrayList<Post>();
	
    Statement stmt = null;
    ResultSet rs = null;

    try {
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from guest order by IDX desc");
        while(rs.next()) {
        	Post post = new Post();
        	post.setIdx(rs.getInt("IDX"));
            post.setName(rs.getString("NAME"));
            post.setEmail(rs.getString("EMAIL"));
            post.setTitle(rs.getString("TITLE"));
            post.setContent(rs.getString("CONTENT"));
            post.setDate(rs.getString("MOMENT"));
            post.setPw(rs.getString("PASSWORD"));
            post.setHit(rs.getInt("HIT"));
            posts.add(post);
        }
    } catch (SQLException e) {
        System.out.println("selectAllguest ERR: " + e.getMessage());
    } finally {
    	rs.close();
        stmt.close();
    }
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 목록</title>
<script type="text/javascript">
	function postWrite() {
		document.location = "PostWrite.jsp";
	}
	
</script>

</head>
<body>
	<h2>게시판 글 목록</h2>
	<hr/>
	<table border="1">
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
		<th>조회</th>
		<%for (Post p : posts) {%>
			<tr>
		    	<td><%=p.getIdx()%></td>
		    	<td><a href="PostDetail.jsp?idx=<%=p.getIdx()%>&hit=<%=p.getHit()%>" style="text-decoration: none;"><%=p.getTitle()%></a></td>
		    	<td><%=p.getName()%></td>
		    	<td><%=p.getDate()%></td>
		    	<td><%=p.getHit()%></td>
			</tr>	
		<%}%>
    </table>
    <input type="button" value="prev" onclick="prev()">
    <input type="button" value="write" onclick="postWrite()">
    <input type="button" value="next" onclick="next()">
</body>
</html>