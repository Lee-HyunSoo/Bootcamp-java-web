package com.lhs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logCheck")
public class LogCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String id = "admin";
	private final String pw = "1234";
	private final String name = "관리자";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(5);
		
		if (id.equals(request.getParameter("ID")) && pw.equals(request.getParameter("PW"))) {
			session.setAttribute("user", name);
			response.sendRedirect("main.jsp");
		}
		else {
			response.sendRedirect("login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
