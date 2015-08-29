function boardReDeleteAjax(reply_id) {
	$.ajax({
		type: "POST",
		url: "/lecture/boardConfirm",
		dataType: "json",
		data: {lb_id: reply_id},
		success: function (result) {
			if(result === 1) {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "POST",
						url: "/lecture/boardIsDelete",
						dataType: "json",
						data: {lb_id: reply_id},
						success: function (result2) {
							if (result2) {
								alert("삭제되었습니다.");
								location.reload();
							} else {
								alert("에러가 발생했습니다. 다시 시도해주세요.");
								location.reload();
							}
						}
					})
				}
			} else if(result === 2) {
				alert("본인이 작성하신 글이 아닙니다.");
			} else {
				alert("이미 삭제 된 글입니다.");
				location.reload();
			}
		}
	})
}


function reReportAjax(reply_id) {

	if (confirm("신고 하시겠습니까?\n허위신고시 사이트 이용에 제한이 걸릴 수 있습니다.")) {
		$.ajax({
			type: "POST",
			url: "/lecture/boardSubConfirm",
			dataType: "json",
			data: {lb_id: reply_id},
			success: function (result) {

				if (result === 1) {
					alert("신고 되었습니다");
				} else if (result === 2) {
					alert("이미 신고하였습니다.");
				} else {
					alert("이미 삭제된 글이거나 에러가 발생했습니다.");
					location.reload();
				}
			}
		})
	}

}


function boardSearchLecture() {
	if(document.board_search_frm.searchWord.value.length == 0) {
		alert("검색어를 입력해 주세요.");
		board_search_frm.searchWord.focus();
		return;
	}

	document.board_search_frm.submit();
}



$(document).ready(function() {

	var bd = $("body");

	bd.on("dblclick", function () {

		window.scrollTo(0, 0);

	})

	var lb_id = $("#lb_id").val();

	var lecture_id = $("#lecture_id").val();

	$(document).off('click', '#boardMod_btn').on('click', '#boardMod_btn', function() {

		$.ajax({
			type: "POST",
			url: "/lecture/boardConfirm",
			dataType: "json",
			data: {lb_id: lb_id},
			success: function (result) {
				if(result === 1) {
					window.open('/lecture/boardModView?lb_id=' + lb_id, '_self');
				} else if(result === 2) {
					alert("본인이 작성하신 글이 아닙니다.");
				} else {
					alert("삭제 된 글입니다.");
					window.open("/lecture/boardList/"+lecture_id+"/", "_self");
				}
			}
		})

	})

	$(document).off('click', '#boardDel_btn').on('click', '#boardDel_btn', function() {

		$.ajax({
			type: "POST",
			url: "/lecture/boardConfirm",
			dataType: "json",
			data: {lb_id: lb_id},
			success: function (result) {
				if(result === 1) {
					if (confirm("정말 삭제하시겠습니까?")) {
						$.ajax({
							type: "POST",
							url: "/lecture/boardIsDelete",
							dataType: "json",
							data: {lb_id: lb_id},
							success: function (result2) {
								if (result2) {
									alert("삭제되었습니다.");
									window.open("/lecture/boardList/"+lecture_id+"/", "_self");
								} else {
									alert("이미 삭제된 글이거나 에러가 발생했습니다.");
									location.reload();
								}
							}
						})
					}
				} else if(result === 2) {
					alert("본인이 작성하신 글이 아닙니다.");
				} else {
					alert("삭제 된 글입니다.");
					window.open("/lecture/boardList/"+$("#lecture_id").val()+"/", "_self");
				}
			}
		})
	})

	$(document).off('click', '#boardRep_btn').on('click', '#boardRep_btn', function() {

		if (confirm("신고 하시겠습니까?\n허위신고시 사이트 이용에 제한이 걸릴 수 있습니다.")) {
			$.ajax({
				type: "POST",
				url: "/lecture/boardSubConfirm",
				dataType: "json",
				data: {lb_id: lb_id},
				success: function (result) {

					if (result === 1) {
						alert("신고 되었습니다");
					} else if (result === 2) {
						alert("이미 신고하였습니다.");
					} else {
						alert("이미 삭제된 글이거나 에러가 발생했습니다.");
						location.reload();
					}

				}
			})
		}

	})

	$(document).off('click', '#reReg_btn').on('click', '#reReg_btn', function() {

		if(document.reReg_frm.contents.value.length == 0) {
			alert("내용을 입력해주세요.");
			reReg_frm.contents.focus();
			return;
		}

		$.ajax({
			type: "POST",
			url: "/lecture/boardReplyReg",
			data: $("#reReg_frm").serialize(),
			dataType: "json",
			success: function (result) {
				if (result) {
					location.reload();
				} else {
					alert("에러가 발생했습니다. 다시 시도해주세요.");
				}
			}
		})

	})

})
