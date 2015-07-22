<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/js/lecture.js" />"></script>

<title>헬로 월드</title></head>
<body>


<jsp:include page="/top" flush="true"/>

<br /> <br />

<jsp:include page="/evaluation/lecture" flush="true"/>

<br />


<a href="/evaluation/list?lecture_id=${lecture_id}">강의평가</a>&nbsp;&nbsp;<a href="/lecture/boardList/${lecture_id}/">강의게시판</a>

<br /><br />

	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="board" items="${boards}" varStatus="status">
		<tr>
			<td>${board.rnum}</td>
			<td><a href="/lecture/boardView?lb_id=${board.lb_id}">${board.title}(${board.count})</a></td>
			<td>${board.write_date}</td>
		</tr>
		</c:forEach>
	</table><br /><br />

	<a href="/lecture/boardRegForm?lecture_id=${lecture_id}">글작성</a><br/><br/>

<c:out value="${current}"/><br />

	<div class="paginate">

		<c:if test="${not empty boards}">

			<!-- 첫페이지로 이동 표시 -->

			<a href="/lecture/boardList/${lecture_id}/?seq=1" class="first">처음&nbsp;</a>

			<!-- 시작페이지가 1부터면 이전 표시("<<") ​ 안함 -->

			<c:if test="${start-1 ==0 }">

			</c:if>

			<!-- 시작페이지가 1이 아니면 << 이전 표시.  링크는 시작페이지가 6부터 10까지일 경우 5페이지를 가르킴 -->​

			<c:if test="${start-1!=0 }">

				<a href="/lecture/boardList/${lecture_id}/?seq=${start-1}" class="prev">&laquo;&nbsp;</a>

			</c:if>

			<!-- 현재 페이지가 1페이지면 이전페이지 표시("<") ​ 안함 -->

			<c:if test="${current == 1}">

			</c:if>

			<!-- 현재 페이지가 1페이지가 아니면 이전페이지 표시("<") ​ -->

			<c:if test="${current != 1}">

				<a href="/lecture/boardList/${lecture_id}/?seq=${current-1}" class="prevPage">이전페이지&nbsp;</a>

			</c:if>

			<!-- 10개씩 페이지 표시-->​
			<span>
				<c:forEach var="i" begin="${start}" end="${end}" step="1">
					<c:choose>
						<c:when test="${i eq current}">
							<a href="/lecture/boardList/${lecture_id}/?seq=${i}" style="color:#00FF00">${i}&nbsp;</a>
						</c:when>
						<c:otherwise>
							<a href="/lecture/boardList/${lecture_id}/?seq=${i}">${i}&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</span>

			<!-- 현재 페이지가 마지막페이지면 다음페이지 표시(">") ​ 안함 -->

			<c:if test="${current == end}">

			</c:if>

			<!-- 현재 페이지가 마지막페이지가 아니면 아니면 다음페이지 표시(">") ​ -->

			<c:if test="${current != end}">

				<a href="/lecture/boardList/${lecture_id}/?seq=${current+1}" class="prevPage">&nbsp;다음페이지</a>

			</c:if>

			<!-- end페이지 번호가 5, 10 인데 전체 페이지 갯수가 end페이지 보다 크면 다음 페이징 바로가기 표시  (">>")​ .-->​

			<c:if test="${end % 5 == 0 && pageNum > end}">

				<a href="/lecture/boardList/${lecture_id}/?seq=${end+1}" class="next">&nbsp;&raquo;</a>

			</c:if>

			<!-- 마지막 페이지 번호와 전체 페이지 번호가 같으면서 5개 단위가 아니면 다음바로가기 표시 않함 -->​​

			<c:if test="${end % 5 != 0 && end == pageNum }">

			</c:if>

			<!-- 마지막페이지로 이동 표시 -->

			<a href="/lecture/boardList/${lecture_id}/?seq=${finalEnd}" class="last">&nbsp;마지막</a>

		</c:if>
	</div>

</body>
</html>