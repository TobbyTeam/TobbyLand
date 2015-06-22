<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<form action="/lecture/search" method="get">

    검색
    <select name="searchType">
        <option value="lecture_name">강의명</option>
        <option value="dept">학과명</option>
        <option value="prof">교수명</option>
    </select>

    <input type="text" name="searchWord"><br>
    <input type="submit" value="검색">

</form>
<br/>

<form action="/member/mod" method="post">
  아이디: <text>${member.member_id}</text><br>
  패스워드:<input type="text" name="password" value="${member.password}"><br>
  별명: <input type="text" name="nickname" value="${member.nickname}"><br>
  이메일: <input type="text" name="email" value="${member.email}"><br>
  수업방식:
          A1<input type="radio" name="method" value="A1" checked>
          A2<input type="radio" name="method" value="A2">
          A3<input type="radio" name="method" value="A3"><br>
  과제방식:
          B1<input type="radio" name="task" value="B1" checked>
          B2<input type="radio" name="task" value="B2">
          B3<input type="radio" name="task" value="B3"><br>
  시험방식:
          C1<input type="radio" name="exam" value="C1" checked>
          C2<input type="radio" name="exam" value="C2">
          C3<input type="radio" name="exam" value="C3"><br>
  <br>
  <input type="submit" value="전송">

    <br/>

    <a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />

    <br/>

</form>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />
<a href="/lecture/list">강의생성게시판</a><br/>
<a href="/member/view">회원정보</a><br/>
</body>
</html>

