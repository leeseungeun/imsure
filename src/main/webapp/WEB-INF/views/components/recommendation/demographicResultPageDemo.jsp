<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.demographicResult.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
<!-- header -->
<jsp:include page="../../includes/header.jsp"/>

<div class="container ng-scope">
  <div id="recommend" class="wrapper row">
    <div class="col-sm-12" id="result-part">
      <div class="row">
        <div class="col-sm-4 output step-txt"style="min-height: 589px;">
          <form role="form" class="ng-pristine ng-valid">
            <div class="analysResultDiv">
              <p class="txt-board">
                <span id="isMarriedComment"></span><br>
                <span id="userNameResult" class="info-txt typeName ng-binding"></span>
                님에게  꼭 필요한 보험은<br> 
                <span id="insuranceTypeFirst" class="info-txt ng-binding"></span>, 
                <span id="insuranceTypeSecond" class="info-txt ng-binding"></span> 보험이며,<br>
                고려해볼만한 보험은<br> 
                <span id="insuranceTypeThird" class="info-txt ng-binding"></span>,
                <span id="insuranceTypeFourth" class="info-txt ng-binding"></span><br> 보험입니다.
              </p>
            </div>
          </form>
        </div>
        <div class="col-sm-8 forms step-area" style="min-height: 589px;">
          <div class="bgChange">
          <div class="title-wrapper">
            <h4 class="recommendation-header">
              <span class="application-name">I'M SURE</span>에서 확신하는 
              <span class="recommendation-highlight">추천</span> 생명보험은?
            </h4>
            <button type="button" class="btn" data-toggle="modal"
              data-target="#algorithmDescriptionModal">Why SURE ?</button>
          </div>
            <ul class="nav nav-tabs">
              <li class="step-tab" style="width:20%">질병</li>
              <li class="step-tab" style="width:20%">재해/상해</li>
              <li class="step-tab" style="width:20%">사망</li>
              <li class="step-tab" style="width:20%">연금</li>
              <li class="step-tab" style="width:20%">저축</li>
              <li class="step-tab" style="width:20%">더보기</li>
            </ul>
            <div id="cardSection"></div>
            <button class="buttonPrev"><span> 이전</span></button>
           </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 알고리즘 설명 모달 -->
<!-- 인구통계학적 추천은 알고리즘 설명이 필요 없는지? -->

<!-- 보험 상세 모달 -->

<!-- JavaScript -->
<script src="/resources/js/common/chartist.min.js"></script>
<script src="/resources/js/common/Insurance.js"></script>
<script src="/resources/js/recommendation/demographicResultDemo.js"></script>
<!-- Plugins -->



