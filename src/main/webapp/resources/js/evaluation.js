var lecture_id = $("#lecture_id").val();

var evalRegAjax = function(lecture_id) {

	$.ajax({
		type: "POST",
		url: "/evaluation/regChech",
		dataType: "json",
		data: {lecture_id: lecture_id},
		success: function (result) {

			if (result) {
				window.open('/evaluation/regForm?lecture_id='+lecture_id, '_self');
			} else {
				alert("이미 이 강의에 대해 강의평가를 작성하셨습니다..");
			}
		}
	})

}

var evalLikeAjax = function(evaluation_id) {

	$.ajax({
		type: "POST",
		url: "/evaluation/subConfirm",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비추천하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				$.ajax({
					type: "POST",
					url: "/evaluation/likes",
					dataType: "json",
					data: {evaluation_id: evaluation_id},
					success: function (result2) {
						if (result2) {
							alert("추천 되었습니다..");
							location.reload();
						} else {
							alert("이미 삭제된 강의거나 에러가 발생했습니다.");
							location.reload();
						}
					}
				});
			}
		}
	});
}

var evalDislikeAjax = function(evaluation_id) {

	$.ajax({
		type: "POST",
		url: "/evaluation/subConfirm",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비추천하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				$.ajax({
					type: "POST",
					url: "/evaluation/dislike",
					dataType: "json",
					data: {evaluation_id: evaluation_id},
					success: function (result2) {
						if (result2) {
							alert("비추천 하였습니다.");
							location.reload();
						} else {
							alert("이미 삭제된 강의거나 에러가 발생했습니다.");
							location.reload();
						}
					}
				});
			}
		}
	});
}

var evalReportAjax = function(evaluation_id) {

	$.ajax({
		type: "POST",
		url: "/evaluation/subConfirm",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비추천하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				if (confirm("신고 하시겠습니까?\n허위신고시 사이트 이용에 제한이 걸릴 수 있습니다.")) {
					$.ajax({
						type: "POST",
						url: "/evaluation/report",
						dataType: "json",
						data: {evaluation_id: evaluation_id},
						success: function (result2) {
							if (result2) {
								alert("신고 되었습니다.");
							} else {
								alert("이미 삭제된 강의거나 에러가 발생했습니다.");
								location.reload();
							}
						}
					});
				}
			}
		}
	});
}


var evalModAjax = function(evaluation_id) {
	$.ajax({
		type: "POST",
		url: "/evaluation/confirm",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				window.open('/evaluation/view?evaluation_id='+evaluation_id+'&lecture_id='+lecture_id, '_self');
			} else if (result === 2){
				alert("본인이 작성하신 글이 아닙니다.");
			} else {
				alert("삭제된 강의평가 입니다.");
				location.reload();
			}
		}
	})
}

var evalDeleteAjax = function(evaluation_id) {

	$.ajax({
		type: "POST",
		url: "/evaluation/confirm",
		dataType: "json",
		data: {evaluation_id: evaluation_id},
		success: function (result) {

			if (result === 1) {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "POST",
						url: "/evaluation/isDelete",
						dataType: "json",
						data: {evaluation_id: evaluation_id},
						success: function (result2) {
							if (result2) {
								alert("삭제되었습니다.");
								location.reload();
							} else {
								alert("이미 삭제된 강의거나 에러가 발생했습니다.");
								location.reload();
							}
						}
					})
				}
			} else if (result === 2){
				alert("본인이 작성하신 글이 아닙니다.");
			} else {
				alert("삭제된 강의평가 입니다.");
				location.reload();
			}
		}
	})
}

var reDeleteAjax = function(evaluation_id) {
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
	});
}