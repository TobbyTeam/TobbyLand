/**
 *
 */

function infoConfirm() {
	if(document.reg_frm.member_id.value.length == 0) {
		alert("아아디는 필수 사항입니다.");
		reg_frm.member_id.focus();
		return;
	}

	if(document.reg_frm.member_id.value.length < 4) {
		alert("아아디는 4글자 이상이어야 합니다.");
		reg_frm.member_id.focus();
		return;
	}

	if(document.reg_frm.password.value.length == 0) {
		alert("비밀번호는 필수 사항입니다.");
		reg_frm.password.focus();
		return;
	}

	if(document.reg_frm.password.value != document.reg_frm.password_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.password.focus();
		return;
	}

	if(document.reg_frm.nickname.value.length == 0) {
		alert("닉네임은 필수 사항입니다.");
		reg_frm.nickname.focus();
		return;
	}

	if(document.reg_frm.email.value.length == 0) {
		alert("이메일은 필수 사항입니다.");
		reg_frm.email.focus();
		return;
	}

	document.reg_frm.submit();
}


function updateInfoConfirm() {
	if(document.mod_frm.password.value == "") {
		alert("패스워드를 입력하세요.");
		document.mod_frm.password.focus();
		return;
	}

	if(document.mod_frm.password.value != document.mod_frm.password_check.value) {
		alert("패스워드가 일치하지 않습니다.");
		mod_frm.password.focus();
		return;
	}

	if(document.mod_frm.nickname.value.length == 0) {
		alert("닉네임은 필수 사항입니다.");
		mod_frm.nickname.focus();
		return;
	}

	document.mod_frm.submit();

}