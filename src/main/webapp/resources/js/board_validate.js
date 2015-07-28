$(document).ready(function() {

	$("#reg_frm").validate({
		onfocusout: false,
		rules: {
			title: {
				required: true
			},contents: {
				required: true
			}
		}, messages: {
			title: {
				required: "제목를 입력하세요."
			}, contents: {
				required: "내용을 입력하세요."
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
				required: true
			},contents: {
				required: true
			}
		}, messages: {
			title: {
				required: "제목을 입력하세요."
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
						alert("죄송합니다 다시 시도해주세요.");
					}

				}
			})
		}
	})

})
