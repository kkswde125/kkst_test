<%@page import="com.hk.board.dtos.HkBoardDto"%>
<%@page import="java.util.List"%>
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
<title>글목록</title>
<style type="text/css">
table {
	width: 600px;
}
</style>

<script type="text/javascript">

	function insertForm() {
		location.href="insertform.do";
	}


</script>
</head>
<body>
	<%
// 		Object obj=request.getAttribute("lists");
// 		List<YoungSangDto> list=(List<YoungSangDto>)obj;
	
		List<HkBoardDto> lists=(List<HkBoardDto>)request.getAttribute("lists");


	%>
	<h1>글목록 조회</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<%	if(lists.size()==0){
			%>
			<tr><td colspan="4">---작성된 글이 없습니다.</td></tr>
			<%
		}else{
			for(int i=0; i<lists.size(); i++){
				HkBoardDto dto=lists.get(i);
				%>
		<tr>
			<th><%=dto.getSeq() %></th>
			<th><%=dto.getId() %></th>
			<th><a href="detailboard.do?seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></th>
			<th><%=dto.getRegdate()%></th>
		</tr>
		<%
			}//for문
		}//else문
	%>

	<tr>
		<td colspan="4">
			<button onclick="insertForm()">글쓰기</button>
		</td>
	
	
	</tr>

	</table>
</body>
</html>