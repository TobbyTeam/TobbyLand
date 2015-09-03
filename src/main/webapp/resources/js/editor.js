$(function(){
	//전역변수
	var obj = [];
	//스마트에디터 프레임생성
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: obj,
		elPlaceHolder: "contents",
		sSkinURI: "/resources/editor/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : false,
			fOnBeforeUnload : function(){

			}

		}/*,
		fOnAppLoad : function(){
			//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			obj.getById["contents"].exec("PASTE_HTML", ["${board.contents}"]);
		}*/,
		fCreator: "createSEditor2"
	});
	//전송버튼
	$("#reg_btn").click(function(){
		//id가 smarteditor인 textarea에 에디터에서 대입
		obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		//폼 submit


		var type = obj[0].oApp.getEditingMode();

		alert(type);

		/*var contents = obj.getById["contents"].getIR();*/

		var checked = $("#is_anonymity").is(":checked");

		if(checked) {

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
		}

		var title = $("#title").val();

		if( title == "" || title == null ){
			alert( "제목을 입력해주세요." );
			return;
		}

		var blank_pattern2 = /^\s+|\s+$/g;
		if( title.length > 40){
			alert("제목은 40글자까지 입력이 가능합니다.");
			return;
		}

		if( title == "" || title == null ){
			alert( "제목을 입력해주세요." );
			return;
		}

		var contents = $("#contents").val();

		var contents = htmlRemove(contents);

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
			type: "POST",
			url: "/board/reg",
			dataType: "json",
			data: $("#reg_frm").serialize(),
			success: function (result) {
				if (result) {
					alert("글 작성이 완료 되었습니다.")
					window.open("/board/list/"+$("#department_id").val()+"/", "_self");
				} else {
					alert("죄송합니다 다시 시도해주세요.");
				}

			}
		})

	})

	$("#mod_btn").click(function(){
		//id가 smarteditor인 textarea에 에디터에서 대입
		obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		//폼 submit

		var title = $("#title").val();

		if( title == "" || title == null ){
			alert( "제목을 입력해주세요." );
			return;
		}

		var blank_pattern2 = /^\s+|\s+$/g;
		if( title.replace(blank_pattern2, "") == "" ){
			alert("제목이 공백만 입력되었습니다");
			return;
		}

		var contents = $("#contents").val();

		var contents = htmlRemove(contents);

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
			type: "POST",
			url: "/board/mod",
			dataType: "json",
			data: $("#mod_frm").serialize(),
			success: function (result) {
				if (result) {
					alert("글 수정이 완료 되었습니다.")
					window.open("/board/view/"+$("#department_id").val()+"/?board_id="+$("#board_id").val(), "_self");
				} else {
					alert("이미 삭제된 글이거나 에러가 발생했습니다.");
					window.open("/board/list/"+$("#department_id").val()+"/", "_self");
				}

			}
		})

	})
})
