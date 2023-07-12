<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 - 결과 화면 (목록))</title>
</head>
<script type="text/javascript">
	// obj라는 매개변수는 this라는 값을 전달받는다. 여기서 this는 select 태그 자기자신이다.
	function postDetail(obj) { 
		if (obj.selectedIndex == 0) { // 항목 선택 없음
			alert("항목을 선택해주세요.")
			return;
		}
		// javascript는 변수에 대한 타입이 없다. 때문에 변수를 선언할 때는 var를 이용한다.
		var selIDX = obj[obj.selectedIndex].text;
		alert(selIDX + "파일이 선택되었습니다.");
		// 파일 선택 후 파일을 읽을놈한테 보내줘야한다. BBSPostReader.jsp?sel=selIDX
		document.location = "BBSPostReader.jsp?sel=" + selIDX;
	}
	
	function postWrite() {
		document.location = "BBSInput.html";
	}
</script>

<!-- 
		1. bbs 폴더에 있는 파일 목록 (파일명)
		 - File.class
		 - File.list() : 해당 경로에 있는 폴더명, 파일명들을 배열 형태로 반환
		2. 파일명을 이용하여 목록화 -> for문
		 - <select><option>파일명</option></select>
		3. 파일명 목록 중 선택한 파일명만 추출
		 - event : onChange 
-->
<body>
	<!-- 제목을 붙일 때 h 태그를 많이 사용 -->
	<h2>파일형 게시판 목록</h2> 
	<!-- id : javascript에서 해당 태그에 대한 객체를 찾을 때 -->
	<select id="sID" cols="30" size="10" onchange="postDetail(this)"> 
		<!-- select 태그 내의 option 들은 selectedIndex라는 변수로 각각의 index가 존재한다. -->
		<option>보고싶은 파일을 선택하세요</option>
		<% 
			String filePath = application.getRealPath("/WEB-INF/bbs/"); // 지정 폴더까지만 가서, 파일이름만 가져오기위해
			File f = new File(filePath);
			String[] sFN = f.list(); // 지정 폴더 내의 파일명들을 문자열로 반환
			 
			for (String s : sFN) {
				out.print("<option>" + s + "</option>");
			}
		%>
	</select>
	<input type="button" value="글쓰기" onclick="postWrite()" /> 
</body>
</html>