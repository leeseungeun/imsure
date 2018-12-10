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
Insurance.getInsuranceDetail = function(event) {

	var insuranceId = $(this).find('input#insuranceId').val();
	$.ajax({
		type : "get",
		url : "/user/insurances/" + insuranceId,
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			var detailList = data.detailList;
			var tag = '<div class="containner" id="modal-top">'
					+ '  <img src="resources/img/recommendation/hana_logo_small.png" width="20%" height="20%">'
					+ '  <span id="modal-top-span">'
					+ data.insuranceName
					+ '	 </span>'
					+ '	 <a href="'
					+ data.url
					+ '" id="download"><span class="icon-cloud-download" id="download">상세자료</span></a>'
					+ '</div>'
					+ '<div class="containner" id="modal-bottom">'
					+ '	 <div class="insurance-group">'
					+ '    <label>보험종류</label><div>'
					+ data.insuranceType
					+ '    </div>'
					+ '  </div>'
					+ '  <div class="insurance-group">'
					+ '    <label>채널종류</label><div>'
					+ data.channel + '</div>'
					+ '</div>';
			for (var i = 0; i < detailList.length; i++) {
				tag += '<div class="insurance-group">'
						+ '  <label>'
						+ detailList[i].title
						+ '</label><div>'
						+ detailList[i].value
						+ '</div>' 
						+ '          </div>';
			}
			tag += '</div>';
			$('#insuranceDetailModal .modal-body').html(tag);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert(jqXHR.responseText);
		}
	});
	
}