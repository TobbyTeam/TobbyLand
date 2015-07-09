$(document).ready(function() {

	$.validator.addMethod("space", function (value, element) {
		return value.indexOf(" ") < 0 && value != "";
	});

	$("#reg_frm").validate({
		onfocusout: false,
		rules: {
			lecture_name: {
				required: true,
				space: true
			}, prof: {
				required: true,
				space: true
			}
		}, messages: {
			lecture_name: {
				required: "강의명을 입력하세요.",
				space: "공백은 불가능합니다."
			}, prof: {
				required: "교수명을 입력하세요.",
				space: "공백은 불가능합니다."
			}
		}, submitHandler: function (form) {
			if(confirm("정확하게 입력하셨나요?. 정말 등록하시겠습니까?")){
				$.ajax({
					type: "POST",
					url: "/lecture/reg",
					dataType: "json",
					data: $(form).serialize(),
					success: function (result) {
						if (result) {
							alert("강의등록이 완료되었습니다.")
							window.open("/lecture/list", "_self");
						} else {
							alert("죄송합니다 다시 시도해주세요.");
						}

					}
				})
			}
		}
	})

	$("#mod_frm").validate({
		onfocusout: false,
		rules: {
			lecture_name: {
				required: true,
				space: true
			}, prof: {
				required: true,
				space: true
			}
		}, messages: {
			lecture_name: {
				required: "강의명을 입력하세요.",
				space: "공백은 불가능합니다."
			}, prof: {
				required: "교수명을 입력하세요.",
				space: "공백은 불가능합니다."
			}
		}, submitHandler: function (form) {
			if(confirm("정확하게 입력하셨나요?. 수정하시겠습니까??")){
				$.ajax({
					type: "POST",
					url: "/lecture/mod",
					dataType: "json",
					data: $(form).serialize(),
					success: function (result) {
						if (result) {
							alert("강의 수정이 완료 됐습니다..")
							window.open("/lecture/list", "_self");
						} else {
							alert("죄송합니다 다시 시도해주세요.");
						}

					}
				})
			}
		}
	})

})
