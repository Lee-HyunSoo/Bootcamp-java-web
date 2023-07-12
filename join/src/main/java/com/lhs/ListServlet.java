package com.lhs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/listTest")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * get으로 한글을 전달하면 깨지지 않지만 post로 전달하면 100% 깨진다.
		 * 하지만 모든 데이터를 get으로 전달할 순 없기 때문에, post를 사용하는 경우 request 인코딩을 바꿔줘야한다.
		 */
		request.setCharacterEncoding("UTF-8");
		ArrayList<String> lists = new ArrayList<String>();
		lists.add(request.getParameter("t1"));
		lists.add(request.getParameter("t2"));
		lists.add(request.getParameter("t3"));
		lists.add(request.getParameter("t4"));
		
		request.setAttribute("lists", lists);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ResultList.jsp");
		requestDispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
