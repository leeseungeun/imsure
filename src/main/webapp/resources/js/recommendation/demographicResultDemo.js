/*
 * 인구통계기반 추천 카드를 보여주기 위한 script파일
 * 
 * author 박소연
 */

/*
 * var cardType='';
			if(step == 0){
				//질병보장보험만 뿌려주기
				cardType='질병보장보험';
			}else if(step == 1){
				//재해/상해 보험만 뿌려주기
				cardType='재해상해보험';
			}else if(step == 2){
				//사망보험만 뿌려주기
				cardType='사망보험';
			}else if(step == 3){
				//연금보험만 뿌려주기
				cardType='연금보험';
			}else if(step == 4){
				//저축보험만 뿌려주기
				cardType='저축보험';
			}else if(step == 5){
				//더보기만 뿌려주기
				cardType='간병보험';
			}
			var insurance = {};
			
			for ( var index in data) {
				var insurance = data[index];
				if(insurance.insuranceName==cardType){
					insurance['imageAlt'] = '하나생명';
					insurance['imagePath'] = 'resources/img/recommendation/hana_logo_small.png';
					
					$(".recommendation-list").append(Utils.formatElement(insurance,Insurance.listCardFormat));		
				}else{
					$(".recommendation-list").append("<p>추천상품이 존재하지 않습니다.</p>")
				}
			}
			//보험 종류 차트 그리기
			//drawChart();
			//보험 분석 결과
			//analysisResultText();
 */
sendCardDataToServer();
initDemographicResultPage();
 // 처음 페이지를 로딩했을 때 실행되는 함수
function initDemographicResultPage() {
	// 첫 번째 탭 CSS 적용 및 내용 표시
	stepTabEvent($('.step-tab:first'));
	analysisResultText();
}
 // 탭 클릭 이벤트 처리 함수
function stepTabEvent(clickedTab) {
 	// 탭 관련 처리
	$('.step-tab').removeClass('on').addClass('shadow');
	$(clickedTab).removeClass('shadow').addClass('on');
	// 탭에 대한 내용 표시
	var index = $(clickedTab).index();
	
	$('.form-area').removeClass('on');
	$('.form-area').eq(index).addClass('on');
}
 // 탭클릭 이벤트
$('.step-tab').click(function() {
	// 유효성 검사 추가
	stepTabEvent(this);
});
 
function analysisResultText(){
		
		var isMarriedComment='';
		if(isMarried == 'Y'){
			isMarriedComment='행복한 가정을 이루고 사는 ';
		}else{
			isMarriedComment='싱글라이프를 살고 있는 ';
		}
		$("#isMarriedComment").empty();
		$("#userNameResult").empty();
		$("#insuranceTypeFirst").empty();
		$("#insuranceTypeSecond").empty();
		$("#insuranceTypeThird").empty();
		$("#insuranceTypeFourth").empty();
		
		$("#isMarriedComment").append(isMarriedComment);
		$("#userNameResult").append(userName);
		$("#insuranceTypeFirst").append('재해상해보험');
		$("#insuranceTypeSecond").append('질병보장보험');
		$("#insuranceTypeThird").append('연금보험');
		$("#insuranceTypeFourth").append('저축보험');
}

$('.recommendation-list').on('click', '.insurance-card', Insurance.getInsuranceDetail);

$('.buttonPrev').click(function() {
	Router.route('section', 'user/demographicResultPage');
})

