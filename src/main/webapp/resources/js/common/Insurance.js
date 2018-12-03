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

var detailModal = {};
Insurance.detailModalFormat ='<div class="modal fade" id="insuranceDetailModal" role="dialog">'+
							'<div class="modal-dialog">'+
	  							'<div class="modal-content">'+
	  								'<div class="modal-header">'+
	  									'<span class="modal-title">보험상품 상세보기</span>'+
	  								'</div>'+
	  								'<div class="modal-body">'+
	  									'<div class="containner" id="modal-top">'+
	  										'<img src="resources/img/recommendation/hana_logo_small.png" width="20%" height="20%">'+ 
	  										'<span>###insuranceName###</span>'+
	  										'<a href="###url###"><span class="icon-cloud-download">상세자료</span></a>'+
	  									'</div>'+
	  									'<div class="containner" id="modal-bottom">'+
	  									 //여기 동적으로 들어가야함
	  										'<div class="insurance-group">'+
	  											'<label>###insuranceDatailTitle###</label><div>###insuranceDetailValue###</div>'+
	  										'</div>'+
										'</div>'+
	  								'</div>'+
	  								'<div class="modal-footer">'+
	  									'<button type="button" class="btn" data-dismiss="modal">닫기 </button>'+
	  								'</div>'+
	  							'</div>'+
	  						'</div>'+
	  					'</div>';
var modalInsuranceList ={};
Insurance.modalInsuranceList = '<div class="insurance-group">'+
									'<label>###insuranceDatailTitle###</label><div>###insuranceDetailValue</div>'+
							   '</div>';