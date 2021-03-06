<%@page import="com.bc.mybatis.GuestBookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlSession ss = DBService.getFactory().openSession();
	List<GuestBookVO> list = ss.selectList("guestbook.all");
	ss.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 목록</title>
<link href="/08_GuestBook/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="container">
	<h2>방명록</h2>
	<hr>
	<p><a href="write.jsp">[방명록 쓰기]</a></p>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
<%
	if(list.size() > 0){
		for(GuestBookVO vo : list){
%>
		<tr>
			<td class="center"><%=vo.getIdx() %></td>
			<td class="center"><%=vo.getName() %></td>
			<td class="center"><a href="onelist.jsp?idx=<%=vo.getIdx()%>"><%=vo.getSubject() %></a></td>
			<td class="center"><%=vo.getRegdate() %></td>
		</tr>
<%
		}
	} else {
		out.print("<tr><td colspan='4'>검색된 데이터가 없습니다 ..</td></tr>");
	}
%>
		</tbody>
	</table>
</div>

</body>
</html>