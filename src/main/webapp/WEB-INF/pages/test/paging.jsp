<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2015-07-28
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<div class="paginate">

  <c:if test="${not empty boards}">

    <!-- 전체 페이지가 10페이지 이하면 맨처음로 이동 표시 안함-->

    <c:if test="${pageNum-10 <= 0}">

    </c:if>

    <!-- 전체 페이지가 10페이지 초과고 시작페이지가 1이 아니면 맨처음로 이동 표시 -->

    <c:if test="${pageNum-10 > 0 && start-1 !=0}">
      <a href="/lecture/boardList/${lecture_id}/?page=1" class="first">맨처음&nbsp;</a>
    </c:if>

    <!-- 시작페이지가 1부터면 이전 표시("<<") ​ 안함 -->

    <c:if test="${start-1 ==0 }">

    </c:if>

    <!-- 시작페이지가 1이 아니면 << 이전 표시.  링크는 시작페이지가 6부터 10까지일 경우 5페이지를 가르킴 -->​

    <c:if test="${start-1!=0 }">

      <a href="/lecture/boardList/${lecture_id}/?page=${start-1}" class="prev">&laquo;&nbsp;</a>

    </c:if>

    <!-- 현재 페이지가 1페이지면 이전페이지 표시("<") ​ 안함 -->

    <c:if test="${current == 1}">

    </c:if>

    <!-- 현재 페이지가 1페이지가 아니면 이전페이지 표시("<") ​ -->

    <c:if test="${current != 1}">

      <a href="/lecture/boardList/${lecture_id}/?page=${current-1}" class="prevPage">&lt;&nbsp;</a>

    </c:if>

    <!-- 10개씩 페이지 표시-->​
			<span>
				<c:forEach var="i" begin="${start}" end="${end}" step="1">
                  <c:choose>
                    <c:when test="${i eq current}">
                      <a href="/lecture/boardList/${lecture_id}/?page=${i}" style="color:#00FF00">${i}&nbsp;</a>
                    </c:when>
                    <c:otherwise>
                      <a href="/lecture/boardList/${lecture_id}/?page=${i}">${i}&nbsp;</a>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
			</span>

    <!-- 현재 페이지가 마지막페이지면 다음페이지 표시(">") ​ 안함 -->

    <c:if test="${current == pageNum}">

    </c:if>

    <!-- 현재 페이지가 마지막페이지가 아니면 아니면 다음페이지 표시(">") ​ -->

    <c:if test="${current != pageNum}">

      <a href="/lecture/boardList/${lecture_id}/?page=${current+1}" class="prevPage">&nbsp;&gt;</a>

    </c:if>

    <!-- 마지막 페이지 번호와 전체 페이지 번호가 같으면서 10개 단위가 아니면 다음바로가기 표시 않함 -->​​

    <c:if test="${end % 10 != 0 && end == pageNum }">

    </c:if>

    <!-- 마지막 페이지 번호가 10, 20 인데 전체 페이지 갯수가 end페이지 보다 크면 다음 페이징 바로가기 표시  (">>")​ .-->​

    <c:if test="${end % 10 == 0 && pageNum > end}">

      <a href="/lecture/boardList/${lecture_id}/?page=${end+1}" class="next">&nbsp;&raquo;</a>

    </c:if>

    <!-- 전체 페이지가 10페이지 이하면 맨뒤로 이동 표시 안함 -->

    <c:if test="${pageNum-10 <= 0}">

    </c:if>

    <!-- 전체 페이지가 10페이지 초과고 마지막 페이지 번호와 전체 페이지 번호가 같지 않으면 맨뒤 이동 표시 -->

    <c:if test="${pageNum-10 > 0 && end != pageNum}">

      <a href="/lecture/boardList/${lecture_id}/?page=${pageNum}" class="last">&nbsp;맨뒤</a>

    </c:if>

  </c:if>
</div>

</body>
</html>
