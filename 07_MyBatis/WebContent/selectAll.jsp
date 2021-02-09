<%@page import="com.bc.mybatis.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	SqlSession ss = DBService.getFactory().openSession();

	List<MemberVO> memberList = ss.selectList("member.selectAll");
	ss.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표준화면</title>
<script src="includee/event.js" type="text/javascript"></script>
</head>
<body>

	<%@ include file="includee/menu.jspf" %>
	
	<hr>
	<h1>전체 데이터 검색</h1>
	<ul>
<%
	if(memberList.size() > 0){
		for(MemberVO vo : memberList) { %>
		<li>
			<%=vo.getIdx() %> ::
			<%=vo.getId() %> ::
			<%=vo.getName() %> ::
			<%=vo.getAddress() %> ::
		</li>	
<%		}
	} else {
		out.print("<li>조회(검색) 데이터가 존재하지 않습니다.</li>");
	}
%>
	</ul>

</body>
</html>