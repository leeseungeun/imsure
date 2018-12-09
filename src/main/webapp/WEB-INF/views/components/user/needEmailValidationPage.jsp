<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/user/user.main.css">
<link rel="stylesheet" type="text/css" href="resources/css/user/user.need.email.validation.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp"/>

<div class="need-email-validation-wrapper">
  <h4>
    <span class="application-name">I'MSURE</span>의 
    <span class="highlight-text">보험 추천 결과</span>를 확인하기 위해 
    <span class="highlight-text">이메일 인증</span>을 해주세요!</h4>
  <div class="img-wrapper">
    <img src="resources/img/user/email-validation.png">
  </div>
  <div class="button-wrapper">
    <button type="button" class="btn prev-btn">인증 이메일 다시 받기</button>
    <button type="button" class="btn">인증 완료</button>
  </div>
</div>