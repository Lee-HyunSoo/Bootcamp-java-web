<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
	String dbName = "bbs";
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/" + dbName + "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	String id_mysql = "root";
	String pw_mysql = "0000";
	LocalDateTime localDateTime = LocalDateTime.now();
    String time = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    int count = 0;
	
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
	
	PreparedStatement pstmt = null;
    try {
        pstmt = conn.prepareStatement("insert into guest values (NULL, ?, ?, ?, ?, ?, ?, ?)");
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, title);
        pstmt.setString(4, content);
        pstmt.setString(5, time);
        pstmt.setString(6, pw);
        pstmt.setInt(7, count);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        System.out.println("insert ERR: " + e.getMessage());
    } finally {
        pstmt.close();
    }
    response.sendRedirect("PostList.jsp");
%>