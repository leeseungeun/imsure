<%@page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.demographicResult.css">
<link rel="stylesheet"
  href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
<!-- header -->
<jsp:include page="../../includes/header.jsp" />

<div class="container ng-scope">
  <div id="recommend" class="wrapper row">
    <div class="col-sm-12" id="result-part">
      <div class="row">
        <div class="col-sm-8" style="padding:5px">
          <div class="chartContainer">
            <h4><span id="userNameTitle"></span>님과 비슷한 사람들이 가입한 보험종류는?</h4>
            <!-- 연령 -->
            <div id="ageChartDiv" style="margin:7% auto">
              <h5>연령별 보험종류</h5>
              <canvas id="ageChart" width="5"></canvas>
            </div>
            <!-- 직업군 -->
            <div id="jobChartDiv" style="float:left">
              <h5>직업군별 보험종류</h5>
              <canvas id="jobChart" width="5" ></canvas>
            </div>
            <!-- 소득 -->
            <div id="incomeChartDiv" style="float:right;">
               <h5>소득별 보험종류</h5>
               <canvas id="incomeChart" width="5"></canvas>
            </div>
          </div>
        </div>
        <div class="col-sm-4 output step-txt"
              style="min-height: 589px;">
              <form role="form" class="ng-pristine ng-valid">
                <div class="analysResultDiv">
                  <p class="txt-board">
                    <span id="isMarriedComment"></span><br>
                    <span id="userNameResult"
                      class="info-txt typeName ng-binding"></span>
                    님에게  꼭 필요한 보험은<br> <span id="insuranceTypeFirst"
                      class="info-txt ng-binding"></span>, <span id="insuranceTypeSecond"
                      class="info-txt ng-binding"></span> 보험이며,<br>
                    고려해볼만한 보험은<br> <span id="insuranceTypeThird"
                      class="info-txt ng-binding"></span>,
                      <span id="insuranceTypeFourth"
                      class="info-txt ng-binding"></span><br> 보험입니다.
                  </p>
                  <button class="button" id="recommendButton">
                    <span>맞춤보험 보기</span>
                  </button>
                </div>
            </form>
          </div>
       </div>
    </div>
  </div>
</div>


<!-- 알고리즘 설명 모달 -->
<jsp:include page="../../includes/demographicAlgorithmDescriptionModal.jsp" />

<!-- 보험 상세 모달 -->

<!-- JavaScript -->
<script src="/resources/js/common/Chart.js"></script>
<script src="/resources/js/recommendation/demographicResult.js"></script>
<!-- Plugins -->