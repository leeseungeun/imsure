<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- meta information -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="life insurance recommendation system, I'MSURE">
    <meta name="author" content="LEE SEUNGEUN & RYU SEAEUN">

    <!-- title -->
    <title>I'MSURE</title>
    <link rel="shortcut icon" type="image/x-icon" href="/resources/img/common/favicon.ico">

    <!-- Bootstrap Core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/common/common.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav>
      <a class="menu-toggle rounded" href="#">
        <i class="fas fa-bars"></i>
      </a>
      <!-- active 되는 부분 -->
      <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
          <li class="sidebar-brand">
            <a class="nav-a js-scroll-trigger" href="all/mainPage">메인</a>
          </li>
          <li class="sidebar-nav-item">
            <a class="nav-a js-scroll-trigger" href="all/loginPage">
             <i class="icon-login"></i>
             <span>로그인</span>
            </a>
          </li>
          <li class="sidebar-nav-item">
            <a class="nav-a js-scroll-trigger" href="uncertified-user/psychologicPage">
              <i class="icon-heart big-nav-icon"></i>
              <span>심리 지표로 <br/>생명보험 추천받기</span>
            </a>
          </li>
          <li class="sidebar-nav-item">
            <a class="nav-a js-scroll-trigger" href="user/demographicPage">
              <i class="icon-people big-nav-icon"></i>
              <span>인구통계 지표로 <br/>생명보험 추천받기</span>
            </a>
          </li>
          <li class="sidebar-nav-item">
            <a class="nav-a js-scroll-trigger" href="">
              <i class="icon-list"></i>
              <span>내 보험 관리하기</span>
            </a>
          </li>
          <li class="sidebar-nav-item">
            <a class="nav-a js-scroll-trigger" href="user/psychologicResultPage">
              <i class="icon-list"></i>
              <span>(임시) 심리지표 결과페이지</span>
            </a>
          </li>
          <li class="sidebar-nav-item">
            <a class="nav-a js-scroll-trigger" href="user/demographicResultPage">
              <i class="icon-list"></i>
              <span>(임시) 인구통계 결과페이지</span>
            </a>
          </li>
          <li class="sidebar-nav-item">
            <a class="nav-a js-scroll-trigger" href="user/chatbotPage">
              <i class="icon-list"></i>
              <span>(임시) 채팅</span>
            </a>
          </li>
        </ul>
      </nav>
    </nav>

    <!-- 동적으로 내용이 바뀌는 영역 -->
    <section></section>
        
    <!-- footer -->
    <jsp:include page="includes/footer.jsp"/>

    <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/js/common/Router.js"></script>
    <script src="resources/js/common/Utils.js"></script>
    <script src="resources/js/common/common.js"></script>
  </body>

</html>
