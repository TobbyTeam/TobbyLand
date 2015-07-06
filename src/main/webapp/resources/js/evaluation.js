var lecture_id = $("#lecture_id").val();

function evalLikeAjax(evaluation_id) {
	$.ajax({
		type: "POST",
		url: "/evaluation/likes",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비공감하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				alert("추천 되었습니다.");
				location.reload();
			}
		}
	})
}

function evalDislikeAjax(evaluation_id) {
	$.ajax({
		type: "POST",
		url: "/evaluation/dislike",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비공감하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				alert("비공감 하였습니다.");
				location.reload();
			}
		}
	})
}

function evalReportAjax(evaluation_id) {
	$.ajax({
		type: "POST",
		url: "/evaluation/report",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비공감하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				alert("신고 되었습니다.");
				location.reload();
			}
		}
	})
}

function evalModAjax(evaluation_id) {
	$.ajax({
		type: "POST",
		url: "/evaluation/report",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비공감하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				alert("신고 되었습니다.");
				location.reload();
			}
		}
	})
}

function evalModAjax(evaluation_id) {
	$.ajax({
		type: "POST",
		url: "/evaluation/confirm",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result) {
				window.open('/evaluation/view?evaluation_id='+evaluation_id+'&lecture_id='+lecture_id, '_self');
			} else {
				alert("본인이 작성하신 글이 아닙니다.");
			}
		}
	})

}

function evalDeleteAjax(evaluation_id) {
	$.ajax({
		type: "POST",
		url: "/evaluation/confirm",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result) {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "POST",
						url: "/evaluation/isDelete",
						dataType: "json",
						data: {evaluation_id: evaluation_id},
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