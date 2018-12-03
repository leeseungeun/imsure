/**
 * 보험 상품 목록, 상세보기 처리를 위해 사용하는 JavaScript 파일
 * 
 * @author 이승은
 */
var Insurance = {};
Insurance.listCardFormat = '<div class="insurance-card"  data-toggle="modal" data-target="#insuranceDetailModal">' +
							  '<input type="hidden" id="insuranceId" value="###insuranceId###">' +
					          '<div class="img-wrapper">' +
					            '<img alt="###imageAlt###" src="###imagePath###">' +
					          '</div>' +
					          '<div class="contents-wrapper">' +
					            '<h5 class="insurance-name">###insuranceName###</h5>' +
					            '<p class="insurance-type">###insuranceType###</p>' +
					          '</div>' +
					        '</div>';