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
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/common/common.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/user/user.main.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/user/user.need.email.validation.css">

  </head>

  <body id="page-top">


    <!-- header -->
    <jsp:include page="includes/header.jsp"/>
    
    <section>
      <div class="need-email-validation-wrapper">
        <div class="img-wrapper">
          <img src="/resources/img/user/email-validation.png">
        </div>
        <div class="button-wrapper">
          <h3>이메일 인증이 <span class="highlight-text">실패</span>했습니다.</h3>
        </div>
      </div>
    </section>
        
    <!-- footer -->
    <jsp:include page="includes/footer.jsp"/>

    <!-- Bootstrap core JavaScript -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
