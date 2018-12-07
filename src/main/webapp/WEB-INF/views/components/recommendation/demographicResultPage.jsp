<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css"
	href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/recommendation/recommendation.demographic.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/recommendation/recommendation.demographic.whysure.css">
	
<!-- header -->
<jsp:include page="../../includes/header.jsp" />

<div class="container ng-scope">
	<div id="recommend" class="wrapper row">
		<h2>미혼 여성이며 26세의 근로소득자인 OOO님의 결과 입니다.</h2>

		<div class="col-sm-12" id="result-part">
			<div class="row">
				<div class="col-sm-6">
					<h4 class="recommendation-title">OOO님과 비슷한 사람들이 가입한 보험종류는?</h4>
					<div class="graph">
						<canvas id="myChart1" class="chartjs" width="80" height="40"></canvas>
					</div>
					<div class="graph">
						<canvas id="myChart2" class="chartjs" width="600" height="400"></canvas>
					</div>
					<div class="graph">
						<canvas id="myChart3" class="chartjs" width="600" height="400"></canvas>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="title-wrapper">
						<h4 class="recommendation-header">
							<span class="application-name">I'M SURE</span>에서 확신하는 <span
								class="recommendation-highlight">추천</span> 생명보험은?
						</h4>
						<button type="button" class="btn" data-toggle="modal"
							data-target="#algorithmDescriptionModal">Why SURE ?</button>
					</div>
					<!-- 추천 결과가 표시되는 영역 start -->
					<div class="recommendation-list">
						<div class="insurance-card" data-toggle="modal"
							data-target="#insuranceDetailModal">
							<input type="hidden" id="insuranceId" value="1">
							<div class="img-wrapper">
								<img alt="하나생명"
									src="resources/img/recommendation/hana_logo_small.png">
							</div>
							<div class="contents-wrapper">
								<h5 class="insurance-name">(무)행복knowhowTop3건강보험(보장성)</h5>
								<p class="insurance-type">질병보장보험</p>
							</div>
						</div>
					</div>
					<!-- 추천 결과가 표시되는 영역 end -->
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 알고리즘 설명 모달 -->
<div class="modal fade" id="algorithmDescriptionModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title">인구통계학적 추천은 어떻게 탄생하였나?</span>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body">
				<div class="paragraph-text">
					<ul class="paragraph-list">
						<li class="paragraph:before">
							<h5>
							<span class="question-number">01</span>통계 데이터 시각화</h5>
							<div class="img-wrapper">
								<img class="whysure-img" alt="데이터 도넛 차트"
									src="resources/img/recommendation/demographic_result_whysure_donut.png">
							</div>
							<p>통계청에 게시된 '생명보험성향조사:최근 가입 보험 종류'를 바탕으로 연령별, 소득별, 직업군별 데이터를 수집했습니다.
								그리고 이를 한 눈에 파악하실 수 있도록 도넛 차트로 <span
                  				class="recommendation-highlight">시각화</span>하였습니다.</p>
						</li>

						<li class="paragraph:before">
							<h5>
							<span class="question-number">02</span>상품 정밀 분석 및 필터링</h5>
							<div class="img-wrapper">
								<img class="whysure-img" alt="상품 정밀 분석 및 필터링"
									src="resources/img/recommendation/demographic_result_whysure_documents.png">
							</div>
							<p>생명보험협회 비교공시실 기준 하나생명  <span
                  				class="recommendation-highlight">전 상품</span> (40개)의 특징(보험상품의 종류, 가입가능연령, 채널, 보장범위 등)을 <span
                  				class="recommendation-highlight">정밀분석</span>했습니다.
								이를 통해 각 상품의 주요 특징과 강점을 파악하여 손님의 정보에 적합한 상품을 <span
                  				class="recommendation-highlight">필터링</span>하고 분류하였습니다.</p>
							<p class="recommendation-standard">
                				<span class="recommendation-standard-title">상품 추천을 위한 분석 요소에는 어떤 것이 있을까요?</span><br>
									- 암 가족력 여부<br>
									- 연령<br> 
									- 소득<br> 
									- 결혼여부<br> 
									- 자녀유무
						</li>
						<li class="paragraph:before">
							<h5 class="example-title">인구통계학적 추천 과정을</h5>
							<h5 id="example-title-nextline">조금 더 자세히 살펴볼까요?</h5>
							<div id="div-demographic-flow">
								<img id="demographic-flow" alt="인구통계학적 추천 플로우"
									src="resources/img/recommendation/demographic_result_whysure_flow.png">
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn" data-dismiss="modal">닫기</button>
	</div>
</div>

<!-- 보험 상세 모달 -->
<div class="modal fade" id="insuranceDetailModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title">보험상품 상세보기</span>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="containner" id="modal-top">
					<img src="resources/img/recommendation/hana_logo_small.png"
						width="20%" height="20%"> <span>(무)행복knowhowTop3건강보험(보장성)</span>
				</div>

				<div class="containner" id="modal-bottom">
					<div class='insurance-group'>
						<label>보험종류</label>
						<div>질병보장보험</div>
					</div>
					<div class='insurance-group'>
						<label>가입나이</label>
						<div>0~12세</div>
					</div>
					<div class='insurance-group'>
						<label>보장내용</label>
						<div>고액암, 일반암, 교통장해, 일반장해, 입원비, 수술비 등등등등등등등등등등등ㄹ등</div>
					</div>
					<div class='insurance-group'>
						<label>보험종류</label>
						<div>질병보장보험</div>
					</div>
					<div class='insurance-group'>
						<label>보험종류</label>
						<div>질병보장보험</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- JavaScript -->
<script src="resources/js/common/Chart.js"></script>
<script>
	var ctx = document.getElementById("myChart1");
	var data = {
		labels : [ "Red", "Blue", "Yellow" ],
		datasets : [ {
			label : "My First Dataset",
			data : [ 300, 50, 100 ],
			backgroundColor : [ "rgb(255, 99, 132)", "rgb(54, 162, 235)",
					"rgb(255, 205, 86)" ]
		} ]
	}

	var myDoughnutChart = new Chart(ctx, {
		type : 'doughnut',
		data : data
	//options : options
	});
</script>

<!-- Plugins -->



