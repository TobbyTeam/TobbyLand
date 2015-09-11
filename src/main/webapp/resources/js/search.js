$(document).ready(function() {

	function boardSearch() {

		var board_search_word = $("#board_search_word").val();

		var blank_pattern = /^\s+|\s+$/g;

		if( board_search_word == "" || board_search_word == null || board_search_word.replace(blank_pattern, "") == "" ){
			alert("검색어를 입력해 주세요.");
			$("#board_search_word").focus();
		} else {
			$("#board_search_frm").attr("onsubmit", "return true;")
			$("#board_search_frm").submit();
		}

	}

	$("#board_search_word").keydown(function(key) {
		if (key.keyCode == 13) {

			$("#board_search_frm").attr("onsubmit", "return false;")

			boardSearch();
		}
	});

	$("#board_search_btn").click(boardSearch);

})