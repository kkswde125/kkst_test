<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기폼</title>
</head>
<script type="text/javascript">
function back(seq) {
	location.href="boardcontroller.jsp?command=detail&seq="+seq;
}
</script>
<body>
<h1>게시판 수정하기</h1>
<%
	//detailboard.jsp에서 수정버튼을 클릭해서 전달된 파라미터 seq를 받는다.
	
// 	YoungSangDto dto = (YoungSangDto)request.getAttribute("dto");

%>
<form action="updateboard.do" method="post">
	<input type="hidden" name="seq" value="${dto.seq}"/>
	<table border="1">
		<tr>
			<th>번호</th>
			<td>${dto.seq}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${dto.title}" /></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.regdate}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="content" >${dto.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정 완료"/>
				<input type="button" value="취소" onclick="back(${dto.seq})" />
			</td>
		</tr>
	</table>
</form>

</body>
</html>