<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_basic3.jsp : 산술 연산 및 비교 결과 출력</title>
</head>
<body>
<%-- ${ } 앞에 \ 를 붙이면 문자열로 인식한다 --%>
	\${5 + 2} : ${5 + 2} <br> 
	\${5 - 2} : ${5 - 2} <br> 
	\${5 mod 2} : ${5 mod 2} <br> <!-- 나머지 연산 --> 
	\${5 gt 2} : ${5 gt 2} <br> <!-- greater than --> 
	\${5 > 2 || (2 < 10) } : ${5 > 2 || (2 < 10) } <br> <!-- 논리 비교 -->
	
	<!-- if문을 연산식으로 표현 : 3항연산자 -->
	<!-- (비교조건) ? 참 : 거짓 --> 
	\${5 > 2} : ${5 > 2 ? 5 : 2} -> 만약 5가 2보다 크면 5를 출력, 아니면 2를 출력 <br>
	
	<!-- 어떤 변수의 값이 null 인지 확인 : empty -->
	<% String input = null; %>
	\${empty input} : ${empty input} <br>
</body>
</html>