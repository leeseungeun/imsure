/**
 * 회원가입 시 필요한 처리를 담당하는 JavaScript 파일
 * 
 * @author 이승은
 */
// 로그인 a 태그 클릭 시 route 처리
$('#a-nav-login').click(function(event){
	Router.routeWithATag(this, event, 'section');
});

// 모바일 환경에서 눈 모양 버튼 클릭 시 비밀번호 확인
$('.mobile-password-show-button').click(function(){
	
	// 버튼이 보이도록 설정되었을 때에만 작동
	var displayValue = $(this).css('display');
	if (displayValue !== 'none') {
		
		var passwordInputType = $('input[name="password"]').attr('type');
		var targetType = passwordInputType === 'password'? 'text' : 'password';
		$('input[name="password"]').attr('type', targetType);
	}
});

$('#register').click(function(){
	register();
})

// 회원가입 함수
function register() {
	$.ajax({
		type : "post",
		url : "/all/register",
		data : JSON.stringify({
			"email" : $('input[name="email"]').val().trim(),
			"password" : $('input[name="password"]').val().trim()
		}),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			Router.route('section', Router.redirectUrl);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
			if (jqXHR.status === 412) {
				showRegisterResultMessage();
			}
		}
	});
}
//회원가입 결과 메시지 표시 함수
function showRegisterResultMessage() {
	// 메시지 초기화
	$('.result-message').css('display','block');
}