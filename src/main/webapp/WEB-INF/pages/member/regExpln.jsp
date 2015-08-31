<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/explanation.css" />">

    <script src="<c:url value="/resources/js/updownScroll.js" />"></script>

    <title>토비랜드</title>
</head>

<body>

<jsp:include page="/top" flush="true"/>

<div class="container">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8 rgframe">
            <br />
            <h3>회원가입</h3>
            <hr />
            <div align="center" class="warn">
                *토비랜드에 가입하기 위해서는 학생인증을 위해 한국산업기술대학교 메일 계정이 반드시 있어야합니다.
                <br />
                <br />
                <a href="http://mail.kpu.ac.kr/login" target="_blank">KPU 메일 확인하기</a>
                <br />
                <br />
            </div>
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        가입절차
                    </label>
                    <div class="col-sm-9">
						<textarea class="form-control" rows="25" readonly>
1. 가입 양식을 작성하고 회원가입을 합니다

*가입 양식 중 선호방식은 본인 성향에 따라 선택하시면 됩니다. 추후 강의평 조회시 참고 자료로 사용됩니다

수업방식
 독고다이 - 학우들과 소통없이 혼자 수업을 선호
 토론     - 학우들과 함께 참여하는 수업을 선호
 실습     - 실습을 위주의 수업을 선호

과제방식
 개인과제 - 혼자하는 과제를 선호
 팀 과제  - 팀으로 하는 과제를 선호
 텀 프로젝트 - 한 주제를 가지고 팀을 이뤄 한 학기 내내 이루어지는 과제를 선호

시험방식
 혼합 - 객관식, 단답식, 서술형 등 혼합 방식을 선호
 서술 - 오로지 서술 형식으로만 이루어진 방식을 선호
 실습 - 실습을 통한 방식을 선호


2. 가입 후 한국산업기술대학교 계정으로 보내진 가입 인증 메일의 인증 링크를 통해 인증해야지만 가입완료가 됩니다
                        </textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div align="center">
                        <button type="button" onclick="location.href='/member/regForm'" class="btn btn-primary">다음</button>
                        <button type="submit" onclick="history.back()" class="btn btn-default">취소</button>
                    </div>
                </div>
            </form>
            <br />
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
