function searchLecture() {
	if(document.search_frm.searchWord.value.length == 0) {
		alert("검색어를 입력해 주세요.");
		search_frm.searchWord.focus();
		return;
	}

	document.search_frm.submit();
}

function likeAjax(lecture_id) {
	$.ajax({
		type     : "POST",
		url      : "/lecture/likes",
		dataType : "json",
		data     : {lecture_id:lecture_id},
		success  : function(result) {

			if(result === 1) {
				alert("추천 되었습니다");
				location.reload();
			}else if(result === 2){
				alert("이미 추천하였습니다.");
			}else if(result === 3){
				alert("이미 삭제 된 강의입니다.");
				location.reload();
			}else {
				alert("에러가 발생했습니다. 다시 시도해주세요.");
				location.reload();
			}
		}
	});
}

function modAjax(lecture_id) {
	$.ajax({
		type: "POST",
		url: "/lecture/confirm",
		dataType: "json",
		data: {lecture_id: lecture_id},
		success: function (result) {

			if (result) {
				window.open('/lecture/view?lecture_id='+lecture_id, '_self');
			} else {
				alert("본인이 작성하신 글이 아닙니다.");
			}
		}
	})

}

function deleteAjax(lecture_id) {
	$.ajax({
		type: "POST",
		url: "/lecture/confirm",
		dataType: "json",
		data: {lecture_id: lecture_id},
		success: function (result) {

			if (result) {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "POST",
						url: "/lecture/isDelete",
						dataType: "json",
						data: {lecture_id: lecture_id},
						success: function (data) {
							if (data === 1) {
								alert("삭제되었습니다.");
								location.reload();
							} else if(data === 2){
								alert("이미 삭제 된 강의입니다.");
								location.reload();
							} else {
								alert("에러가 발생했습니다. 다시 시도해주세요.");
								location.reload();
							}
						}
					})
				}
			} else {
				alert("본인이 작성하신 글이 아닙니다.");
			}
		}
	})
}

function reDeleteAjax(lb_id) {
	$.ajax({
		type: "POST",
		url: "/lecture/boardConfirm",
		dataType: "json",
		data: {lb_id: lb_id},
		success: function (result) {

			if (result) {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "POST",
						url: "/lecture/boardIsDelete",
						dataType: "json",
						data: {lb_id: lb_id},
						success: function (data) {
							if (data) {
								alert("삭제되었습니다.");
								location.reload();
							} else {
								alert("다시 시도 하세요.");
							}
						}
					})
				}
			} else {
				alert("본인이 작성하신 글이 아닙니다.");
			}
		}
	})
}

function reReportAjax(lb_id) {
	$.ajax({
		type     : "POST",
		url      : "/lecture/boardSubConfirm",
		dataType : "json",
		data     : {lb_id:lb_id},
		success  : function(result) {

			if(result){
				alert("신고 되었습니다");
				location.reload();
			}else{
				alert("이미 신고하였습니다.");
			}
		}
	});
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


	$(document).off('click', '#boardMod_btn').on('click', '#boardMod_btn', function() {
/*	$("#boardMod_btn").unbind("click").on("click", function() {  스크립트 두번 뜨는거 다른 방법*/

		var lb_id = $("#lb_id").val();

		$.ajax({
			type: "POST",
			url: "/lecture/boardConfirm",
			dataType: "json",
			data: {lb_id: lb_id},
			success: function (result) {

				if (result) {
					window.open('/lecture/boardModView?lb_id=' + lb_id, '_self');

				} else {
					alert("본인이 작성하신 글이 아닙니다.");
				}
			}
		})
	})

	$(document).off('click', '#boardDel_btn').on('click', '#boardDel_btn', function() {

		var lb_id = $("#lb_id").val();

		$.ajax({
			type: "POST",
			url: "/lecture/boardConfirm",
			dataType: "json",
			data: {lb_id: lb_id},
			success: function (result) {

				if (result) {
					if (confirm("정말 삭제하시겠습니까?")) {
						$.ajax({
							type: "POST",
							url: "/lecture/boardIsDelete",
							dataType: "json",
							data: {lb_id: lb_id},
							success: function (data) {
								if (data) {
									alert("삭제되었습니다.");
									window.open("/lecture/boardList/"+$("#lecture_id").val()+"/", "_self");
								} else {
									alert("다시 시도 하세요.");
								}
							}
						})
					}
				} else {
					alert("본인이 작성하신 글이 아닙니다.");
				}
			}
		})
	})

	$(document).off('click', '#boardRep_btn').on('click', '#boardRep_btn', function() {

		var lb_id = $("#lb_id").val();

		$.ajax({
			type     : "POST",
			url      : "/lecture/boardSubConfirm",
			dataType : "json",
			data     : {lb_id:lb_id},
			success  : function(result) {

				if(result){
					alert("신고 되었습니다");
					location.reload();
				}else{
					alert("이미 신고하였습니다.");
				}
			}
		});
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
						alert("죄송합니다 다시 시도해주세요.")
					}
				}
			})
	})

})
