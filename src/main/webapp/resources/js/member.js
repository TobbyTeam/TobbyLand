$(document).ready(function() {

	$("#loginbtn").click(function(){
		if($("#loginid").val() == ""){
			alert("로그인 아이디를 입력해주세요");
			$("#loginid").focus();
		}else if($("#loginpwd").val() == ""){
			alert("로그인 비밀번호를 입력해주세요");
			$("#loginpwd").focus();
		}else{
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

})