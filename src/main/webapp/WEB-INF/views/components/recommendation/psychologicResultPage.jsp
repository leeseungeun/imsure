<%@ page language="java" contentType="text/html; charset=utf-8"%>

<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.psychologic.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.custom.common.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp" />

<div class="container ng-scope">
  <div id="recommend" class="wrapper row">
    <div class="col-sm-12" id="result-part">
      <div class="row">
        <div class="col-sm-6">
          <h4 class="recommendation-title">심리검사 결과</h4>
          <div class="graph">
            <canvas id="myChart" class="chartjs" width="600"
              height="400"></canvas>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="title-wrapper">
            <h4 class="recommendation-header">
              <span class="application-name">&#8544'M SURE</span>에서 확신하는
              <span class="recommendation-highlight">추천</span> 생명보험은?
            </h4>
            <button type="button" class="btn" data-toggle="modal"
              data-target="#algorithmDescriptionModal">Why SURE
              ?</button>
          </div>
          <!-- 추천 결과가 표시되는 영역 start -->
          <div class="recommendation-list"></div>
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
        <span class="modal-title">Why sure : I'M SURE은 어떻게
          확신할 수 있는가?</span>
        <button type="button" class="close" data-dismiss="modal"
          style="width: 5%; margin-right: 0.5%">×</button>
      </div>
      <div class="modal-body">
        <div class="modal-title" id="modal-top">
        <h4>I'MSURE가 확신할 수 있는 이유</h4>
        </div>
        <div class="paragraph-text">
       	 <ul class="paragraph-list">
       	  	<li class="paragraph:before">
       	  		<h5>상품 정밀 분석</h5>
       	  		<div class="img-wrapper">
                <img class="whysure-img" alt="보험상품"
                  src="resources/img/recommendation/resultpage_whysure_insurance.png">
                  
              	</div>
       	 			<p>
       	 			생명보험협회 비교공시실 기준으로, 개인 가입이 가능한 하나 보험상품 40개를 하나하나 정밀분석하였어요.
       	 			보험상품의 종류, 가입가능연령, 채널, 보장범위를 분석하여 각 상품의 주요 특징과 강점을 파악했답니다.
       	 			이것을 바탕으로 손님의 정보에 적합한 상품을 분류하였어요. 
       	 			</p>
			</li>
			
			<li class="paragraph:before">
				<h5>다양한 분석 논문 및 통계자료</h5>
				<div class="img-wrapper">
                <img class="whysure-img" alt="논문 및 통계자료"
                  src="resources/img/recommendation/resultpage_whysure_reference.png", height="130px", style="margin:50px">
              	</div>
        		<p>13개의 논문과 통계자료를 바탕으로 성격과 필요한 생명보험간의 관계를 고려하였어요.<br>
        			I'MSURE이 고려한 내용은 다음과 같아요.
        		</p>
        		<p style="text-align:left; margin-left:60px"> 
        			<font color="#ff0057">
        			1) 특정 성격에 더 취약한 질병<br>
        			2) 특정 성격에 더 취약한 재해 및 상해<br>
        			3) 보험 가입 목적과 성격<br>
        			4) 보험 유지 가능성과 성격
        			</font>
        	</li>
        	<li>		
        		<h5>knn 알고리즘 기반</h5>
        		<div class="img-wrapper">
                <img class="whysure-img" alt="알고리즘"
                  src="resources/img/recommendation/resultpage_whysure_algorithm.png", height="130px", style="margin:50px">
              	</div>
              	<blockquote>
				<p>knn 알고리즘을 기반으로 손님의 성격 지표와 상품 특성간의 유사성을 분석하였어요.</p>
				</blockquote>
				<div class="graph">
            		<canvas id="chartJSContainer" class="chartjs" ></canvas>
          		</div>
				<p>내향적이고 성실한 손님의 경우를 예로 들어볼게요.<br>
				   내향성과 성실성은 저축과 상관관계가 존재해요.<br>
				   그리고 위험 성향이 낮기 때문에,<br>
				   연금저축보험을 적극 추천!<br>
				</p>
			</li>
			<li>
				<h4 style="line-height:35px">분석에 사용된 자료들을 <br>
					자세히 알고 싶다면?</h4>
				<button type="button" class="btn btn-dark" id="toggle-references" data-toggle="button" aria-pressed="false" autocomplete="off" onclick="$('.references').toggle('slow')">
  				상세보기</button>
  					<li class="references" style="margin-top:30px">1) Dahlen, E. R., & White, R. P. (2006). The Big Five factors, sensation seeking, and driving anger in the prediction of unsafe driving. Personality and Individual Differences, 41(5), 903-915.</li>
  					<li class="references">2) Nyhus, E. K., & Webley, P. (2001). The role of personality in household saving and borrowing behaviour. European journal of personality, 15(S1), S85-S103.</li>
  					<li class="references">3) Fyhri, A., & Backer-Grøndahl, A. (2012). Personality and risk perception in transport. Accident Analysis & Prevention, 49, 470-475.</li>
  					<li class="references">4) Kaasinen, V., Nurmi, E., Bergman, J., Eskola, O., Solin, O., Sonninen, P., & Rinne, J. O. (2001). Personality traits and brain dopaminergic function in Parkinson's disease. Proceedings of the National Academy of Sciences, 98(23), 13272-13277.</li>
  					<li class="references">5) Nicholson, N., Soane, E., Fenton‐O'Creevy, M., & Willman, P. (2005). Personality and domain‐specific risk taking. Journal of Risk Research, 8(2), 157-176.</li>
  					<li class="references">6) Caligiuri, P. M. (2000). The big five personality characteristics as predictors of expatriate's desire to terminate the assignment and supervisor‐rated performance. Personnel psychology, 53(1), 67-88.</li>
					<li class="references">7) Egloff, B., & Gruhn, A. J. (1996). Personality and endurance sports. Personality and Individual Differences, 21(2), 223-229.</li>
					<li class="references">8) Burnett, J. J., & Palmer, B. A. (1984). Examining life insurance ownership through demographic and psychographic characteristics. Journal of risk and insurance, 453-467.</li>
					<li class="references">9) Outreville, J. F. (2014). Risk aversion, risk behavior, and demand for insurance: A survey. Journal of Insurance Issues, 158-186.</li>
					<li class="references">10) 류건식, & 이경희. (2001). 생명보험상품에 대한 소비자구매성향분석. 보험학회지, 58, 199-224.</li>
					<li class="references">11) 백은영, & 정순희. (2005). 저축성 보험 보유 및 보유액에 영향을 미치는 요인 분석. 한국가정관리학회지, 23(3), 217-230.</li>
					<li class="references">12) 박수현, 최성수, & 권용주. (2014). 특급호텔 구성원의 성격유형 (Big5) 이 주관적 성과에 미치는 영향. 관광연구저널, 28(1), 171-186.</li>
					<li class="references">13) 동향분석실. (2017). 2017 보험소비자 설문조사. 보험연구원.</li>
  				</ul>
				</p>
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
  </div>
</div>

<!-- JavaScript -->
<script src="resources/js/common/Chart.js"></script>
<script src="resources/js/common/Insurance.js"></script>
<script src="resources/js/recommendation/psychologicResult.js"></script>
<script src="resources/js/recommendation/psychologicResultModalChart.js"></script>
