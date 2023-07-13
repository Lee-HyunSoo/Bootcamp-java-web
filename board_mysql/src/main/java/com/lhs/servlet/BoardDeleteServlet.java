package com.lhs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lhs.db.MySQLConnector;

@WebServlet("/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MySQLConnector mySQLConnector = new MySQLConnector();
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num")); 
		mySQLConnector.deleteBoard(num);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter outs = response.getWriter();
		outs.println("<script>alert('삭제되었습니다.'); location.href='boardList';</script>");
		outs.flush();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
