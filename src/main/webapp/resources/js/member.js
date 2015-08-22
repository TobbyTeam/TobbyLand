/**
 *
 */

/*
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
*/
/*

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

};*/


$(document).ready(function() {

	$("#loginbtn").click(function(){
		if($("#loginid").val() == ""){
			alert("로그인 아이디를 입력해주세요");
			$("#loginid").focus();
		}else if($("#loginpwd").val() == ""){
			alert("로그인 비밀번호를 입력해주세요");
			$("#loginpwd").focus();
		}else{
/*			$("#loginfrm").attr("action", "<c:url value='${ctx}/j_spring_security_check' />");*/
			$("#loginfrm").submit();
		}
	});

	$("#pw_btn").click(function () {
		if($("#password").val() == "") {
			alert("비밀번호를 입력해주세요");
		}else{
			$.ajax({
				type: "POST",
				url: "/member/pwCheck",
				dataType: "json",
				data: {password: $("#password").val()},
				success: function (result) {

					if (result) {
						window.open("/member/modView", "_self");
					} else {
						alert("비밀번호가 틀립니다");
					}

				}
			})
		}
	})

	$("#withdrawal").click(function () {

		if (confirm("정말 탈퇴하시겠습니까?")) {

			$.ajax({
				type: "POST",
				url: "/member/withdrawal",
				dataType: "json",
				success: function (result) {

					if (result) {
						window.open("/login", "_self");
						alert("탈퇴 되었습니다.");
					} else {
						alert("죄송합니다. 다시 시도해주세요.");
					}

				}
			})

		}

	})

	$("#research_btn").click(function () {
		$.ajax({
			type: "POST",
			url: "/member/search",
			dataType: "json",
			data: {email: $("#email").val()},
			success: function (result) {

				if (result === 1 ) {
					alert("메일이 전송 되었습니다. 확인해주세요.");
					window.open("/login", "_self");
				} else if (result === 0){
					alert("등록되지 않은 메일입니다.");
				} else {
					alert("1일 메일요청 횟수 5회를 초과하셨습니다.");
				}

			}
		})
	})

})