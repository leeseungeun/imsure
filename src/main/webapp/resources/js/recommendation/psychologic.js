/**
 * 심리 추천 시 필요한 JavaScript 파일
 * 
 * @author 이승은
 */
// 첫 호출인지 확인하는 변수
var isCalled;
var showMessage;
initPsychologicPage()

// 처음 페이지를 로딩했을 때 실행되는 함수
function initPsychologicPage() {
	
	//첫 호출 관련 변수 값을 초기화
	isCalled = false;
	showMessage = false;
	
	// 질문과 응답 관련 엘리먼트를 동적으로 생성
	PsychologicTest.addPossibleAnswers();
	PsychologicTest.addQuestionsAndSteps();
	
	// 사용자 응답 받을 준비
	PsychologicTest.prepareUserAnswer();
	
	// 첫 번째 탭 CSS 적용 및 내용 표시
	stepTabEvent($('.step-tab:first-child'));
	
}
// 사용자 응답 저장 함수
function saveUserAnswers() {
	
	var result = false;
	
	// 현재 활성화된 폼이 어떤 심리측정치와 연관 있는지 변수에 저장
	var activeStepIndex = $('.step-tab.on').index();
	var stepQuestion = PsychologicTest.steps[activeStepIndex]['stepQuestion'];
	
	// 응답을 가져옴
	var selector = 'input[name^="' + stepQuestion.toLowerCase() + '"]:checked';
	var checkedInputs = $(selector);
	// 모든 질문에 응답했을 경우 값을 저장하고 넘어감
	if (checkedInputs.length === PsychologicTest.questions[stepQuestion].length) {
		
		// 배열 초기화 후 다시 값을 넣어줌
		PsychologicTest.selectedAnswers[stepQuestion]['answers'] = [];
		for (var i = 0; i < checkedInputs.length; i++) {
			PsychologicTest.selectedAnswers[stepQuestion]['answers'].push(checkedInputs.eq(i).val());
		}
		
		showMessage = false;
		result = true;
	
	} else {
		showMessage = true;
	}
	
	showPsychologicValidationMessage();
	return result;
}

// 사용자 응답 계산 함수
function calculateUserAnswers() {
	var finalAnswers = PsychologicTest.selectedAnswers;
	for ( var index in finalAnswers) {
		var finalAnswer = finalAnswers[index];
		var answerSum = finalAnswer['answers'].reduce((a, b) => parseInt(a) + parseInt(b), 0);
		PsychologicTest.result[finalAnswer['index']] = answerSum;
		PsychologicTest.resultWithIndex[finalAnswer['index']] = {
			'index' : parseInt(finalAnswer['index']),
			'score' : answerSum
		};
	}
}

// 보험 추천 결과 함수
function getPsychologicResult() {
	
	saveUserAnswers();
	calculateUserAnswers();
	
	//페이지 전환
	Router.route('section', 'user/psychologicResultPage');
}

// step에 따른 버튼 생성 함수
function addStepButtons(index) {
	var buttonFormat = '';
	if (index) {
		buttonFormat += '<button type="button" class="btn btn-prev" onclick="moveStepEvent(\'prev\');">이전 단계</button>';
	}
	if (index === (PsychologicTest.steps.length - 1)) {
		buttonFormat += '<button type="button" class="btn btn-search" onclick="getPsychologicResult();">내게 맞는 보험 찾기</button>';
	} else {
		buttonFormat += '<button type="button" class="btn btn-next" onclick="moveStepEvent(\'next\');">다음 단계</button>';
	}
	$('.btn-block').html(buttonFormat);
}

// 버튼에 대한 이벤트 처리 함수
function moveStepEvent(buttonType) {
	var activeStep = $('.step-tab.on');
	
	if (buttonType === 'prev') {
		
		stepTabEvent(activeStep.prev());
	
	} else if (buttonType === 'next') {
		
		stepTabEvent(activeStep.next());
		
	}
}

// 탭 클릭 이벤트 처리 함수
function stepTabEvent(clickedTab) {
	
	if (isCalled && !saveUserAnswers()) {
		return false;
	}
	
	// 탭 관련 처리
	$('.step-tab').removeClass('on').addClass('shadow');
	$(clickedTab).removeClass('shadow').addClass('on');
	// 탭에 대한 내용 표시
	var index = $(clickedTab).index();
	$('.form-area').removeClass('on');
	$('.form-area').eq(index).addClass('on');
	// 단계 관련 버튼 표시
	addStepButtons(index);
	
	isCalled = true;
}

$('.step-tab').click(function(){
	stepTabEvent(this);
});

// 유효성 검사 메시지 표시 함수
function showPsychologicValidationMessage() {
	// 메시지 초기화
	$('.message-top').css('display','none');
	$('.message-bottom').css('display', 'none');
	
	if (showMessage) {
		$('.message-bottom').css('display', 'block');
		$('.message-top').css('display','block');
	}
}