function replyList(lb_id) {
	$.ajax({
		type: "POST",
		url: "/lecture/boardReplyList",
		dataType: "json",
		data: {lb_id: lb_id},
		success: function (result2) {

			if(result2.length == 0){

				$("#reply").empty();

			} else {

				$.each(result2, function () {

					var list = result2;

					var content = '<table id="reply" class="col-md-12 table-striped table-condensed comment">';

					for( i=0;i < list.length ; i++){

						content += '<tr class="reframe test">';
						content += '<td width="15%" align="center">'+list[i].writer+'</td>';
						content += '<td width="65%">'+ list[i].contents +'</td>';
						content += '<td width="10%" align="right" class="littlebtn">' + list[i].write_date + '</td>';
						content += '<td width="5%" align="right" class="littlebtn"><button onclick="boardReDeleteAjax(' + list[i].lb_id + ')" class="btn btn-default littlebtn">삭제</button></td>';
						content += '<td width="5%" align="right" class="littlebtn"><button onclick="boardReReportAjax(' + list[i].lb_id + ')" class="btn btn-danger littlebtn">신고</button></td>';
						content += "</tr>";

					}

					content += "</table>";

					$("#reply").replaceWith(content);


				})
			}

		}
	})
}

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
								replyList($("#lb_id").val());
							} else {
								alert("에러가 발생했습니다. 다시 시도해주세요.");
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


function boardReReportAjax(reply_id) {

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

$(document).ready(function() {

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


		var writer = $("#writer").val();

		if( writer == "" || writer == null ){

			alert( "닉네임을 입력해주세요." );
			return;
		}

		var blank_pattern = /[\s]/g;
		if( blank_pattern.test(writer) == true){
			alert("닉네임에 공백은 사용할 수 없습니다.");
			return;
		}

		if( writer.length < 2 || writer.length > 15){

			alert( "닉네임은 2 글자 이상 15글자 이하로 입력하세요." );
			return;
		}

		var contents = $("#contents").val();

		if( contents == "" || contents == null ){

			alert( "내용을 입력해주세요." );
			return;
		}

		var blank_pattern2 = /^\s+|\s+$/g;
		if( contents.replace(blank_pattern2, "") == "" ){
			alert("내용이 공백만 입력되었습니다");
			return;
		}

		$.ajax({
			type     : "POST",
			url: "/lecture/boardReplyReg",
			dataType : "json",
			data: $("#reReg_frm").serialize(),
			success  : function(result) {

				if (result) {

					$("#contents").val("");

					replyList($("#lb_id").val());

				} else {
					alert("죄송합니다. 에러가 발생했습니다..")
					location.reload();
				}
			}
		})
	})

	/*	$(document).off('click', '#reReg_btn').on('click', '#reReg_btn', function() {
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
	 })*/

})