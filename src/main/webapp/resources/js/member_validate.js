$(document).ready(function() {

	$.validator.addMethod("alphanumeric", function (value, element) {
		return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
	});

	$.validator.addMethod("kpumail", function (value, element) {
		return this.optional(element) || /(\W|^)[\w.+\-]{0,25}@(kpu)\.ac.kr(\W|$)/.test(value);
	});

	$.validator.addMethod("mix", function (value, element) {
		return this.optional(element) || /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,20}$/.test(value);
	});

	$.validator.addMethod("space", function (value, element) {
		return value.indexOf(" ") < 0 && value != "";
	});

	$("#reg_frm").validate({
		onfocusout: false,
		rules: {
			user_id: {
				required: true,
				rangelength: [5, 20],
				alphanumeric: true,
				remote: {
					type: "post", url: "/member/idCheck", data: {
						user_id: function () {
							return $("#user_id").val();
						}
					}
				}
			}, password: {
				required: true,
				space: true,
				rangelength: [7, 20],
				mix: true
			}, password_check: {
				required: true,
				equalTo: '#password'
			}, nickname: {
				required: true,
				space: true,
				rangelength: [2, 20],
				remote: {
					type: "post", url: "/member/nickCheck", data: {
						nickname: function () {
							return $("#nickname").val();
						}
					}
				}
			}, email: {
				required: true,
				email: true,
				kpumail: true,
				rangelength: [11, 22],
				remote: {
					type: "post", url: "/member/emailCheck", data: {
						email: function () {
							return $("#email").val();
						}
					}
				}
			}, answer: {
				required: true,
				space: true
			}
		}, messages: {
			user_id: {
				required: "아이디를 입력하세요.",
				rangelength: $.validator.format("아이디는 5 글자 이상 20글자 이하로 입력하세요."),
				alphanumeric: "알파벳과 숫자만 사용가능하고 공백은 불가능합니다.",
				remote: "아이디 중복입니다."
			}, password: {
				required: "패스워드를 입력하세요.",
				space: "공백은 불가능합니다.",
				rangelength: $.validator.format("패스워드 7글자 이상 20글자 이하로 입력하세요."),
				mix: "비밀번호는 문자, 숫자, 특수문자(!@#$%^*+=-)의 조합으로 입력해주세요."
			}, password_check: {
				required: "패스워드 확인 입력하세요.",
				equalTo: "패스워드와 일치하지 않습니다."
			}, nickname: {
				required: "닉네임을 입력하세요.",
				space: "공백은 불가능합니다.",
				rangelength: $.validator.format("닉네임은 2 글자 이상 20글자 이하로 입력하세요."),
				remote: "닉네임 중복입니다."
			}, email: {
				required: "이메일을 입력하세요",
				email: "올바른 이메일 주소가 아닙니다.",
				kpumail: "kpu메일을 입력해주세요.(@kpu.ac.kr)",
				rangelength: $.validator.format("이메일주소는 11 글자 이상 22글자 이하로 입력하세요."),
				remote: "이메일 중복입니다."
			}, answer: {
				required: "답변을 입력하세요.",
				space: "공백은 불가능합니다."
			}
			/*        }, invalidHandler: function (form, validator) {
			 var errors = validator.numberOfInvalids();
			 if (errors) {
			 alert(validator.errorList[0].message);
			 validator.errorList[0].element.focus();
			 }*/
		}, submitHandler: function (form) {
			alert("처리 중입니다. 시간이 조금 걸리니 잠시만 기다려주세요.");
			$.ajax({
				type: "POST",
				url: "/member/reg",
				data: $(form).serialize(),
				dataType: "json",
				/*                contentType: "application/x-www-form-urlencoded; charset=utf-8",*/
				success: function (result) {
					if (result) {
						alert("회원가입을 축하합니다. 메일인증을 꼭 받아주세요.");
						window.open("/member/regOk", "_self");
					} else {
						alert("죄송합니다 다시 시도해주세요.")
					}
				}
			});
		}
	})


	$("#mod_frm").validate({
		onfocusout: false,
		rules: {
			password: {
				required: true,
				space: true,
				rangelength: [7, 20],
			}, password_check: {
				required: true,
				equalTo: '#password'
			}, nickname: {
				required: true,
				space: true,
				rangelength: [2, 20],
				remote: {
					type: "post", url: "/member/modNickCheck", data: {
						nickname: function () {
							return $("#nickname").val();
						}
					}
				}
			}, answer: {
				required: true,
				space: true
			}
		}, messages: {
			password: {
				required: "패스워드를 입력하세요.",
				space: "공백은 불가능합니다.",
				rangelength: $.validator.format("패스워드 7글자 이상 20글자 이하로 입력하세요.")
			}, password_check: {
				required: "패스워드 확인 입력하세요.",
				equalTo: "패스워드와 일치하지 않습니다."
			}, nickname: {
				required: "닉네임을 입력하세요.",
				space: "공백은 불가능합니다",
				rangelength: $.validator.format("닉네임은 2 글자 이상 20글자 이하로 입력하세요."),
				remote: "닉네임 중복입니다."
			}, answer: {
				required: "닉네임을 입력하세요.",
				space: "공백은 불가능합니다."
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
				url: "/member/mod",
				data: $(form).serialize(),
				dataType: "json",
				/*                contentType: "application/x-www-form-urlencoded; charset=utf-8",*/
				success: function (result) {
					if (result) {
						alert("회원정보 수정을 완료 하였습니다.");
						window.open("/member/view", "_self");
					} else {
						alert("죄송합니다 다시 시도해주세요.")
					}
				}
			});
		}
	})


	$("#pw_mod_frm").validate({
		onfocusout: false,
		rules: {
			exPassword: {
				required: true,
				remote: {
					type: "post", url: "/member/pwCheck", data: {
						password: function () {
							return $("#exPassword").val();
						}
					}
				}
			}, password: {
				required: true,
				space: true,
				rangelength: [7, 20],
				mix: true
			}, password_check: {
				required: true,
				equalTo: '#password'
			}
		}, messages: {
			exPassword: {
				required: "기존 비밀번호를 입력하세요.",
				remote: "비밀번호가 틀립니다."
			}, password: {
				required: "패스워드를 입력하세요.",
				space: "공백은 불가능합니다.",
				rangelength: $.validator.format("패스워드 7글자 이상 20글자 이하로 입력하세요."),
				mix: "비밀번호는 문자, 숫자, 특수문자(!@#$%^*+=-)의 조합으로 입력해주세요."
			}, password_check: {
				required: "패스워드 확인 입력하세요.",
				equalTo: "패스워드와 일치하지 않습니다."
			}
		}, submitHandler: function (form) {
			$.ajax({
				type: "POST",
				url: "/member/pwMod",
				data: $(form).serialize(),
				dataType: "json",
				/*                contentType: "application/x-www-form-urlencoded; charset=utf-8",*/
				success: function (result) {
					if (result) {
						alert("비밀번호 수정이 완료되었습니다.");
						window.open("/member/view", "_self");
					} else {
						alert("죄송합니다 다시 시도해주세요.")
					}
				}
			});
		}
	})

	$("#search_frm").validate({
		onfocusout: false,
		rules: {
			email: {
				required: true,
				email: true,
				kpumail: true
			}
		}, messages: {
			email: {
				required: "이메일을 입력하세요",
				email: "올바른 이메일 주소가 아닙니다.",
				kpumail: "kpu메일을 입력해주세요.(@kpu.ac.kr)"
			}
		}, submitHandler: function (form) {
			alert("처리 중입니다. 시간이 조금 걸리니 잠시만 기다려주세요.");
			$.ajax({
				type: "POST",
				url: "/member/search",
				dataType: "json",
				data: {email: $("#email").val()},
				success: function (result) {
					if (result === 1 ) {
						alert("메일이 전송 되었습니다. 확인해주세요.");
						window.open("/member/searchOk", "_self");
					} else if (result === 0){
						alert("등록되지 않은 메일입니다.");
					} else {
						alert("1일 메일요청 횟수 5회를 초과하셨습니다.");
					}

				}
			});
		}
	})

})