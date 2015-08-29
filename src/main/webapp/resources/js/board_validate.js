$(document).ready(function() {

	$.validator.addMethod("space", function (value, element) {
		return value.indexOf(" ") < 0 && value != "";
	});

	$("#reg_frm").validate({
		onfocusout: false,
		rules: {
			title: {
				required: true,
				maxlength: 100
			},contents: {
				required: true
			},writer: {
				required: true,
				space: true,
				rangelength: [2, 20]
			}
		}, messages: {
			title: {
				required: "제목를 입력하세요.",
				maxlength: $.validator.format("제목은 100글자 이하로 입력하세요.")
			}, contents: {
				required: "내용을 입력하세요."
			}, writer: {
				required: "닉네임을 입력하세요.",
				space: "공백은 불가능합니다.",
				rangelength: $.validator.format("닉네임은 2 글자 이상 20글자 이하로 입력하세요.")
			}
		}, submitHandler: function (form) {
			$.ajax({
				type: "POST",
				url: "/board/reg",
				dataType: "json",
				data: $(form).serialize(),
				success: function (result) {
					if (result) {
						alert("글 작성이 완료 되었습니다.")
						window.open("/board/list/"+$("#department_id").val()+"/", "_self");
					} else {
						alert("죄송합니다 다시 시도해주세요.");
					}

				}
			})
		}
	})

	$("#mod_frm").validate({
		onfocusout: false,
		rules: {
			title: {
				required: true,
				maxlength: 100
			},contents: {
				required: true
			}
		}, messages: {
			title: {
				required: "제목을 입력하세요.",
				maxlength: $.validator.format("제목은 100글자 이하로 입력하세요.")
			}, contents: {
				required: "내용을 입력하세요."
			}
		}, submitHandler: function (form) {
			$.ajax({
				type: "POST",
				url: "/board/mod",
				dataType: "json",
				data: $(form).serialize(),
				success: function (result) {
					if (result) {
						alert("글 수정이 완료 되었습니다.")
						window.open("/board/view/"+$("#department_id").val()+"/?board_id="+$("#board_id").val(), "_self");
					} else {
						alert("이미 삭제된 글이거나 에러가 발생했습니다.");
						window.open("/board/list/"+$("#department_id").val()+"/", "_self");
					}

				}
			})
		}
	})

})