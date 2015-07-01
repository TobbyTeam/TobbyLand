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
