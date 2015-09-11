$(document).ready(function() {

	function searchLecture() {

		var searchWord = $("#searchWord").val();

		var blank_pattern = /^\s+|\s+$/g;

		if( searchWord == "" || searchWord == null || searchWord.replace(blank_pattern, "") == "" ){
			alert("검색어를 입력해 주세요.");
			$("#searchWord").focus();
		} else {
			$("#search_frm").attr("onsubmit", "return true;")
			$("#search_frm").submit();
		}

	}

	$("#searchWord").keydown(function(key) {
		if (key.keyCode == 13) {

			$("#search_frm").attr("onsubmit", "return false;")

			searchLecture();
		}
	});

	$("#search_lecture_btn").click(searchLecture);

})