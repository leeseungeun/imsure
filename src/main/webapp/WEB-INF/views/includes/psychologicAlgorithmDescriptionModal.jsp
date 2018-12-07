<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<div class="modal fade" id="algorithmDescriptionModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <span class="modal-title"> Why sure : <span
          class="application-name">&#8544'MSURE</span>은 어떻게 <br /> <span
          class="recommendation-highlight">확신</span>할 수 있는가?
        </span>
        <button type="button" class="close" data-dismiss="modal"
          style="width: 5%; margin-right: 0.5%">&times;</button>
      </div>
      <div class="modal-body">
        <div class="paragraph-text">
          <ul class="paragraph-list">
            <li class="paragraph:before">
              <h5>
                <span class="question-number">01</span>하나하나 정밀 분석된 상품
              </h5>
              <div class="img-wrapper">
                <img class="whysure-img" alt="보험상품"
                  src="resources/img/recommendation/resultpage_whysure_insurance.png">
              </div>
              <p>
                생명보험협회 비교공시실 기준 하나 생명 <span
                  class="recommendation-highlight">전 상품</span> (40개)의 특징
                (상품의 종류, 보장범위 등)을 <span class="recommendation-highlight">정밀분석</span>했습니다.<br />
              </p>
            </li>

            <li class="paragraph:before">
              <h5>
                <span class="question-number">02</span>탄탄한 과학적 근거
              </h5>
              <div class="img-wrapper">
                <img class="whysure-img" alt="논문 및 통계자료"
                  src="resources/img/recommendation/resultpage_whysure_reference.png">
              </div>
              <p>
                <span class="recommendation-highlight">12개의 논문과
                  6개의 통계 및 기타 자료</span>를 검토해<br> 심리 측정치에 기반을 둔 <span
                  class="recommendation-highlight">보험 추천 기준을 마련</span>했습니다.<br>
              </p>
              <p class="recommendation-standard">
                <span class="recommendation-standard-title">어떤
                  기준이 있을까요?</span><br> - 성격별로 더 취약한 질병이 있는지 고려했어요!<br>
                - 성격별로 더 취약한 재해 / 상해가 있는지 고려했어요!<br> - 성격과 보험 가입 목적
                간의 관계를 고려했어요!<br> - 성격과 보험 유지 가능성 간의 관계를 고려했어요!
            </li>

            <li>
              <h5>
                <span class="question-number">03</span>정확하고 효율적인 알고리즘의
                사용
              </h5>
              <div class="img-wrapper">
                <img class="whysure-img" alt="알고리즘"
                  src="resources/img/recommendation/resultpage_whysure_algorithm.png">
              </div>
              <p>
                외향성, 친화성, 성실성, 신경성, 개방성 측면에서 <br /> 손님과 상품 특성 간의 유사성을 <br />
                간단하면서도 가장 많이 사용되는 알고리즘을 사용해 <br /> <span
                  class="recommendation-highlight">빠르고 정확하게</span>
                분석했습니다.
              </p>
            </li>
            <li>
              <h5 class="example-title">하나의 예시를 봐볼까요?</h5>
              <p class="example">
                <span class="recommendation-highlight">내향적이고 성실한 손님</span>의 경우를 예로 들어보겠습니다.
              </p>
              <div class="graph">
                <canvas id="chartJSContainer" class="chartjs"></canvas>
              </div>
              <p class="example">
                            그래프 상에서 x, y, z 축은 <br/>
                            각각 외향적인, 성실한, 신경적인 정도를 의미합니다.<br/>
                             이때 <span class="recommendation-highlight">내향적이고 성실한</span> 사람일수록 
               <span class="recommendation-highlight">저축</span>을 할 확률이 
               <span class="recommendation-highlight">높</span>고,<br> 
               <span class="recommendation-highlight">위험</span>을 
               <span class="recommendation-highlight">감수</span>할 확률이 
               <span class="recommendation-highlight">낮</span>습니다.<br>
                            이에 따라 <span class="example-important">연금저축보험</span>을 적극 추천!
              </p>
            </li>
            <li>
              <button type="button" id="toggle-references"
                data-toggle="button" aria-pressed="false"
                onclick="$('.references').toggle('slow')">
                <span class="application-name">&#8544'MSURE</span>의 과학적
                근거를 <br />보다 면밀하게 보시고 싶으시다면?
              </button>
            </li>
            <li class="references">류건식, 이경희. (2001). 생명보험상품에 대한
              소비자구매성향분석. 보험학회지, 58, 199-224.</li>
            <li class="references">박수현, 최성수, 권용주. (2014). 특급호텔 구성원의
              성격유형 (Big5) 이 주관적 성과에 미치는 영향. 관광연구저널, 28(1), 171-186.</li>
            <li class="references">백은영, 정순희. (2005). 저축성 보험 보유 및
              보유액에 영향을 미치는 요인 분석. 한국가정관리학회지, 23(3), 217-230.</li>
            <li class="references">Burnett, J. J., Palmer, B. A.
              (1984). Examining life insurance ownership through
              demographic and psychographic characteristics. Journal of
              risk and insurance, 453-467.</li>
            <li class="references">Caligiuri, P. M. (2000). The big
              five personality characteristics as predictors of
              expatriate's desire to terminate the assignment and
              supervisor‐rated performance. Personnel psychology, 53(1),
              67-88.</li>
            <li class="references" style="margin-top: 30px">
              Dahlen, E. R., White, R. P. (2006). The Big Five factors,
              sensation seeking, and driving anger in the prediction of
              unsafe driving. Personality and Individual Differences,
              41(5), 903-915.</li>
            <li class="references">Egloff, B., Gruhn, A. J. (1996).
              Personality and endurance sports. Personality and
              Individual Differences, 21(2), 223-229.</li>
            <li class="references">Fyhri, A., Backer-Grøndahl, A.
              (2012). Personality and risk perception in transport.
              Accident Analysis Prevention, 49, 470-475.</li>
            <li class="references">Kaasinen, V., Nurmi, E.,
              Bergman, J., Eskola, O., Solin, O., Sonninen, P., Rinne,
              J. O. (2001). Personality traits and brain dopaminergic
              function in Parkinson's disease. Proceedings of the
              National Academy of Sciences, 98(23), 13272-13277.</li>
            <li class="references">Nicholson, N., Soane, E.,
              Fenton‐O'Creevy, M., Willman, P. (2005). Personality and
              domain‐specific risk taking. Journal of Risk Research,
              8(2), 157-176.</li>
            <li class="references">Nyhus, E. K., Webley, P. (2001).
              The role of personality in household saving and borrowing
              behaviour. European journal of personality, 15(S1),
              S85-S103.</li>
            <li class="references">Outreville, J. F. (2014). Risk
              aversion, risk behavior, and demand for insurance: A
              survey. Journal of Insurance Issues, 158-186.</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
