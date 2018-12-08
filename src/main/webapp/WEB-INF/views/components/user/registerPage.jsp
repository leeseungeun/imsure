<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="resources/css/user/user.util.css">
<link rel="stylesheet" type="text/css" href="resources/css/user/user.main.css">
<link rel="stylesheet" type="text/css" href="resources/css/user/user.register.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp"/>

<div class="limiter">
  <div class="container-login100">
    <div class="wrap-login100 p-t-85 p-b-20">
      <form class="login100-form validate-form">
        <span class="login100-form-title p-b-70"> 회원가입 </span>
        
        <div class="wrap-input100 validate-input m-t-85 m-b-35"
          data-validate="올바른 이메일을 입력해주세요">
          <input class="input100" type="text" name="email"> <span
            class="focus-input100" data-placeholder="이메일"></span>
        </div>

        <div class="wrap-input100 validate-input m-b-50"
          data-validate="올바른 비밀번호를 입력해주세요">
          <input class="input100 include-mobile-password-show-button" type="password" name="password"> 
          <span class="focus-input100" data-placeholder="비밀번호"></span>
          <span class="icon-eye mobile-password-show-button"></span>  
        </div>
        
        <div class="wrap-input100 validate-input m-b-50 passwordConfirm-wrapper"
          data-validate="위에서 입력하신 비밀번호와 동일한 비밀번호를 입력해주세요">
          <input class="input100" type="password" name="passwordConfirm"> 
          <span class="focus-input100" data-placeholder="비밀번호 확인"></span>
        </div>

        <div class="container-login100-form-btn">
          <button type="button" class="login100-form-btn btn" id="register">회원가입</button>
        </div>
        
        <p class="validation-fail-message result-message" style="display: none;">
          <span>이미 사용 중인 이메일입니다</span>
        </p>

        <ul class="login-more p-t-190">
          <li class="m-b-8">
            <span class="txt1">이미 회원이시라면, </span> 
            <a href="all/loginPage" class="txt2" id="a-nav-login"> 로그인 </a>
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
<script src="resources/js/user/register.js"></script>