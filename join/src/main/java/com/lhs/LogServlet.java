package com.lhs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/log")
public class LogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogServlet() {
        super();
    }

    /* 
	 * servlet -> jsp 데이터 전달
	 * 
     * request에서는 params 영역과 attribute 영역이 있다.
     * params 영역엔 웹에서 넘어온 데이터들이 담겨있고, attribute 영역엔 jsp로 넘겨줄 데이터를 담는다.
     * 담은 데이터를 jsp로 넘기기 위해 RequestDispatcher 객체를 사용한다.
     * 
     * 1. forword(request, response) : 현재 페이지에서 대상 페이지로 이동
	 * 2. include(request, response) : 현재 페이지 내부에 대상 페이지를 삽입
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// Attribute 는 객체를 전달할 때 사용한다.
		request.setAttribute("id", id); // jsp가 읽어들일 이름, 전달할 값
		request.setAttribute("pw", pw);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Result.jsp");
		requestDispatcher.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
