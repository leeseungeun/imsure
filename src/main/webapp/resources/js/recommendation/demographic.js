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
$('input:radio[name="isMarried"]').click(function() {
	var isMarried = $('input:radio[name="isMarried"]:checked').val();
	var hasChildTag = '<label class="control-label col-sm-2">자녀유무</label>'
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
				 	+ '	<small id="valiUserChild"> 자녀가 성인인 경우는 \'무\'를 선택해주세요.<br></small>'
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
	if(checkDemographicValidation(this) == true){
		stepTabEvent(this);	
	}
});

// 버튼 이벤트 처리 함수
function moveStepEvent(buttonType) {
	var activeStep = $('.step-tab.on');
	if (buttonType === 'prev') {
		if(checkDemographicValidation('prev') == true){
			stepTabEvent(activeStep.prev());
		}
	} else if (buttonType === 'next') {
		if(checkDemographicValidation('next') == true){
			stepTabEvent(activeStep.next());
		}
	}
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
}


//분석 결과로 넘어가는 부분
function getDemographicResult() {
	if(checkDemographicValidation('prev') == true){
		saveDemographicData();
		Router.route('section', 'user/demographicResultPage');
	}
}

// 이름 작성시 이벤트 처리
$('#userName').on('keyup blur ', function(e) {
	$('#valiUsername').empty();
	$("#spanUserName").html($('#userName').val());

});
// 성별선택시 이벤트 처리
$('input:radio[name="gender"]').click(function(e) {
	var gender = '';
	if($('input:radio[name="gender"]:checked').val()=='M'){
		gender ='남성';
	}else{
		gender ='여성';
	}
	$('#spanUserGender').empty();
	$("#spanUserGender").html(gender);
});
// 생일 입력시 이벤트 처리
$('#birthNumber').on('change blur',function(e) {
	$('#spanUserAge').html(calcAge($('#birthNumber').val()));
});
// 직업선택시 이벤트처리
$('input:radio[name="job"]').click(function(e) {
	$("#spanUserJob").html($('input:radio[name="job"]:checked').val());
});
//결혼여부 선택시 이벤트처리
$('input:radio[name="isMarried"]').click(function(e) {
	var married = '';
	if($('input:radio[name="isMarried"]:checked').val()=='Y'){
		married ='기혼';
	}else{
		married ='미혼';
	}
	$("#spanUserMarried").html(married);
}); 

function checkDemographicValidation(clickedTab) {

	$('#valiUsername').empty();
	$('#valiUserGender').empty();
	$('#valiUserBirth').empty();
	$('#valiUserMarried').empty();
	$('#valiUserChild').empty();
	var reg = /^[0-9]*$/;
	if(clickedTab == 'next' || clickedTab.innerHTML === '2 STEP'){
		// 이름은 빈공백만 체크
		if($('#userName').val().trim() == '' || $('#userName').val() == null ){
			$('#valiUsername').append('※이름을 입력해주세요');
			$('#valiUsername').focus();
			return false;
		}
		// 성별 선택 했는지
		if($('input:radio[name="gender"]:checked').length == 0){
			$('#valiUserGender').append('※성별을 체크해주세요');
			return false;
		}
		// 생일(숫자만 추가)
		if(isValidDate($('#birthNumber').val()) != true || $('#birthNumber').val().trim() ==''){
			$('#valiUserBirth').css('color','#ff0056');
			$('#valiUserBirth').append('※20세 이상만 가능하며, 올바른 생년월일을 입력하세요');
			return false;
		}
		// 결혼여부체크했는지
		if($('input:radio[name="isMarried"]:checked').length == 0){
			
			$('#valiUserMarried').append('※결혼여부를 체크해주세요');
			return false;
		}
	
	
		if($('input:radio[name="isMarried"]:checked').val() == 'Y'){
			if($('input:radio[name="hasChild"]:checked').length ==0){
				$('#valiUserChild').css('color','#ff0056');
				$('#valiUserChild').append('※자녀유무를 체크해주세요');
				return false;
			}
		}
		
		return true;
	}
	if(clickedTab == 'prev' || clickedTab.innerHTML == "1 STEP"){
		
		$('#valiUserFamily').empty();
		$('#valiUserIncome').empty();
		$('#valiUserJob').empty();
		// 암가족력 여부 체크했는지
		if($('input:radio[name="hasFamilyCancer"]:checked').length == 0){
			$('#valiUserFamily').append('※암가족력 여부를 체크해주세요');
			return false;
		}
		if(reg.test($('#income').val())==false || $('#income').val().trim() == ''){
			
			$('#valiUserIncome').css('color','#ff0056');
			$('#valiUserIncome').append('※만원 단위로 숫자만 입력해주세요');
			return false;
		}
		if($('input:radio[name="job"]:checked').length == 0){
			$('#valiUserJob').append('※직업을 체크해주세요');
			return false;
		}
		
		return true;
	}
	
	
	// 소득(숫자만 추가)
	
}

// 생년월일을 나이로 바꿔주는 메소드
function calcAge(birthday) {
	
	var bday=parseInt(birthday.substring(6,8)); 
	var bmo=(parseInt(birthday.substring(4,6))-1); 
	var byr=parseInt(birthday.substring(0,4));
	var byr; 
	var age; 
	var now = new Date(); 
	tday=now.getDate(); 
	tmo=(now.getMonth()); 
	tyr=(now.getFullYear()); 

	if((tmo > bmo)||(tmo==bmo & tday>=bday)) { 
		age=byr 
	}else{ 
		age=byr+1; 
	} 
	return tyr-age; 
}

//생년월일 유효성 체크
function isValidDate(dateStr) {
     var year = Number(dateStr.substr(0,4)); 
     var month = Number(dateStr.substr(4,2));
     var day = Number(dateStr.substr(6,2));
     var today = new Date(); // 날자 변수 선언
     var yearNow = today.getFullYear();
     var adultYear = yearNow-20;
 
     
     if (year < 1900 || year > adultYear){
         
          return false;
     }
     if (month < 1 || month > 12) { 

          return false;
     }
    if (day < 1 || day > 31) {
         
          return false;
     }
     if ((month==4 || month==6 || month==9 || month==11) && day==31) {
          
          return false;
     }
     if (month == 2) {
          var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
          if (day>29 || (day==29 && !isleap)) {
        	  return false;
          }
     }
     return true;
}


