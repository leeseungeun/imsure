/**
 * 이메일 인증 후 재로그인하는 함수
 * 
 * @author 이승은
 */
$('#validation-completed').click(function(){
	$.ajax({
		type : "get",
		url : "/uncertified-user/login-after-email-validation",
		success : function(data, status, xhr) {
			Router.route('section', Router.redirectUrl);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		}
	});
});