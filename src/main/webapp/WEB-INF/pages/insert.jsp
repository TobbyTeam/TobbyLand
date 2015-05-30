<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2015-05-28
  Time: 오전 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>

<body>

<form action="insert" method="get">
    아이디: <input type="text" name="memberId"><br>
    패스워드:<input type="text" name="passWord"><br>
    별명: <input type="text" name="nickName"><br>
    이메일: <input type="text" name="eMail"><br>
    수업방식:A1<input type="radio" name="metHod" value="A1">
             A2<input type="radio" name="metHod" value="A2">
             A3<input type="radio" name="metHod" value="A3"><br>
    과제방식:B1<input type="radio" name="tAsk" value="B1">
             B2<input type="radio" name="tAsk" value="B2">
             B3<input type="radio" name="tAsk" value="B3"><br>
    시험방식:C1<input type="radio" name="eXam" value="C1">
             C2<input type="radio" name="eXam" value="C2">
             C3<input type="radio" name="eXam" value="C3"><br>
    회원타입:<td width=500 height=40 align=center >
        <select name="tYpe" >
        <option value="1"> 일반회원 </option>
            <option value="2">관리자 </option>
        </select>
<br>
    <input type="submit" value="전송">

</form>

</body>
</html>
