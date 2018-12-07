/**
 * 동적으로 심리 검사 관련 화면을 그려주기 위한 JavScript 파일
 * 
 * @author 이승은
 */
// 객체 선언
var PsychologicTest = {};
// 최종 계산 결과를 저장하는 변수
PsychologicTest.result = [];
// 성격 관련 메시지 표시를 위해 인덱스와 결과값을 저장하는 변수
PsychologicTest.resultWithIndex = [];
// 각 STEP 형식
PsychologicTest.stepFormat = '<div class="form-area">###questions###</div>';
// STEP
PsychologicTest.steps = [
	{
		'stepName' : '1 STEP',
		'stepQuestion' : 'EXTRAVERSION'
	},
	{
		'stepName' : '2 STEP',
		'stepQuestion' : 'AGREEABLENESS'
	},
	{
		'stepName' : '3 STEP',
		'stepQuestion' : 'CONSCIENTIOUSNESS'
	},
	{
		'stepName' : '4 STEP',
		'stepQuestion' : 'NEUROTICISM'
	},
	{
		'stepName' : '5 STEP',
		'stepQuestion' : 'OPENNESS'
	},
];
//사용자 응답 저장 준비
PsychologicTest.prepareUserAnswer = function prepareUserAnswer() {
	
	PsychologicTest.selectedAnswers = {};
	var steps = PsychologicTest.steps;
	
	for ( var index in steps) {
		var step = steps[index];
		PsychologicTest.selectedAnswers[step['stepQuestion']] = {
			'index': index,
			'answers':[]
		}
	}
}
// 질문 형식
PsychologicTest.questionFormat = 
	'<label class="statement"><span class="question-number">###questionNumber###</span> ###questionText### </label>' +
    '<ul class="likert">' +
    	'###possibleAnswers###' +
    '</ul>';
// 질문
PsychologicTest.questions = {};
PsychologicTest.questions['EXTRAVERSION'] = [
	'나는 항상 타인에게 다정하게 대한다.',
	'나는 다른 사람들과 잘 어울린다',
	'나는 항상 좋은 쪽으로 생각하기 위해 노력한다',
	'나는 모든 일에 긍정적으로 생각하고자 최선을 다한다',
	'나는 타인을 잘 이끄는 편이다'
];
PsychologicTest.questions['AGREEABLENESS'] = [
	'나는 타인을 쉽게 믿는 편이다',
	'나는 매사에 정직하다',
	'나는 타인을 자신보다 우선시한다',
	'나는 모든 현상 (사물)을 잘 받아들인다',
	'나는 타인을 존경하며, 전혀 거들먹거리지 않는다'
];
PsychologicTest.questions['CONSCIENTIOUSNESS'] = [
	'나는 자신이 능력 있는 사람이라고 생각한다',
	'나는 사람들을 조직하고 관리하는 일에 능하다',
	'나는 자신이 설정한 목표를 이루기 위해 노력한다',
	'나는 자신을 제어하려 노력한다',
	'나는 내 의무를 올바르게 수행한다'
];
PsychologicTest.questions['NEUROTICISM'] = [
	'나는 항상 무엇인가에 쫓기는 기분이다',
	'나는 사소한 것에도 쉽게 흥분한다',
	'나는 항상 슬프고 무기력하다',
	'나는 심각한 열등감과 강박적인 생각을 갖고 있다',
	'나는 작은 것에도 예민해진다'
];
PsychologicTest.questions['OPENNESS'] = [
	'나는 항상 새로운 것에 대해 생각한다',
	'나는 문화생활과 여가를 즐긴다',
	'나는 자연에 감화 받는 편이다',
	'나는 새로운 경험을 즐긴다',
	'나는 타인의 의견을 나의 의견만큼 중요시한다'
];
// 응답 형식
PsychologicTest.answerFormat =
	'<li>' +
		'<label>' +
			'<input type="radio" name="###questionName###" value="###answerValue###">' +
			'<span></span>###answerText###' +
		'</label>' +
	'</li>';
// 가능한 응답 목록 (모든 질문에 대한 가능 응답 동일, 질문마다 응답 달라질 경우 질문 안에 이를 선언해줘야 함)
PsychologicTest.possibleAnswers = [
	{
		'answerValue' : '2',
		'answerText' : '매우 그렇다'
	},
	{
		'answerValue' : '1',
		'answerText' : '그렇다'
	},
	{
		'answerValue' : '0',
		'answerText' : '보통'
	},
	{
		'answerValue' : '-1',
		'answerText' : '그렇지 않다'
	},
	{
		'answerValue' : '-2',
		'answerText' : '전혀 그렇지 않다'
	},
];
// 기본 질문 형식에 가능한 응답을 붙여주는 함수
PsychologicTest.addPossibleAnswers = function addPossibleAnswers() {
	
	var possibleAnswers = PsychologicTest.possibleAnswers;
	var answers = '';
	
	for (var index in possibleAnswers) {
		
		var answerFormat = PsychologicTest.answerFormat;
		var answer = possibleAnswers[index];
		var formattedAnswer = Utils.formatElement(answer, answerFormat);

		answers += formattedAnswer;
		
	}
	
	var regExp = new RegExp('###possibleAnswers###', 'gm');
	PsychologicTest.questionFormat = PsychologicTest.questionFormat.replace(regExp, answers);
};
PsychologicTest.addQuestionsAndSteps = function addQuestionsAndSteps() {
	
	// tab menu
	var stepTabs = '';
	var stepContents = '';
	
	var steps = PsychologicTest.steps;  
	for ( var stepIndex in steps) {
		
		var step = steps[stepIndex];
		stepTabs += ('<li class="step-tab">' + step['stepName'] + '</li>');
		
		var questionType = step['stepQuestion'];
		var questions = PsychologicTest.questions[questionType];
		var questionElements = '';
		for ( var questionIndex in questions) {
			var questionFormat = PsychologicTest.questionFormat;
			var questionNumber = parseInt(questionIndex) + 1;
			var questionJson = {
				'questionNumber' : '0' + questionNumber,
				'questionText' : questions[questionIndex],
				'questionName' : questionType.toLowerCase() + questionNumber,
			};
			
			var formattedQuestion = Utils.formatElement(questionJson, questionFormat);
			
			questionElements += formattedQuestion;
		}
		
		var stepElement = Utils.formatElement({'questions' : questionElements}, PsychologicTest.stepFormat);
		$(stepElement).insertBefore('.btn-block');
	}
	
	$('.nav-tabs').html(stepTabs);
}