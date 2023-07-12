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
	
	request.setCharacterEncoding("UTF-8"); 
	int idx = Integer.parseInt(request.getParameter("idx"));
	
    PreparedStatement pstmt = null;
    try {
        pstmt = conn.prepareStatement("delete from guest where IDX = ?");
        pstmt.setInt(1, idx);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        System.out.println("deleteUseCoupon ERR: " + e.getMessage());
    } finally {
        pstmt.close();
    }
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter outs = response.getWriter();
	outs.println("<script>alert('삭제되었습니다.'); location.href='PostList.jsp';</script>");
	outs.flush();
	
 
%>