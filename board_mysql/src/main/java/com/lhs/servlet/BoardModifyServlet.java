package com.lhs.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lhs.dao.BoardDAO;
import com.lhs.db.MySQLConnector;


@WebServlet("/boardModify")
public class BoardModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MySQLConnector mySQLConnector = new MySQLConnector();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO board = mySQLConnector.selectModifyData(Integer.parseInt(request.getParameter("num"))); 
		request.setAttribute("board", board);
		
		RequestDispatcher rd = request.getRequestDispatcher("BoardModify.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String subject = request.getParameter("subject");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		mySQLConnector.updateModifyData(num, subject, writer, contents);
		response.sendRedirect("/board_mysql/boardList");
	}

}
