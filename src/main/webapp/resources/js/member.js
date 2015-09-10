$(document).ready(function() {

	function login(){
		if($("#loginid").val() == "" || $("#loginid").val() == null){
			alert("로그인 아이디를 입력해주세요");
			$("#loginid").focus();
		}else if($("#loginpwd").val() == "" || $("#loginpwd").val() == null){
			alert("로그인 비밀번호를 입력해주세요");
			$("#loginpwd").focus();
		}else{
			$("#loginfrm").submit();
		}
	}

	$("#login").keydown(function(key) {
		if (key.keyCode == 13) {
			login();
		}
	});

	$("#login_btn").click(login);


	function pwConfirm() {

		var password = $("#password").val();

		if(password == ""|| password == null) {
			alert("비밀번호를 입력해주세요");
			$("#password").focus();
			return;
		}

		var blank_pattern = /[\s]/g;
		if( blank_pattern.test(password) == true){
			alert("공백은 불가능합니다.");
			return;
		}

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

	$("#pw_confirm").keydown(function(key) {

		if (key.keyCode == 13) {

			pwConfirm();

		}

	});

	$("#pw_btn").click(pwConfirm);


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

})