/**
 * 심리 추천 결과 보여줄때 필요한 JavaScript 파일
 * 
 * @author 박소연
 */
// 방사선 차트
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
	} ]
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

			$(".recommendation-list").append(
					Utils.formatElement(insurance,
							Insurance.listCardFormat));
		}
	},
	error : function(jqXHR, textStatus, errorThrown) {
		console.log(jqXHR);
	}
});
// 보험 상세보기를 위한 ajax
$('.recommendation-list').on('click', '.insurance-card', function(event) {

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
});

// 성격 측정 결과 메시지
var personalityMessage = [
	{
		'plus':'사교적이고 활력적인',
		'minus':'조용하고 차분한'
	},
	{
		'plus':'배려심 깊고 이타적인',
		'minus':'자신을 사랑하는'
	},
	{
		'plus':'목표를 위해 노력하는',
		'minus':'여유로운 삶을 즐기는'
	},
	{
		'plus':'걱정이 많은',
		'minus':'심리적으로 안정된'
	},
	{
		'plus':'호기심이 많고 모험심 넘치는',
		'minus':'익숙한 것을 좋아하는'
	}
];
var personalityResult = PsychologicTest.resultWithIndex;
var sortedPersonalityResult = personalityResult.sort((secondPersonality, firstPersonality) => {
	
	var secondPersonalityScore = Math.abs(secondPersonality['score']);
	var firstPersonalityScore = Math.abs(firstPersonality['score']);
	var personalityScoreCompareResult; 
	
	if(secondPersonalityScore < firstPersonalityScore){
		personalityScoreCompareResult = 1;
	} else if (secondPersonalityScore > firstPersonalityScore){
		personalityScoreCompareResult = -1;
	} else {
		personalityScoreCompareResult = 0;
	} 
	
	return personalityScoreCompareResult;
});
var mostSalientPersonality = sortedPersonalityResult[0];
var mostSalientPersonalitySign = mostSalientPersonality['score'] > 0? 'plus':'minus';
$('#personality1').html(personalityMessage[mostSalientPersonality['index']][mostSalientPersonalitySign]);
var secondMostSalientPersonality = sortedPersonalityResult[1];
var secondMostSalientPersonalitySign = secondMostSalientPersonality['score'] > 0? 'plus':'minus';
$('#personality2').html(personalityMessage[secondMostSalientPersonality['index']][secondMostSalientPersonalitySign]);
