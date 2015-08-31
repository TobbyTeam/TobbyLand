function replyList(board_id) {
	$.ajax({
		type: "POST",
		url: "/board/replyList",
		dataType: "json",
		data: {board_id: board_id},
		success: function (result) {

			$.each(result, function () {

				var list = result;

				var content = '<table id="reply" class="col-md-12 table-striped table-condensed">';

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
			})

		}
	})
}