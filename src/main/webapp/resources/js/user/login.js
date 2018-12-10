/**
 *  로그인 페이지에서 사용하는 JavaScript 파일
 */
// 회원가입과 비밀번호 재설정으로 라우팅 처리해주는 이벤트 등록
$('.login-more .a-nav').click(function(event) {
	Router.routeWithATag(this, event, 'section');
});

// 로그인 관련 처리
$('#login').click(function(){
	login($('input[name="email"]').val().trim(), $('input[name="password"]').val().trim());
});
