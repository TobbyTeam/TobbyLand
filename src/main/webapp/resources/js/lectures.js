/**
 *
 */

function searchLecture() {
	if(document.search_frm.searchWord.value.length == 0) {
	alert("검색어를 입력해 주세요.");
	search_frm.searchWord.focus();
	return;
	}

	document.search_frm.submit();
}

function infoConfirm() {
	if(document.lecture_frm.lecture_name.value.length == 0) {
		alert("강의명을 입력해주세요");
		lecture_frm.lecture_name.focus();
		return;
	}

	if(document.lecture_frm.prof.value.length == 0) {
		alert("교수명을 입력해주세요");
		lecture_frm.prof.focus();
		return;
	}

	document.lecture_frm.submit();
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
