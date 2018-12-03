/**
 * 페이지 간 이동을 담당하는 자바스크립트 파일
 *
 * @author 이승은
 */
var Router = {
		route : function(target, includePage) {
			$.get({
				url: includePage,
				success : function(data) {
					$(target).html(data);
				}
			});
		} 
}

Router.routeWithATag = function routeWithATag(clickedATag, event, target){
	
	event.preventDefault();
	
	var page = $(clickedATag).attr('href');
	
	currentPage = page;
	
	Router.route(target, currentPage);
}