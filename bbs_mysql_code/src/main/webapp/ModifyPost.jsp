<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>

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
	String pw = (String)request.getParameter("pw");
	
	if (pw.equals((String)request.getParameter("pwd"))) {
		PreparedStatement pstmt = null;
		try {
		    pstmt = conn.prepareStatement("update guest set NAME = ?, EMAIL = ?, TITLE = ?, CONTENT = ? where IDX = ?");
		    pstmt.setString(1, (String)request.getParameter("name"));
		    pstmt.setString(2, (String)request.getParameter("email"));
		    pstmt.setString(3, (String)request.getParameter("title"));
		    pstmt.setString(4, (String)request.getParameter("content"));
		    pstmt.setInt(5, Integer.parseInt(request.getParameter("idx")));
		    
		    pstmt.executeUpdate();
		} catch (SQLException e) {
		    System.out.println("updateHIT ERR: " + e.getMessage());
		} finally {
		    pstmt.close();
		}
		response.sendRedirect("PostList.jsp");
	}
	else {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter outs = response.getWriter();
		 
		outs.println("<script>alert('비밀번호가 틀렸습니다.'); location.href='PostModify.jsp?idx=" + idx + "&pw=" + pw + "';</script>");
		 
		outs.flush();

	}
%>