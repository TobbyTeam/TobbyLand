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