/**
 * 페이지 간 이동을 담당하는 자바스크립트 파일
 *
 * @author 이승은
 */
var Router = {};
Router.redirectUrl;
Router.route = function route(target, includePage) {
	$.get({
		url: includePage,
		success : function(data) {
			$(target).html(data);
		}
	})
	.fail(function(response){
		Router.redirectUrl = includePage;
		if (response.status === 401){
			Router.route(target, 'all/registerPage');
		} else if (response.status === 403) {
			Router.route(target, 'all/needEmailValidationPage');
		}
	});
} 

Router.routeWithATag = function routeWithATag(clickedATag, event, target){
	
	event.preventDefault();
	
	var page = $(clickedATag).attr('href');
	
	currentPage = page;
	
	Router.route(target, currentPage);
}