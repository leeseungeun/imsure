<%@ page language="java" contentType="text/html; charset=utf-8"%>
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.psychologic.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp" />

<div class="container ng-scope">
  <div id="recommend" class="wrapper row">
    <div class="forms step-area">
      <h1 class="likert-header">심리 검사하기</h1>
      <div class="bgChange">
        <p class="validation-fail-message message-top" style="display: none;">
          <span>모든 질문에 응답해주세요</span>
        </p>
        <ul class="nav nav-tabs tabType2">
          <!-- 단계 탭을 동적으로 생성 -->
        </ul>
        <!-- 설문지 내용을 동적으로 만들어 붙여주는 부분 -->
        <div class="btn-block btn-input">
        </div>
        <p class="validation-fail-message message-bottom" style="display: none;">
          <span>모든 질문에 응답해주세요</span>
        </p>
      </div>
    </div>
  </div>
</div>


<!-- JavaScript -->
<script src="resources/js/recommendation/PsychologicTest.js"></script>
<script src="resources/js/recommendation/psychologic.js"></script>