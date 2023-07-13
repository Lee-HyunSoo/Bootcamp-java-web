package com.lhs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lhs.dao.BoardDAO;
import com.lhs.db.MySQLConnector;

@WebServlet("/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<BoardDAO> boards = new ArrayList<BoardDAO>();
	private MySQLConnector mySQLConnector = new MySQLConnector();
	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("search");
		String keyword = request.getParameter("keyword");
		
		if (name == null || keyword == null) {
			boards = mySQLConnector.selectAllList();
			request.setAttribute("boards", boards);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("BoardList.jsp");
			requestDispatcher.forward(request, response);
		}
		else {
			boards = mySQLConnector.searchKeyword(name, keyword);
			request.setAttribute("boards", boards);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("BoardList.jsp");
			requestDispatcher.forward(request, response);
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
