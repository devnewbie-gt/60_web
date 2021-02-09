<%@page import="com.bc.mybatis.MemberVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	SqlSession ss = DBService.getFactory().openSession();
	MemberVO vo = ss.selectOne("member.selectOne", id);
	ss.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 검색 결과</title>
<script src="includee/event.js" type="text/javascript"></script>
</head>
<body>

	<%@ include file="includee/menu.jspf" %>
	
	<hr>
	<h1>ID 검색 결과</h1>
<%
	if(vo != null){
%>
	<ul>
		<li>
			<%=vo.getIdx() %>
			<%=vo.getId() %>
			<%=vo.getName() %>
		</li>
	</ul>
<%
	} else {
		out.print("<h2>검색된 데이터가 존재하지 않습니다.</h2>");
	}
%>

</body>
</html>