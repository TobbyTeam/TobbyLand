<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2015-05-31
  Time: 오전 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" charset="utf-8"></script>

    <title></title>
</head>
<body>


패스워드:<input type="password" id="password" name="password"/><br>
         <input type="button" id ="pwConfirm" value="확인"/>


<script>
    $("#pwConfirm").click(function(){
        $.ajax({
            type     : "POST",
            url      : "/member/pwCheck",
            dataType: "json",
            data     : {exPassword: $("#password").val()},
            success:function(result){

                if(result){
                    window.open("/member/modView", "_self");
                } else {
                    alert("비밀번호가 틀립니다");
                }

            }
        })
    })
</script>

</body>
</html>
