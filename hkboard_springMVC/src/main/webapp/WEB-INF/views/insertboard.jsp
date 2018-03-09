<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 폼</title>



<script type="text/javascript">
	function boardlist() {
		location.href="boardlist.do";
	}

</script>



</head>
<body>

	<h1>게시판글쓰기</h1>
	<form action="insertboard.do" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성완료" />
								<input type="button" value="목록" onclick="boardlist()">
				
				</td>
			</tr>
		</table>
	</form>
</body>
</html>