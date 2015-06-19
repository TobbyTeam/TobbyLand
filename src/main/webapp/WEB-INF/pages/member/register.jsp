<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>

<body>

<form action="/member/reg" method="post">

    아이디: <input type="text" name="member_id"><br>
    패스워드:<input type="text" name="password"><br>
    별명: <input type="text" name="nickname"><br>
    이메일: <input type="text" name="email"><br>
    수업방식:A1<input type="radio" name="method" value="A1">
             A2<input type="radio" name="method" value="A2">
             A3<input type="radio" name="method" value="A3"><br>
    과제방식:B1<input type="radio" name="task" value="B1">
             B2<input type="radio" name="task" value="B2">
             B3<input type="radio" name="task" value="B3"><br>
    시험방식:C1<input type="radio" name="exam" value="C1">
             C2<input type="radio" name="exam" value="C2">
             C3<input type="radio" name="exam" value="C3"><br>
<br>
    <input type="submit" value="전송">

</form>

</body>
</html>
