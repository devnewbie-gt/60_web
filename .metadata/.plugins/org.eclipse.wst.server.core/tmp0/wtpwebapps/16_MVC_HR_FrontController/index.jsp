<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 선택</title>
<script>
	function all_search(frm){
		frm.action = "controller?type=all";
		frm.submit();
	}
	
	function dept_search(frm){
		frm.action = "controller?type=dept";
		frm.submit();
	}
	
	function fullname_search(frm){
		frm.action = "controller?type=fullname";
		frm.submit();
	}
	
	function search_go(frm) {
		frm.action = "controller?type=search";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>작업 선택</h1>
	<form method="post">
		<input type="button" value="전체 보기" onclick="all_search(this.form)">
		<input type="button" value="부서 코드 검색" onclick="dept_search(this.form)">
		<input type="button" value="성명 검색(성, 이름 포함)" onclick="fullname_search(this.form)">
		<input type="button" value="동적 검색" onclick="search_go(this.form)">
	</form>
</body>
</html>