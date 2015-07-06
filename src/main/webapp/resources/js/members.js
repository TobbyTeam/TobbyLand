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

$(function() {
	$("#reg_frm").validate({
		onfocusout: false,
		rules: {
			member_id: {
				required: true,
				minlength: 5,
				remote: {type: "post", url:"/member/idCheck", data: { member_id : function() { return $("#member_id").val(); } } }
			}, password: {
				required: true,
				rangelength: [5, 12]
			}, password_check: {
				required: true,
				rangelength: [5, 12],
				equalTo: '#password'
			}, email: {
				required: true,
				email: true,
				remote: {type: "post", url:"/member/emailCheck", data: { email : function() { return $("#email").val(); } } }
			}, nickname: {
				required: true
			}
		}, messages: {
			member_id: {
				required: "이름을 입력하세요.",
				minlength: $.validator.format("이름은 최소 5 글자 이상 입력하세요."),
				remote: "아이디 중복입니다."
			}, password: {
				required: "패스워드를 입력하세요.",
				rangelength: $.validator.format("패스워드 최소 5글자 이상 12글자 이하로 입력하세요.")
			}, password_check: {
				required: "패스워드 확인 입력하세요.",
				rangelength: $.validator.format("패스워드확인은 최소 5글자 이상 12글자 이하로 입력하세요."),
				equalTo: "패스워드와 일치하지 않습니다."
			}, nickname: {
				required: "닉네임을 입력하세요."
			}, email: {
				required: "이메일을 입력하세요",
				email: "올바른 이메일 주소가 아닙니다.",
				remote: "이메일 중복입니다."
			}
			/*        }, invalidHandler: function (form, validator) {
			 var errors = validator.numberOfInvalids();
			 if (errors) {
			 alert(validator.errorList[0].message);
			 validator.errorList[0].element.focus();
			 }*/
		}, submitHandler: function (form) {
			$.ajax({
				type: "POST",
				url: "/member/reg",
				data: $(form).serialize(),
				dataType: "json",
				/*                contentType: "application/x-www-form-urlencoded; charset=utf-8",*/
				success: function (result) {
					if (result) {
						alert("회원가입을 축하합니다. 메일인증을 꼭 받아주세요.");
						window.open("/login", "_self");
					} else {
						alert("죄송합니다 다시 시도해주세요.")
					}
				}
			});
		}
	})
})