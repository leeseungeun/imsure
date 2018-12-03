/**
 * 어플리케이션 전반에 걸쳐 자주 사용되는 유용한 함수들 모음
 * 
 * @author 이승은
 */
var Utils = {
	// 포맷에 맞게 데이터를 넣어 엘리먼트 문자열을 반환하는 함수
	'formatElement' : function(data, format) {
		for ( var key in data) {
			
			// 값을 변화시켜주기 위한 정규표현식
			var regExp = new RegExp('###' + key + '###', 'gm');
			format = format.replace(regExp, data[key]);
		
		}
		
		return format;
	}
}