<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="<c:url value="/resources/js/searchbar.js" />"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value="/resources/css/searchinfo.css" />">
  <link rel="stylesheet" href="<c:url value="/resources/css/pagenum.css" />">


  <title>Tobby - 산기대 강의평가 시스템</title>
</head>

<body>

<div class="container">

  <hr size="40" width="100%" color="#5d5d5d"/><br/>

  <div id="subname">
    기업데이터 분석
    <h4>임홍순 교수님</h4><p>

  </div>

  <div class="tabbable-panel">
    <div class="tabbable-line">
      <ul class="nav nav-tabs ">
        <li class="active">
          <a href="#tab_default_1" data-toggle="tab">
            강의 평가 </a>
        </li>
        <li>
          <a href="#tab_default_2" data-toggle="tab">
            강의 정보 </a>
        </li>
        <li>
          <a href="#tab_default_3" data-toggle="tab">
            강의 계획서 </a>
        </li>
      </ul>


      <div class="tab-content">
        <div class="col-md-4 col-md-push-4">
        </div>
        <div class="col-md-4 col-md-pull-4 ">
          <div align="center"><h3>평균 평점 :
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
            <span class="glyphicon glyphicon-star-empty"></span></h3></div>
        </div>
        <div class="col-md-4">
          <div align="right"><a href="subwrite.html"><button type="button" class="btn btn-primary"><h4>리뷰 작성하기</h4></button></a></div></div></a>
      </div>

      <div class="col-md-4 col-md-push-4">
      </div>
      <div class="col-md-4 col-md-pull-4 ">
        <div>
        </div>
      </div>
      <div class="col-md-4" align="right">

      </div>

      　<div class="tab-pane active" id="tab_default_1">
      <div class="container">
        <form class="form-horizontal" role="form">

          <c:forEach var="evaluation" items="${evaluations}" varStatus="status">

          <div class="review">
            <h4><label class="col-sm-9">
              <p>"spss를 적극적으로 이용하여 데이터마이닝을 배운점은 맘에 들지만,</p>
            </label></h4>
            <hr color="#333333" width="90%"/>
            <div class="form-group">
              <h4><label class="col-sm-2 control-label">평점　</label>
                <p>${evaluation.score}</p>
              </h4>
              <h4><label class="col-sm-2 control-label">학기　</label>
                <p>${evaluation.semester}</p>
              </h4>
              <hr color="#333333" width="90%"/>
              <div class="form-group">
                <h4><label class="col-sm-2 control-label">수업 방식</label></h4>
                <div class="col-sm-9">
                  <p>${evaluation.method}</p>
                </div>
              </div>
              <div class="form-group">
                <h4><label class="col-sm-2 control-label">과제</label></h4>
                <div class="col-sm-9">
                  <p>${evaluation.task}</p>
                </div>
              </div>
              <div class="form-group">
                <h4><label class="col-sm-2 control-label">시험</label></h4>
                <div class="col-sm-9">
                  <p>${evaluation.exam}</p>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-5 col-sm-6">
                  <button type="button" class="btn btn-primary">23<br>공감</button>
                  <button type="button" class="btn btn-danger">2<br>비공감</button>
                </div>
              </div>

            </div>
        </div>
          </c:forEach>

        </form>
      </div>
    </div>




    </div>
  </div>
</div>

</body>
</html>