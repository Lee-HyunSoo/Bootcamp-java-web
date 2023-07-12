package com.lhs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * HttpServletRequest : 브라우저에서 들어온 데이터를 저장
 * HttpServletResponse : java에서 브라우저로 내보낼 데이터
 * 
 * servlet은 request와 response를 직접 만들어 사용해야하는 반면 jsp는 request 와 response 가 내장객체로 존재한다.
 * 
 * cookie : 웹 브라우저에 임시저장 (객체 생성)
 * session : 서버 내에 임시저장 (내장 객체)
 * 
 */
@WebServlet("/test") // 서블릿을 호출하는 웹 주소
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; // 톰캣 서버가 해당 서블릿을 구별할 수 있는 유일한 값이기 때문에 수정 및 삭제 불가
       
	
    public TestServlet() {
        super();
    }


    // <form action="/test" method="get"></form>
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	// <form action="/test" method="post"></form>
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
	}

}
