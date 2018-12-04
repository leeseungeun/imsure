/**
 * 심리 추천 결과 보여줄때 필요한 JavaScript 파일
 * 
 * @author 박소연
 */
	var ctx = document.getElementById("myChart");
	var data = {
		labels : [ '외향성', '친화성', '성실성', '신경성', '개방성' ],
		datasets : [ {
			label : '성격지표',
			data : PsychologicTest.result,
			fill : true,
			backgroundColor : 'rgba(255, 0, 87, 0.2)',
			borderColor : '#ff0057',
			pointBackgroundColor : '#ff0057',
			pointBorderColor : '#fff',
			pointHoverBackgroundColor : '#fff',
			pointHoverBorderColor : '#ff0057',
		}]
	}
	var options = {
		scale : {
			angleLines : {
				display : false
			},
			ticks : {
				beginAtZero : true,
				min : -10,
				max : 10,
				stepSize : 5
			},
			pointLabels : {
				fontSize : 13,
				fontColor : "black",
				padding : '5px'

			}
		},
		legend : {
			padding : "100"
		}
	}

	var myRadarChart = new Chart(ctx, {
		type : 'radar',
		data : data,
		options : options
	});

	// 추천 보험 리스트를 불러오기 위한 ajax
	$.ajax({
		type : "post",
		url : "/user/recommend-based-on-psychological-features",
		data : JSON.stringify({
			"userId" : "1",
			"personality" : PsychologicTest.result
		}),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			for ( var index in data) {
				var insurance = data[index];
				insurance['imageAlt'] = '하나생명';
				insurance['imagePath'] = 'resources/img/recommendation/hana_logo_small.png';
				
				$(".recommendation-list").append(Utils.formatElement(insurance,Insurance.listCardFormat));
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		}
	});
	
	// 보험 상세보기를 위한 ajax
	$('.recommendation-list').on('click','.insurance-card',function(event) {

		var insuranceId = $(this).find('input#insuranceId').val();
		$.ajax({
			type : "get",
			url : "/user/insurances/"+ insuranceId,
			contentType : "application/json; charset=UTF-8",
			success : function(data, status, xhr) {
			
				var detailList = data.detailList;
				var tag = '<div class="modal fade" id="insuranceDetailModal" role="dialog">'
						+ '  <div class="modal-dialog">'
						+ '    <div class="modal-content">'
						+ '      <div class="modal-header">'
						+ '        <span class="modal-title">보험상품 상세보기</span>'
						+ '		   <button type="button" class="close" data-dismiss="modal" style="width:10%">&times;</button>' 
						+ '      </div>'
						+ '      <div class="modal-body">'
						+ '        <div class="containner" id="modal-top">'
						+ '          <img src="resources/img/recommendation/hana_logo_small.png" width="20%" height="20%">'
						+ '          <span id="modal-top-span">'+data.insuranceName+'</span>'
						+ '		     <a href="'+data.url+'" id="download"><span class="icon-cloud-download" id="download">상세자료</span></a>'
						+ '	       </div>'
						+ '        <div class="containner" id="modal-bottom">';
						+ '			 <div class="insurance-group">'
						+ '            <label>보험종류</label><div>'+data.insuranceType+'</div>'
						+ '          </div>'
						+ '			 <div class="insurance-group">'
						+ '            <label>채널종류</label><div>'+data.channel+'</div>'
						+ '          </div>'
						for (var i = 0; i < detailList.length; i++) {
			            	tag += '          <div class="insurance-group">'
								 + '            <label>'+detailList[i].title+'</label><div>'+detailList[i].value+'</div>'
								 + '          </div>';
			            }	
					tag += '        </div>'
						+ '      </div>'
						+ '      <div class="modal-footer">'
						+ '        <button type="button" class="btn" data-dismiss="modal" style="width:15%">닫기 </button>'
						+ '      </div>' 
						+ '    </div>' 
						+ '  </div>' 
						+ '</div>';
						
				$('section').append(tag);				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.responseText);
			}
		});
	});