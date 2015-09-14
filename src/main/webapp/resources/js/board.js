$(document).ready(function() {
	$('#mod_btn').bind('click', function() {
		boardMod();
	});

	$('#del_btn').bind('click', function() {
		boardDel();
	});

	$('#like_btn').bind('click', function() {
		boardLike();
	});

	$('#dislike_btn').bind('click', function() {
		boardDislike();
	});

	$('#report_btn').bind('click', function() {
		boardReport();
	});

	$('#reReg_btn').bind('click', function() {
		boardReReg();
	});

});


var boardMod = function() {

	$('#mod_btn').unbind('click');

	var board_id = $("#board_id").val();

	$.ajax({
		type: "POST",
		url: "/board/confirm",
		dataType: "json",
		data: {board_id: board_id},
		success: function (result) {
			if (result === 1) {
				window.open('/board/modView?board_id='+board_id, '_self');
			} else if (result === 2) {
				alert("본인이 작성하신 글이 아닙니다.");
			} else {
				alert("삭제 된 글입니다.");
				window.open("/board/list/"+$("#department_id").val()+"/", "_self");
			}
		}
	}).done(function(){
		$('#mod_btn').bind('click', function() {
			boardMod();
		});
	});
};

var boardDel = function() {

	$('#del_btn').unbind('click');

	var board_id = $("#board_id").val();

	$.ajax({
		type: "POST",
		url: "/board/confirm",
		dataType: "json",
		data: {board_id: board_id},
		success: function (result) {

			if (result === 1) {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "POST",
						url: "/board/isDelete",
						dataType: "json",
						data: {board_id: board_id},
						success: function (result2) {
							if (result2) {
								alert("삭제되었습니다.");
								window.open("/board/list/"+$("#department_id").val()+"/", "_self");
							} else {
								alert("삭제된 글이거나 에러가 발생했습니다.");
								location.reload();
							}
						}
					})
				}
			} else if (result === 2) {
				alert("본인이 작성하신 글이 아닙니다.");
			} else {
				alert("삭제 된 글입니다.");
				window.open("/board/list/"+$("#department_id").val()+"/", "_self");
			}
		}
	}).done(function(){
		$('#del_btn').bind('click', function() {
			boardDel();
		});
	});
};

var boardLike = function() {

	$('#like_btn').unbind('click');

	var board_id = $("#board_id").val();

	$.ajax({
		type     : "POST",
		url      : "/board/subConfirm",
		dataType : "json",
		data     : {board_id:board_id},
		success  : function(result) {

			if(result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비추천하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				$.ajax({
					type: "POST",
					url: "/board/like",
					dataType: "json",
					data: {board_id: board_id},
					success: function (result2) {
						if (result2) {
							alert("추천 되었습니다..");
							$.ajax({
								type: "POST",
								url: "/board/searchLike",
								dataType: "json",
								data: {board_id: board_id},
								success: function (result3) {

									var searchLike = '<span id="board_like">'+result3+'</span>';

									$("#board_like").replaceWith(searchLike);

								}
							});
						} else {
							alert("삭제된 글이거나 에러가 발생했습니다.");
							location.reload();
						}
					}
				});
			}
		}
	}).done(function(){
		$('#like_btn').bind('click', function() {
			boardLike();
		});
	});
};

var boardDislike = function() {

	$('#dislike_btn').unbind('click');

	var board_id = $("#board_id").val();

	$.ajax({
		type     : "POST",
		url      : "/board/subConfirm",
		dataType : "json",
		data     : {board_id:board_id},
		success  : function(result) {

			if(result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비추천하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				$.ajax({
					type: "POST",
					url: "/board/dislike",
					dataType: "json",
					data: {board_id: board_id},
					success: function (result2) {
						if (result2) {
							alert("비추천 되었습니다.");
							$.ajax({
								type: "POST",
								url: "/board/searchDislike",
								dataType: "json",
								data: {board_id: board_id},
								success: function (result3) {

									var searchLike = '<span id="board_dislike">'+result3+'</span>';

									$("#board_dislike").replaceWith(searchLike);

								}
							});
						} else {
							alert("삭제된 글이거나 에러가 발생했습니다.");
							location.reload();
						}
					}
				});
			}
		}
	}).done(function(){
		$('#dislike_btn').bind('click', function() {
			boardDislike();
		});
	});
};

var boardReport = function() {

	$('#report_btn').unbind('click');

	var board_id = $("#board_id").val();

	$.ajax({
		type     : "POST",
		url      : "/board/subConfirm",
		dataType : "json",
		data     : {board_id:board_id},
		success  : function(result) {

			if(result === 1) {
				alert("이미 추천하였습니다.");
			} else if (result === 2) {
				alert("이미 비추천하였습니다.");
			} else if (result === 3){
				alert("이미 신고하였습니다.");
			} else {
				if (confirm("신고 하시겠습니까?\n허위신고시 사이트 이용에 제한이 걸릴 수 있습니다.")) {
					$.ajax({
						type: "POST",
						url: "/board/report",
						dataType: "json",
						data: {board_id: board_id},
						success: function (result2) {
							if (result2) {
								alert("신고 되었습니다.");
							} else {
								alert("삭제된 글이거나 에러가 발생했습니다.");
								location.reload();
							}
						}
					});
				}
			}
		}
	}).done(function(){
		$('#report_btn').bind('click', function() {
			boardReport();
		});
	});
};

