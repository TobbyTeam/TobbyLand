function search() {
	if(document.board_search_frm.searchWord.value.length == 0) {
		alert("검색어를 입력해 주세요.");
		board_search_frm.searchWord.focus();
		return;
	}

	document.board_search_frm.submit();
}
