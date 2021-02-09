function sel_all(frm){
		frm.action = "selectAll.jsp";
	frm.submit();
}

function sel_one(frm){
	frm.action = "selectOneID.jsp";
	frm.submit();
}

function add_go(frm){
	if(frm.id.value.trim() == ""){
		alert("아이디(ID)는 필수 입력 항목입니다.\n반드시 입력해주세요");
		frm.id.value = "";
		frm.id.focus();
		return false;
	}
	frm.action = "insertMember.jsp";
	frm.submit();
}

function del_go(frm){
	if(frm.id.value.trim() == ""){
		alert("아이디(id)는 필수 입력 항목입니다.\n반드시 입력해주세요");
		frm.id.value = "";
		frm.id.focus();
		return false;
	}
	
	frm.action = "deleteMember.jsp";
	frm.submit();
	
}