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
        <div class="col-sm-6 forms output step-txt" style="min-height: 589px;">
            <div class="chartContainer">
            <h4>김땡땡님과 비슷한 사람들이 가입한 보험종류는?</h4>
            <!-- 연령 -->
            <div id="ageChart">
              <h5>연령별 보험종류</h5>
            </div>
          <!-- 직업군 -->
            <div id="jobChart">
              <h5>직업군별 보험종류</h5>
            </div>
          <!-- 소득 -->
            <div id="incomeChart">
              <h5>소득별 보험종류</h5>
            </div>
           </div>  
        </div>
         <div class="col-sm-6 forms step-area" style="min-height: 589px;">
           <div class="bgChange">
                <ul class="nav nav-tabs">
                <!-- 선택했을때 이벤트 처리! -->
                    <li class=".step-tab" style="width:20%">암/성인병</li>
                    <li class=".step-tab" style="width:20%">질병</li>
                    <li class=".step-tab" style="width:20%">연금</li>
                    <li class=".step-tab" style="width:20%">저축</li>
                    <li class=".step-tab" style="width:20%">더보기</li>
                </ul>
                <div class="form-area step1 on">
                  <!-- 추천 결과가 표시되는 영역 start -->
                  <div class="recommendation-list"></div>
                </div>
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
<script>

new Chartist.Pie('#ageChart', {
	  labels: ['Bananas', 'Apples', 'Grapes', '질병보험'],
	  series: [20, 10, 30, 40]
	}, {
	  donut: true,
	  donutWidth: 40,
	  donutSolid: true,
	  startAngle: 270,
	  showLabel: true
});

new Chartist.Pie('#jobChart', {
	  labels: ['Bananas', 'Apples', 'Grapes', '질병보험'],
	  series: [20, 10, 30, 40]
	}, {
	  donut: true,
	  donutWidth: 40,
	  donutSolid: true,
	  startAngle: 270,
	  showLabel: true
});

new Chartist.Pie('#incomeChart', {
	  labels: ['Bananas', 'Apples', 'Grapes', '질병보험'],
	  series: [20, 10, 30, 40]
	}, {
	  donut: true,
	  donutWidth: 40,
	  donutSolid: true,
	  startAngle: 270,
	  showLabel: true
});

function myFunction() {
    var x = document.getElementById("myDIV");
    var y = $(".chartContainer")
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

 
</script>

<!-- Plugins -->



