/**
 * 인구 통계 기반 추천시 필요한 javascript파일
 * 
 * @author 박소연
 */


initPsychologicPage();
var Demographic = {};
Demographic.data={};


// 처음 페이지를 로딩했을 때 실행되는 함수
function initPsychologicPage() {
	// 첫 번째 탭 CSS 적용 및 내용 표시
	stepTabEvent($('.step-tab:first'));
}

// 결혼유무에 따라 보여지는 화면 다르게 뿌려주기
$('input:radio[name="marry"]').click(function() {
	var isMarried = $('input:radio[name="isMarried"]:checked').val();
	var hasChileTag = '<label class="control-label col-sm-2">자녀유무</label>'
				 	+ '<ul class="col-sm-10 recommend-chk two-option-radio">'
				 	+ '	<li class="custom-li-left">'
				 	+ '		<input type="radio" id="child-has" name="hasChild" value="Y">'
				 	+ '		<label for="child-has">유</label>'
				 	+ '	</li>'
				 	+ '	<li class="custom-li-right">'
				 	+ '		<input type="radio" id="child-none" name="hasChild" value="N">'
				 	+ '		<label for="child-none">무</label></li>'
				 	+ '</ul>'
				 	+ '<p class="notice is-pl notice-under-ul" id="childNotice">'
				 	+ '	<small> 자녀가 성인인 경우는 \'무\'를 선택해주세요.<br></small>'
				 	+ '</p>';

	$('#childOrFamily').empty();
	if (isMarried == 'Y') {
		$('#childOrFamily').append(hasChildTag);
	}
});

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

// 버튼 이벤트 처리 함수
function moveStepEvent(buttonType) {
	var activeStep = $('.step-tab.on');
	if (buttonType === 'prev') {
		stepTabEvent(activeStep.prev());
	} else if (buttonType === 'next') {
		stepTabEvent(activeStep.next());
	}
}

function getDemographicResult() {
	
	saveDemographicData();
	
	//페이지 전환
	Router.route('section', 'user/demographicResultPage');
}

function saveDemographicData(){
	var hasChild = $('input:radio[name="hasChild"]:checked').val();
	if($('input:radio[name="isMarried"]:checked').val()=='N'){
		hasChild='N';
	}
	Demographic.data = {
		userId : "1",
		userName : $('#userName').val(),
		gender : $('input:radio[name="gender"]:checked').val(),
		birthNumber : $('#birthNumber').val(),
		isMarried : $('input:radio[name="isMarried"]:checked').val(),
		hasChild: hasChild ,
		income : $('#income').val(),
		job : $('input:radio[name="job"]:checked').val(),
		hasFamilyCancer: $('input:radio[name="hasFamilyCancer"]:checked').val()
	}
	console.log(Demographic.data);
}

function checkDemographicValidation() {
	
}