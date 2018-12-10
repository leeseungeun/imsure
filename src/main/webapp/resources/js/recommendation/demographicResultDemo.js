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
}
 // 탭 클릭 이벤트 처리 함수
function stepTabEvent(clickedTab) {
 	// 탭 관련 처리
	$('.step-tab').removeClass('on').addClass('shadow');
	$(clickedTab).removeClass('shadow').addClass('on');
	// 탭에 대한 내용 표시
	var index = $(clickedTab).index();
	console.log(index);
	
	$('.form-area').removeClass('on');
	$('.form-area').eq(index).addClass('on');
}
 // 탭클릭 이벤트
$('.step-tab').click(function() {
	// 유효성 검사 추가
	stepTabEvent(this);
});
 function sendCardDataToServer(){
	console.log(Demographic.data)
	
	$.ajax({
		type : "post",
		url : "/user/recommend-based-on-demographical-features",
		data : JSON.stringify(Demographic.data),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			console.log('성공');
			console.log(data);
			
			var Tag = '<div class="form-area step1">'
				    + '	<div class="recommendation-list" id="step1"></div>'
				    + '</div>'
				    + '<div class="form-area step2">'
				    + '	<div class="recommendation-list" id="step2"></div>'
				    + '</div>'
				    + '	<div class="form-area step3">'
				    + '<div class="recommendation-list" id="step3"></div>'
				    + '	</div>' 
				    + '<div class="form-area step4">'
				    + '	<div class="recommendation-list" id="step4"></div>'
				    + '</div>'
				    + '<div class="form-area step5">'
				    + '	<div class="recommendation-list" id="step5"></div>'
				    + '</div>'
				    + '<div class="form-area step6">'
				    + '	<div class="recommendation-list" id="step6"></div>'
				    + '</div>';
			
			$("#cardSection").append(Tag);
			
			stepTabEvent($('.step-tab:first'));
			for ( var index in data) {
				var insurance = data[index];
				insurance['imageAlt'] = '하나생명';
				insurance['imagePath'] = 'resources/img/recommendation/hana_logo_small.png';
				if(insurance.insuranceName=="질병보장보험"){
					$("#step1").append(Utils.formatElement(insurance,Insurance.listCardFormat));		
				}else if(insurance.insuranceName=="재해상해보험"){
					$("#step2").append(Utils.formatElement(insurance,Insurance.listCardFormat))
				}else if(insurance.insuranceName=="사망보험"){
					$("#step3").append(Utils.formatElement(insurance,Insurance.listCardFormat))
				}else if(insurance.insuranceName=="연금보험"){
					$("#step4").append(Utils.formatElement(insurance,Insurance.listCardFormat))
				}else if(insurance.insuranceName=="저축보험"){
					$("#step5").append(Utils.formatElement(insurance,Insurance.listCardFormat))
				}else if(insurance.insuranceName=="간병보험"){
					$("#step6").append(Utils.formatElement(insurance,Insurance.listCardFormat))
				}else if(insurance.insuranceName=="어린이보험"){
					$("#step6").append(Utils.formatElement(insurance,Insurance.listCardFormat))
				}
			}// 추천보험 없을 때 처리해주기
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
			console.log('실패');
		}
	});
}
 $('.recommendation-list').on('click', '.recommendation-list', function(event) {
 	/*
	 var insuranceId = $(this).find('input#insuranceId').val();
	console.log(insuranceId)
	$.ajax({
		type : "get",
		url : "/user/insurances/" + insuranceId,
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			var detailList = data.detailList;
			var tag = '<div class="containner" id="modal-top">'
					+ '  <img src="resources/img/recommendation/hana_logo_small.png" width="20%" height="20%">'
					+ '  <span id="modal-top-span">'
					+ data.insuranceName
					+ '	 </span>'
					+ '	 <a href="'
					+ data.url
					+ '" id="download"><span class="icon-cloud-download" id="download">상세자료</span></a>'
					+ '</div>'
					+ '<div class="containner" id="modal-bottom">'
					+ '	 <div class="insurance-group">'
					+ '    <label>보험종류</label><div>'
					+ data.insuranceType
					+ '    </div>'
					+ '  </div>'
					+ '  <div class="insurance-group">'
					+ '    <label>채널종류</label><div>'
					+ data.channel + '</div>'
					+ '</div>';
			for (var i = 0; i < detailList.length; i++) {
				tag += '<div class="insurance-group">'
						+ '  <label>'
						+ detailList[i].title
						+ '</label><div>'
						+ detailList[i].value
						+ '</div>' 
						+ '          </div>';
			}
			tag += '</div>';
			$('#insuranceDetailModal .modal-body').html(tag);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert(jqXHR.responseText);
		}
	});*/
});