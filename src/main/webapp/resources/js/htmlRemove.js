function htmlRemove(contents) {

	contents = contents.replace(/\r/g, '');
	contents = contents.replace(/[\n|\t]/g, '');
	contents = contents.replace(/[\v|\f]/g, '');

	//1. 먼저, 빈 라인 처리 .
	contents = contents.replace(/<p><br><\/p>/gi, '');
	contents = contents.replace(/<P>&nbsp;<\/P>/gi, '');
	contents = contents.replace(/&nbsp;/gi, '');

	//2. 빈 라인 이외에 linebreak 처리.
	contents = contents.replace(/<br(\s)*\/?>/gi, '');
	contents = contents.replace(/<br(\s[^\/]*)?>/gi, '');
	contents = contents.replace(/<\/p(\s[^\/]*)?>/gi, '');

	contents = contents.replace(/<\/li(\s[^\/]*)?>/gi, '');
	contents = contents.replace(/<\/tr(\s[^\/]*)?>/gi, '');

	contents = contents.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/g, ""); //HTML태그 없애는 정규식
	contents = contents.replace(/^\s\s*/, '').replace(/\s\s*$/, ''); //빈공백 없애는 정규식

	return contents;

}