<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/searchbar2.css" />">

    <script src="<c:url value="${ctx}/resources/js/search.js" />"></script>

</head>

<body>

<div class="container">

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" align="center">
            <form action="${param.url}" method="get" id="board_search_frm" name="board_search_frm">
                <table>
                    <tr>
                        <td>
                            <div id="select">
                                <select type="text" name="searchType">
                                <c:choose>
                                    <c:when test="${empty param.searchType}">
                                        <option value="title" selected="selected">제목</option>
                                        <option value="contents">내용</option>
                                        <option value="title_contents">제목+내용</option>
                                        <option value="writer">글쓴이</option>
                                        <option value="all">전체</option>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${param.searchType eq 'contents'}">
                                                <option value="title">제목</option>
                                                <option value="contents" selected="selected">내용</option>
                                                <option value="title_contents">제목+내용</option>
                                                <option value="writer">글쓴이</option>
                                                <option value="all">전체</option>
                                            </c:when>
                                            <c:when test="${param.searchType eq 'title_contents'}">
                                                <option value="title">제목</option>
                                                <option value="contents">내용</option>
                                                <option value="title_contents" selected="selected">제목+내용</option>
                                                <option value="writer">글쓴이</option>
                                                <option value="all">전체</option>
                                            </c:when>
                                            <c:when test="${param.searchType eq 'writer'}">
                                                <option value="title">제목</option>
                                                <option value="contents">내용</option>
                                                <option value="title_contents">제목+내용</option>
                                                <option value="writer" selected="selected">글쓴이</option>
                                                <option value="all">전체</option>
                                            </c:when>
                                            <c:when test="${param.searchType eq 'all'}">
                                                <option value="title">제목</option>
                                                <option value="contents">내용</option>
                                                <option value="title_contents">제목+내용</option>
                                                <option value="writer">글쓴이</option>
                                                <option value="all" selected="selected">전체</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="title" selected="selected">제목</option>
                                                <option value="contents">내용</option>
                                                <option value="title_contents">제목+내용</option>
                                                <option value="writer">글쓴이</option>
                                                <option value="all">전체</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                                </select>
                            </div>
                        </td>

                        <td>
                            <div id="search">
                                <div class="input-group col-md-12">
                                    <c:choose>
                                        <c:when test="${empty param.searchType}">
                                            <input type="text" id="board_searchWord" name="searchWord"/>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" id="searchWord" name="searchWord" value="${param.searchWord}"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="input-group-btn">
                                     <button type="button" id="board_search_btn" class="btn btn-info btn-lg" >
                                         <i class="glyphicon glyphicon-search"></i>
                                     </button>
                                  </span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>

</div>

</body>
</html>
