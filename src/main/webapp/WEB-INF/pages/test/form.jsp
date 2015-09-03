<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="<c:url value="/resources/editor/js/HuskyEZCreator.js" />"></script>

    <script>

        $(function(){
            //전역변수
            var obj = [];
            //스마트에디터 프레임생성
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: obj,
                elPlaceHolder: "editor",
                sSkinURI: "/resources/editor/SmartEditor2Skin.html",
                htParams : {
                    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseToolbar : true,
                    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseVerticalResizer : true,
                    // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseModeChanger : true,
                }
            });
            //전송버튼
            $("#savebutton").click(function(){
                //id가 smarteditor인 textarea에 에디터에서 대입
                obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
                //폼 submit
                $("#frm").submit();
            })
        })

    </script>

    <script type="text/javascript">
        var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "ir1",
            sSkinURI: "/smart/SmartEditor2Skin.html",
            htParams : {
                bUseToolbar : true,    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseVerticalResizer : true,  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true,   // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                //aAdditionalFontList : aAdditionalFontSet,  // 추가 글꼴 목록
                fOnBeforeUnload : function(){
                    //alert("완료!");
                }
            }, //boolean
            fOnAppLoad : function(){
                //예제 코드
                //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
            },
            fCreator: "createSEditor2"
        });

        function _onSubmit(elClicked){
            // 에디터의 내용을 에디터 생성시에 사용했던 textarea에 넣어 줍니다.
            oEditors.getById["content"].exec("UPDATE_IR_FIELD", []);

            // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
            try{
                f.submit();
            }catch(e){
                alert(e);
            }
        }
    </script>




    <title></title>
</head>
<body>

<!-- action : 에디터에 입력한 html 코드를 전달받을 Controller페이지 URL -->
<form action="/submit" method="post" id="frm">
        <textarea name="editor" id="editor" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
        <input type="button" id="savebutton" value="서버전송" />
</form>




</body>
</html>
