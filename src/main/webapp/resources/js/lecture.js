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

			if(result){
				alert("추천 되었습니다");
				location.reload();
			}else{
				alert("이미 추천하였습니다.");
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

$(document).ready(function() {


	$(document).off('click', '#boardMod_btn').on('click', '#boardMod_btn', function() {
/*	$("#boardMod_btn").unbind("click").on("click", function() {  스크립트 두번 뜨는거 다른 방법*/

		var ls_id = $("#ls_id").val();

		$.ajax({
			type: "POST",
			url: "/lecture/boardConfirm",
			dataType: "json",
			data: {ls_id: ls_id},
			success: function (result) {

				if (result) {
					window.open('/lecture/boardModView?ls_id=' + ls_id, '_self');

				} else {
					alert("본인이 작성하신 글이 아닙니다.");
				}
			}
		})
	})

	$(document).off('click', '#boardDel_btn').on('click', '#boardDel_btn', function() {
/*	$("#boardDel_btn").unbind("click").on("click", function() {*/

		var ls_id = $("#ls_id").val();

		$.ajax({
			type: "POST",
			url: "/lecture/boardConfirm",
			dataType: "json",
			data: {ls_id: ls_id},
			success: function (result) {

				if (result) {
					if (confirm("정말 삭제하시겠습니까?")) {
						$.ajax({
							type: "POST",
							url: "/lecture/boardIsDelete",
							dataType: "json",
							data: {ls_id: ls_id},
							success: function (data) {
								if (data) {
									alert("삭제되었습니다.");
									window.open("/lecture/boardList?lecture_id=" + $("#lecture_id").val(), "_self");
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

})
