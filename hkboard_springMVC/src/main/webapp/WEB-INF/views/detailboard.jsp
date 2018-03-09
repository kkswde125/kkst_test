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
<title>Insert title here</title>
<script type="text/javascript">
	
	function updateBoard(seq) {
		//수정폼으로 이동할때도 글하나에 대한 정보를 구해야 하기 때문에 seq를 전달한다(get방식)
		location.href="updateform.do?seq="+seq;
	}

	function deletepage(seq) {
 		
			location.href="deleteboard.do?seq="+seq;
 		
	}
	
	function back() {
		location.href="boardcontroller.jsp?command=boardlist";
	}
</script>

</head>
<body>
<%
	//파라미터 받는 메서드 : getParameter("key") -- 타입은 String
// 	YoungSangDto dto=(YoungSangDto)request.getAttribute("dto");
	
	
%>
	<h1>게시판 상세보기</h1>
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
			<td>${dto.title}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.regdate}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.content}
			</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="updateBoard(${dto.seq})">수정</button>
				<input type="button" value="삭제" onclick="deletepage(${dto.seq})"/>
				<button onclick="location.href='boardlist.do'">목록</button>
			</td>
		</tr>
	</table>


<!-- JSP태그 (scriptlet과 expression) -->
<!-- 	<h1>게시판 상세보기</h1> -->
<!-- 	<table border="1"> -->
<!-- 		<tr> -->
<!-- 			<th>번호</th> -->
<%-- 			<td><%=dto.getSeq()%></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>이름</th> -->
<%-- 			<td><%=dto.getName()%></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>제목</th> -->
<%-- 			<td><%=dto.getTitle()%></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>작성일</th> -->
<%-- 			<td><%=dto.getRegDate()%></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>내용</th> -->
<%-- 			<td><textarea rows="10" cols="60" readonly="readonly"><%=dto.getContent()%> --%>
<!-- 			</textarea></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="2"> -->
<%-- 				<button onclick="updateBoard(<%=dto.getSeq()%>)">수정</button> --%>
<%-- 				<input type="button" value="삭제" onclick="deletepage(<%=dto.getSeq()%>)"/> --%>
<!-- 				<button onclick="back()">목록</button> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
</body>
</html>