var boardReReg = function() {

	$('#reReg_btn').unbind('click');

	var checked = $("#is_anonymity").is(":checked");

	if(checked) {

		var writer = $("#writer").val();

		if( writer == "" || writer == null ){

			alert( "닉네임을 입력해주세요." );
			reBind();
			return;
		}

		var blank_pattern = /[\s]/g;
		if( blank_pattern.test(writer) == true){
			alert("닉네임에 공백은 사용할 수 없습니다.");
			reBind();
			return;
		}

		if( writer.length < 2 || writer.length > 15){

			alert( "닉네임은 2 글자 이상 15글자 이하로 입력하세요." );
			reBind();
			return;
		}
	}

	var contents = $("#contents").val();

	if( contents == "" || contents == null ){

		alert( "내용을 입력해주세요." );
		reBind();
		return;
	}

	var blank_pattern2 = /^\s+|\s+$/g;
	if( contents.replace(blank_pattern2, "") == "" ){
		alert("내용이 공백만 입력되었습니다");
		reBind();
		return;
	}

	$.ajax({
		type     : "POST",
		url: "/board/replyReg",
		dataType : "json",
		data: $("#reReg_frm").serialize(),
		success  : function(result) {

			if (result) {

				$("#writer").val("");
				$("#writer").attr("disabled", true);
				$("#contents").val("");
				$("#is_anonymity").attr("checked",false);

				replyList($("#board_id").val());

			} else {
				alert("죄송합니다. 에러가 발생했습니다..")
				location.reload();
			}
		}
	}).done(reBind()
	);
};

var reBind = function(){

	$('#reReg_btn').bind('click', function() {
		boardReReg();
	});
};

var replyList = function(board_id) {
	$.ajax({
		type: "POST",
		url: "/board/replyList",
		dataType: "json",
		data: {board_id: board_id},
		success: function (result2) {

			if(result2.length == 0){

				$("#reply").empty();

			} else {

				$.each(result2, function () {

					var list = result2;

					var content = '<table id="reply" class="col-md-12 table-striped table-condensed comment">';

					for( i=0;i < list.length ; i++){

						content += '<tr class="reframe test">';
						content += '<td width="15%" align="center">';

						if(list[i].is_anonymity === 0){

							content += '<span class="title">'+list[i].writer+'*</span>';

						} else {

							content += list[i].writer;
						}

						content += '</td>';
						content += '<td width="65%">'+ list[i].contents +'</td>';
						content += '<td width="10%" align="right" class="littlebtn">' + list[i].write_date + '</td>';
						content += '<td width="5%" align="right" class="littlebtn"><button onclick="reDeleteAjax(' + list[i].board_id + ')" class="btn btn-default littlebtn">삭제</button></td>';
						content += '<td width="5%" align="right" class="littlebtn"><button onclick="reReportAjax(' + list[i].board_id + ')" class="btn btn-danger littlebtn">신고</button></td>';
						content += "</tr>";

					}

					content += "</table>";

					$("#reply").replaceWith(content);

				});
			}
		}
	});
};

var reDeleteAjax = function(board_id) {
	$.ajax({
		type: "POST",
		url: "/board/confirm",
		dataType: "json",
		data: {board_id: board_id},
		success: function (result) {
			if(result === 1) {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "POST",
						url: "/board/isDelete",
						dataType: "json",
						data: {board_id: board_id},
						success: function (result2) {
							if (result2) {
								alert("삭제되었습니다.");
								replyList($("#board_id").val());
							} else {
								alert("다시 시도 하세요.");
							}
						}
					})
				}
			} else if(result === 2) {
				alert("본인이 작성하신 글이 아닙니다.");
			} else {
				alert("삭제 된 글입니다.");
				location.reload();
			}
		}
	})
};

var reReportAjax = function(board_id) {

	$.ajax({
		type     : "POST",
		url      : "/board/subConfirm",
		dataType : "json",
		data     : {board_id:board_id},
		success  : function(result) {

			if(result === 0) {
				if (confirm("신고 하시겠습니까?\n허위신고시 사이트 이용에 제한이 걸릴 수 있습니다.")) {
					$.ajax({
						type: "POST",
						url: "/board/report",
						dataType: "json",
						data: {board_id: board_id},
						success: function (result2) {

							if (result2) {
								alert("신고 되었습니다");
							} else {
								alert("삭제된 글이거나 에러가 발생했습니다.");
								location.reload();
							}
						}
					});
				}
			} else {
				alert("이미 신고하였습니다.");
			}
		}
	})
};