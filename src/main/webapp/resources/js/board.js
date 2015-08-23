function reDeleteAjax(board_id) {
	$.ajax({
		type: "POST",
		url: "/board/confirm",
		dataType: "json",
		data: {board_id: board_id},
		success: function (result) {

			if (result) {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "POST",
						url: "/board/isDelete",
						dataType: "json",
						data: {board_id: board_id},
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

function reReportAjax(board_id) {
	$.ajax({
		type     : "POST",
		url      : "/board/report",
		dataType : "json",
		data     : {board_id:board_id},
		success  : function(result) {

			if(result === 0){
				alert("신고 되었습니다");
				location.reload();
			}else{
				alert("이미 신고하였습니다.");
			}
		}
	});
}

function search() {
	if(document.search_frm.searchWord.value.length == 0) {
		alert("검색어를 입력해 주세요.");
		search_frm.searchWord.focus();
		return;
	}

	document.search_frm.submit();
}



$(document).ready(function() {

	var bd = $("body");

	bd.on("dblclick", function () {

		window.scrollTo(0, 0);

	})


	$(document).off('click', '#mod_btn').on('click', '#mod_btn', function() {
/*	$("#mod_btn").unbind("click").on("click", function() {  스크립트 두번 뜨는거 다른 방법*/

		var board_id = $("#board_id").val();

		$.ajax({
			type: "POST",
			url: "/board/confirm",
			dataType: "json",
			data: {board_id: board_id},
			success: function (result) {

				if (result) {
					window.open('/board/modView?board_id=' + board_id, '_self');

				} else {
					alert("본인이 작성하신 글이 아닙니다.");
				}
			}
		})
	})

	$(document).off('click', '#del_btn').on('click', '#del_btn', function() {
/*	$("#del_btn").unbind("click").on("click", function() {*/

		var board_id = $("#board_id").val();

		$.ajax({
			type: "POST",
			url: "/board/confirm",
			dataType: "json",
			data: {board_id: board_id},
			success: function (result) {

				if (result) {
					if (confirm("정말 삭제하시겠습니까?")) {
						$.ajax({
							type: "POST",
							url: "/board/isDelete",
							dataType: "json",
							data: {board_id: board_id},
							success: function (data) {
								if (data) {
									alert("삭제되었습니다.");
									window.open("/board/list/"+$("#department_id").val()+"/", "_self");
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

	$(document).off('click', '#like_btn').on('click', '#like_btn', function() {
		/*	$("#like_btn").unbind("click").on("click", function() {*/

		var board_id = $("#board_id").val();

		$.ajax({
			type     : "POST",
			url      : "/board/like",
			dataType : "json",
			data     : {board_id:board_id},
			success  : function(result) {

				if (result === 1) {
					alert("이미 추천하였습니다.");
				} else if (result === 2) {
					alert("이미 비추천하였습니다.");
				} else if (result === 3){
					alert("이미 신고하였습니다.");
				} else {
					alert("추천 되었습니다.");
					location.reload();
				}
			}
		});
	})

	$(document).off('click', '#dislike_btn').on('click', '#dislike_btn', function() {
		/*	$("#dislike_btn").unbind("click").on("click", function() {*/

		var board_id = $("#board_id").val();

		$.ajax({
			type     : "POST",
			url      : "/board/dislike",
			dataType : "json",
			data     : {board_id:board_id},
			success  : function(result) {

				if (result === 1) {
					alert("이미 추천하였습니다.");
				} else if (result === 2) {
					alert("이미 비추천하였습니다.");
				} else if (result === 3){
					alert("이미 신고하였습니다.");
				} else {
					alert("비추천 되었습니다.");
					location.reload();
				}
			}
		});
	})

	$(document).off('click', '#report_btn').on('click', '#report_btn', function() {
		/*	$("#report_btn").unbind("click").on("click", function() {*/

		var board_id = $("#board_id").val();

		$.ajax({
			type     : "POST",
			url      : "/board/report",
			dataType : "json",
			data     : {board_id:board_id},
			success  : function(result) {

				if (result === 1) {
					alert("이미 추천하였습니다.");
				} else if (result === 2) {
					alert("이미 비추천하였습니다.");
				} else if (result === 3){
					alert("이미 신고하였습니다.");
				} else {
					alert("신고 되었습니다.");
					location.reload();
				}
			}
		});
	})
	
	$(document).off('click', '#reReg_btn').on('click', '#reReg_btn', function() {

		if($("#re_con").val().length===0){
			alert("내용을 입력해주세요");
			$("#re_con").focus();
		} else {

			$.ajax({
				type: "POST",
				url: "/board/replyReg",
				data: $("#re_frm").serialize(),
				dataType: "json",
				success: function (result) {
					if (result) {
						location.reload();
					} else {
						alert("죄송합니다 다시 시도해주세요.")
					}
				}
			})
		}
	})

})
