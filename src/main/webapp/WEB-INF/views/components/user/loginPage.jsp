<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="resources/css/user/user.util.css">
<link rel="stylesheet" type="text/css" href="resources/css/user/user.main.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp"/>

<div class="limiter">
  <div class="container-login100">
    <div class="wrap-login100 p-t-85 p-b-20">
      <form class="login100-form validate-form">
        <span class="login100-form-title p-b-70"> 로그인 </span>
        
        <div class="wrap-input100 validate-input m-t-85 m-b-35"
          data-validate="올바른 이메일을 입력해주세요">
          <input class="input100" type="text" name="email"> <span
            class="focus-input100" data-placeholder="test@email.com"></span>
        </div>

        <div class="wrap-input100 validate-input m-b-50"
          data-validate="올바른 비밀번호를 입력해주세요">
          <input class="input100" type="password" name="password"> <span
            class="focus-input100" data-placeholder="영문 대소문자, 숫자 포함  8-16자"></span>
        </div>

        <div class="container-login100-form-btn">
          <button class="login100-form-btn btn">로그인</button>
        </div>

        <ul class="login-more p-t-190">
          <li>
            <span class="txt1"> 아직 </span>
            <a href="all/registerPage" class="txt2 a-nav"> 회원 </a>
            <span class="txt1"> 이 아니신가요? </span>
          </li>
          <li class="m-b-8">
            <a href="all/resetPasswordPage" class="txt2 a-nav"> 비밀번호 </a>
            <span class="txt1"> 가 생각나지 않으신가요? </span> 
          </li>

        </ul>
      </form>
    </div>
  </div>
</div>


<div id="dropDownSelect1"></div>

<!-- JavaScript -->
<!-- Plugins -->
<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<script src="resources/vendor/bootstrap/js/popper.min.js"></script>
<script src="resources/vendor/select2/select2.min.js"></script>
<script src="resources/vendor/daterangepicker/moment.min.js"></script>
<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<script src="resources/js/user/common.js"></script>
<script src="resources/js/user/login.js"></script>
