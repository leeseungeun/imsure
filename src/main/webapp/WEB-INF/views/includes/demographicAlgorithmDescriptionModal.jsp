<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.psychologic.whysure.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.demographic.whysure.css">
  
<!-- 알고리즘 설명 모달 -->
<div class="modal fade" id="algorithmDescriptionModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <span class="modal-title">
           Why sure : <span class="application-name">&#8544'MSURE</span>은 어떻게 <br /> 
           <span class="recommendation-highlight">확신</span>할 수 있는가?
        </span>
        <button type="button" class="close" data-dismiss="modal">
          &times;
        </button>
      </div>
      <div class="modal-body">
        <div class="paragraph-text">
          <ul class="paragraph-list">
            <li class="paragraph:before">
              <h5>
              <span class="question-number">01</span>한 눈에 들어오는 데이터</h5>
              <div class="img-wrapper">
                <img class="whysure-img" alt="데이터 도넛 차트"
                  src="resources/img/recommendation/demographic_result_whysure_donut.png">
              </div>
              <p> 통계청의 
               <span class="recommendation-highlight">'생명보험성향조사:최근 가입 보험 종류'</span>를
               <br/> 연령 별, 소득 별, 직업군 별로 
               <span class="recommendation-highlight">시각화</span>했습니다.</p>
            </li>

            <li class="paragraph:before">
              <h5>
              <span class="question-number">02</span>보험의 다차원적 분석</h5>
              <div class="img-wrapper">
                <img class="whysure-img" alt="상품 정밀 분석 및 필터링"
                  src="resources/img/recommendation/demographic_result_whysure_documents.png">
              </div>
              <p> 손님의 
                <span class="recommendation-highlight">인구 통계학적 정보</span>에 따라 생명보험협회 비교공시실 기준 하나생명  
                <span class="recommendation-highlight">전 상품</span> (40개)을 분석해 
                <span class="recommendation-highlight">분류</span>하였습니다.</p>
              <p class="recommendation-standard">
                  <span class="recommendation-standard-title">어떤 인구 통계학적 특성들을 고려했을까요?</span><br>
                  - 암 가족력 여부<br>
                  - 연령<br> 
                  - 소득<br> 
                  - 결혼여부<br> 
                  - 자녀유무
            </li>
            <li class="paragraph:before">
              <h5 class="example-title">조금 더 자세히 살펴볼까요?</h5>
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
</div>