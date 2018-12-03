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
