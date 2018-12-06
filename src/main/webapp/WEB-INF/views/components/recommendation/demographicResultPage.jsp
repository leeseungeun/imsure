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
        <div class="col-sm-6">
          <div class="chartContainer">
            <h4>김땡땡님과 비슷한 사람들이 가입한 보험종류는?</h4>
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
        
        <div class="col-sm-6 forms output step-txt"
              style="min-height: 589px;">
              <form role="form" class="ng-pristine ng-valid">
                <div class="form-txt-board">
                  <p class="txt-board">
                    싱글라이프를 살고 있는 <span
                      class="info-txt typeName ng-binding">김땡땡</span>
                    님에게<br> 꼭 필요한 보험은<br> <span
                      class="info-txt ng-binding">암, 성인병</span>, <span
                      class="info-txt ng-binding">질병</span> 보험이며,<br>
                    고려해볼만한 보험은<br> <span
                      class="info-txt ng-binding">저축</span>,<br
                      class="txt-board-br"> <span
                      class="info-txt ng-binding">연금</span> 보험입니다.
                  </p>
                  <button class="button" id="recommendButton">
                    <span>맞춤보험 보기 </span>
                  </button>
                </div>

              </form>
            </div>
          </div>
    </div>
  </div>
</div>

<!-- 알고리즘 설명 모달 -->
<!-- 인구통계학적 추천은 알고리즘 설명이 필요 없는지? -->

<!-- 보험 상세 모달 -->

<!-- JavaScript -->
<!-- <script src="/resources/js/common/chartist.min.js"></script> -->
<script src="/resources/js/common/Chart.js"></script>
<script>
	var ctx = document.getElementById("ageChart");
	var data = {
		labels : [ "암,성인병", "질병", "연금" ],
		datasets : [ {
			label : "가입 보험 비율",
			data : [ 300, 50, 100 ],
			backgroundColor : [ "rgb(255, 99, 132)", "rgb(54, 162, 235)",
					"rgb(255, 205, 86)" ],
		} ]
	}

	var myDoughnutChart = new Chart(ctx, {
		type : 'doughnut',
		data : data,
		options : {
			responsive : true,
			legend : {
				position : 'right',

			},
			animation : {
				animateScale : true,
				animateRotate : true
			}
		}
	});

	var ctx2 = document.getElementById("jobChart");
	var data = {
		labels : [ "암,성인병", "질병", "연금" ],
		datasets : [ {
			label : "가입 보험 비율",
			data : [ 20, 50, 30 ],
			backgroundColor : [ "rgb(255, 99, 132)", "rgb(54, 162, 235)",
					"rgb(255, 205, 86)" ]
		} ]
	}

	var myDoughnutChart = new Chart(ctx2, {
		type : 'doughnut',
		data : data,
		options : {
			responsive : true,
			legend : {
				position : 'right',

			},
			animation : {
				animateScale : true,
				animateRotate : true
			}
		}
	});

	var ctx3 = document.getElementById("incomeChart");
	var data = {
		labels : [ "암,성인병", "질병", "연금" ],
		datasets : [ {
			label : "가입 보험 비율",
			data : [ 20, 50, 30 ],
			backgroundColor : [ "rgb(255, 99, 132)", "rgb(54, 162, 235)",
					"rgb(255, 205, 86)" ]
		} ]
	}

	var myDoughnutChart = new Chart(ctx3, {
		type : 'doughnut',
		data : data,
		options : {
			responsive : true,
			legend : {
				position : 'right',
			},
			animation : {
				animateScale : true,
				animateRotate : true
			}
		}
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

	$('#recommendButton').on('click', function(event) {

	});
</script>

<!-- Plugins -->