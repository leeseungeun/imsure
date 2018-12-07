/**
 * 인구 통계 기반 추천 결과를 보여주기 위한 javascript파일
 * 
 * @author 박소연
 */
sendDataToServer();
drawChart();

function sendDataToServer(){
	/*
	$.ajax({
		type : "post",
		url : "/user/recommend-based-on-demographical-features",
		data : JSON.stringify(Demographic.data),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			console.log('성공');
			for ( var index in data) {
				var insurance = data[index];
				insurance['imageAlt'] = '하나생명';
				insurance['imagePath'] = 'resources/img/recommendation/hana_logo_small.png';
				
				$(".recommendation-list").append(Utils.formatElement(insurance,Insurance.listCardFormat));
			}
			//보험 종류 차트 그리기
			//drawChart();
			//보험 분석 결과
			//analysisResultText();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		}
	});*/
	
}
function drawChart() {
	
	//ajax통신으로 데이터 받아오기
	var ageData = [ 18, 61.2, 0, 0, 0, 0, 20.9, 0 ];
	var jobData = [ 18, 61.2, 0, 0, 0, 0, 20.9, 0 ];
	var incomeData = [ 18, 61.2, 0, 0, 0, 0, 20.9, 0 ];
	//차트 그리기
	var ctx = document.getElementById("ageChart");
	var ctx2 = document.getElementById("jobChart");
	var ctx3 = document.getElementById("incomeChart");
	
	
	// 공통부분 함수로 뿌리기
	var data = {
		labels : [ "재해상해", "질병보장", "연금", "저축", "사망", "변액", "실손의료", "간병" ],
		datasets : [ {
			label : "가입 보험 비율",
			data : resultData,
			backgroundColor : [ "rgb(255, 99, 132)", "rgb(54, 162, 235)",
					"rgb(255, 205, 86)", "rgb(255, 159, 64)", "rgb(75, 192, 192)", 
					"rgb(173, 172, 161)", "rgb(173, 172, 161)", "rgb(141 , 51, 232)"],
		} ]
	}
	var options = {
		responsive : true,
		legend : {
			position : 'right',
		},
		animation : {
			animateScale : true,
			animateRotate : true
		}	
	}

	var myDoughnutChart = new Chart(ctx, {
		type : 'doughnut',
		data : data,
		options : options
	});

}

function analysisResultText(){
}
	

	/*$('#recommendButton').on('click', function(event) {

	});*/

