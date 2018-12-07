<%@ page language="java" contentType="text/html; charset=utf-8"%>

<link rel="stylesheet" type="text/css"
	href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/recommendation/recommendation.psychologic.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/recommendation/recommendation.custom.common.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.psychologic.whysure.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp" />

<div class="container ng-scope">
	<div id="recommend" class="wrapper row">
		<div class="col-sm-12" id="result-part">
			<div class="row">
				<div class="col-sm-6">
					<h4 class="recommendation-title">심리검사 결과</h4>
					<div class="graph">
						<canvas id="myChart" class="chartjs" width="600" height="300"></canvas>
					</div>
                    <div>
                      <p class="txt-board">
                        당신은<br/>
                        <span class="info-txt ng-binding" id="personality1"></span> 사람입니다.<br class="txt-board-br"><br>
                        또한,
                        <span class="info-txt ng-binding" id="personality2"></span> 편입니다!
                       
                    </p>
                    </div>
				</div>
				<div class="col-sm-6">
					<div class="title-wrapper">
						<h4 class="recommendation-header">
                            그런 당신에게<br>
							<span class="application-name">I'M SURE</span>에서 확신하는 <span
								class="recommendation-highlight">추천</span> 생명보험은?
						</h4>
						<button type="button" class="btn" data-toggle="modal"
							data-target="#algorithmDescriptionModal">Why SURE ?</button>
					</div>
					<!-- 추천 결과가 표시되는 영역 start -->
					<div class="recommendation-list"></div>
					<!-- 추천 결과가 표시되는 영역 end -->
				</div>
			</div>
		</div>
	</div>
</div>
<div id="insurance-detail-wrapper"></div>

<!-- 알고리즘 설명 모달 -->
<jsp:include page="../../includes/psychologicAlgorithmDescriptionModal.jsp" />

<!-- JavaScript -->
<script src="resources/js/common/Chart.js"></script>
<script src="resources/js/common/Insurance.js"></script>
<script src="resources/js/recommendation/psychologicResult.js"></script>
<script src="resources/js/recommendation/psychologicResultModalChart.js"></script>
