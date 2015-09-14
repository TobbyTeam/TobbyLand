$(function(){
	//전역변수
	var obj = [];

	//이미지 숫자 확인
	var nUploadedPhotoCount = 0;

	var orgContents = $("#contents").val();

	if(orgContents == "" || orgContents == null ){

	} else {

		var imgConfirm = orgContents.match(/<img/g);

		if(!(imgConfirm == "" || imgConfirm == null)){
			var imgCount = imgConfirm.length;
			nUploadedPhotoCount = imgCount;

		}

	}

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
			bUseModeChanger : true

		}, //boolean 
		fOnAppLoad : function(){
			obj.getById["contents"].exec("SET_ATTACHPHOTO_TOTALCOUNT", [nUploadedPhotoCount]);
			/*			obj.getById["contents"].exec("PASTE_HTML", ["한 글자라도 글자가 입력되어야 합니다."]);*/

		},
		fCreator: "createSEditor2"
	});
	//전송버튼
	$("#reg_btn").click(function(){
		//id가 smarteditor인 textarea에 에디터에서 대입
		obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		//폼 submit


		/*var type = obj[0].oApp.getEditingMode();*/

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
		if( title.replace(blank_pattern2, "") == "" ){
			alert("제목이 공백만 입력되었습니다");
			return;
		}

		var blank_pattern2 = /^\s+|\s+$/g;
		if( title.length > 40){
			alert("제목은 40글자까지 입력이 가능합니다.");
			return;
		}

		var contents = $("#contents").val();

		var contents = htmlRemove(contents);

		if( contents == "" || contents == null ){
			alert( "내용을 입력해주세요." );
			return;
		}

		$.ajax({
			type: "POST",
			url: "/board/reg",
			dataType: "json",
			data: $("#reg_frm").serialize(),
			success: function (result) {
				if (result) {
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

		$.ajax({
			type: "POST",
			url: "/board/mod",
			dataType: "json",
			data: $("#mod_frm").serialize(),
			success: function (result) {
				if (result) {
					window.open("/board/view/"+$("#department_id").val()+"/?board_id="+$("#board_id").val(), "_self");
				} else {
					alert("이미 삭제된 글이거나 에러가 발생했습니다.");
					window.open("/board/list/"+$("#department_id").val()+"/", "_self");
				}

			}
		})

	})
})