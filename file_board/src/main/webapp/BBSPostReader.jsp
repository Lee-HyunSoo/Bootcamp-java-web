<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 읽기 - 저장된 파일 선택 후, 출력</title>
<script type="text/javascript">
	function postList() {
		document.location = "BBSPostList.jsp";
	}

</script>
</head>

<body>
<%
	String selPath = request.getParameter("sel");
	BufferedReader br = null;
	
	try {
		String filePath = application.getRealPath("/WEB-INF/bbs/" + selPath);
		br = new BufferedReader(new FileReader(filePath));
		
		while(true) {
			String str = br.readLine();
			if (str == null)
				break;
			out.println(str + "<br/>");
		}
		
	} catch(FileNotFoundException e) {
		out.println(e.getMessage());
	} catch(IOException e) {
		out.println(e.getMessage());
	} finally {
		br.close();
	}
%>
	<input type="button" value="글목록" onclick="postList()"/>
</body>
</html>