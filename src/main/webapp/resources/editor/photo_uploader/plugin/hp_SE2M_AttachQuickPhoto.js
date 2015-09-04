/**
 * @use 간단 포토 업로드용으로 제작되었습니다.
 * @author cielo
 * @See nhn.husky.SE2M_Configuration 
 * @ 팝업 마크업은 SimplePhotoUpload.html과 SimplePhotoUpload_html5.html이 있습니다. 
 */

nhn.husky.SE2M_AttachQuickPhoto = jindo.$Class({		
	name : "SE2M_AttachQuickPhoto",

	$init : function(){
		this.nMaxTotalPhotoCount = 10; //configuration에 넣어서 셋팅하셔도 됨.
		this.nTotalPhotoCount = 0;
	},
	
	$ON_MSG_APP_READY : function(){
		this.oApp.exec("REGISTER_UI_EVENT", ["photo_attach", "click", "ATTACHPHOTO_OPEN_WINDOW"]);
	},
	
	$LOCAL_BEFORE_FIRST : function(sMsg){
		if(!!this.oPopupMgr){ return; }
		// Popup Manager에서 사용할 param
		this.htPopupOption = {
			oApp : this.oApp,
			sName : this.name,
			bScroll : false,
			sProperties : "",
			sUrl : ""
		};
		this.oPopupMgr = nhn.husky.PopUpManager.getInstance(this.oApp);
	},
	
	/**
	 * 포토 웹탑 오픈
	 */
	$ON_ATTACHPHOTO_OPEN_WINDOW : function(){

		if( this.nTotalPhotoCount >= this.nMaxTotalPhotoCount ){
			alert("사진 첨부는 10개까지만 허용합니다.");
			return false;
		}

		this.htPopupOption.sUrl = this.makePopupURL();
		this.htPopupOption.sProperties = "left=0,top=0,width=403,height=359,scrollbars=yes,location=no,status=0,resizable=no";

		this.oPopupWindow = this.oPopupMgr.openWindow(this.htPopupOption);
		
		// 처음 로딩하고 IE에서 커서가 전혀 없는 경우
		// 복수 업로드시에 순서가 바뀜	
		this.oApp.exec('FOCUS');
		return (!!this.oPopupWindow ? true : false);
	},
	
	/**
	 * 서비스별로 팝업에  parameter를 추가하여 URL을 생성하는 함수	 
	 * nhn.husky.SE2M_AttachQuickPhoto.prototype.makePopupURL로 덮어써서 사용하시면 됨.
	 */
	makePopupURL : function(){
		var sPopupUrl = "./photo_uploader/popup/photo_uploader.html";
		
		return sPopupUrl;
	},
	
	/**
	 * 팝업에서 호출되는 메세지.
	 */
	$ON_SET_PHOTO : function(aPhotoData){
		var sContents, 
			aPhotoInfo,
			htData;
		
		if( !aPhotoData ){ 
			return; 
		}
		
		try{

			// 전체 이미지 개수와 올릴 이미지 개수 비교

			var j = aPhotoData.length;

			var h = 10-this.nTotalPhotoCount;

			if(j > h){
				j = h;
				alert("한 글당 사진 첨부는 10개까지만 허용합니다.\n10개까지 포함되는 사진만 반영됩니다.");
			}

			sContents = "";
			for(var i = 0; i <j; i++){
				htData = aPhotoData[i];
				
				if(!htData.sAlign){
					htData.sAlign = "";
				}
				
				aPhotoInfo = {
				    sName : htData.sFileName || "",
				    sOriginalImageURL : htData.sFileURL,
					bNewLine : htData.bNewLine || false
				};
				
				sContents += this._getPhotoTag(aPhotoInfo);
				this.nTotalPhotoCount += 1; //이부분 추가

			}

			this.oApp.exec("PASTE_HTML", [sContents]); // 위즐 첨부 파일 부분 확인

		}catch(e){
			// upload시 error발생에 대해서 skip함
			return false;
		}
	},

	$ON_SET_ATTACHPHOTO_TOTALCOUNT : function(nCount) {
		this.nTotalPhotoCount = nCount;
		nMaxImageCount = 10-nCount;
	},

	/**
	 * @use 일반 포토 tag 생성
	 */
	_getPhotoTag : function(htPhotoInfo){
		// id와 class는 썸네일과 연관이 많습니다. 수정시 썸네일 영역도 Test
		var sTag = '<img src="{=sOriginalImageURL}" title="{=sName}" style="max-width:90%;heigth:auto;">';
		if(htPhotoInfo.bNewLine){
			sTag += '<br style="clear:both;">';
		}
		sTag = jindo.$Template(sTag).process(htPhotoInfo);
		
		return sTag;
	}
});