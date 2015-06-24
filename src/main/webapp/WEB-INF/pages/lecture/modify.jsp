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

  <input type="text" name="searchWord">
  <input type="submit" value="검색">

</form>

<br/><br/>

<form action="/lecture/mod" method="post">
  강의명: <input type="text" name="lecture_name" value="${lecture.lecture_name}"><br>
  학과명:
          <select name="dept">
            <option value="기계공학과">기계공학과</option>
            <option value="기계설계공학과">기계설계공학과</option>
            <option value="메카트로닉스공학과">메카트로닉스공학과</option>
            <option value="전자공학부">전자공학부</option>
            <option value="컴퓨터공학부">컴퓨터공학부</option>
            <option value="게임공학부">게임공학부</option>
            <option value="신소재공학과">신소재공학과</option>
            <option value="생명화학공학과">생명화학공학과</option>
            <option value="디자인학부">디자인학부</option>
            <option value="경영학부">경영학부</option>
            <option value="나노-광공학과">나노-광공학과</option>
            <option value="에너지·전기공학과">에너지·전기공학과</option>
            <option value="지식융합학부">지식융합학부</option>
          </select>  <br/>
  교수명: <input type="text" name="prof" value="${lecture.prof}"><br>
  <input type="hidden" name="lecture_id" value="${lecture.lecture_id}">
  <input type="submit" value="전송">
</form>

<br/><br/>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>

<a href="/lecture/list">강의생성게시판</a><br/><br/>

<a href="/member/view">회원정보</a><br/>

</body>
</html>
