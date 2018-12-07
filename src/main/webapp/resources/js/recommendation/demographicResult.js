/**
 * 인구 통계 기반 추천 결과를 보여주기 위한 javascript파일
 * 
 * @author 박소연
 */
sendDataToServer();


function sendDataToServer(){
	
	$.ajax({
		type : "post",
		url : "/user/recommend-based-on-demographical-features",
		data : JSON.stringify(Demographic.data),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			console.log('성공');
			/*for ( var index in data) {
				var insurance = data[index];
				insurance['imageAlt'] = '하나생명';
				insurance['imagePath'] = 'resources/img/recommendation/hana_logo_small.png';
				
				$(".recommendation-list").append(Utils.formatElement(insurance,Insurance.listCardFormat));
			}*/
			//보험 종류 차트 그리기
			//drawChart();
			//보험 분석 결과
			//analysisResultText();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		}
	});
	
}
function drawChart() {
	
	//ajax통신으로 데이터 받아오기
	
	//차트 그리기
	var ctx = document.getElementById("ageChart");
	var data = {
		labels : [ "암,성인병", "질병", "연금" ],
		datasets : [ {
			label : "가입 보험 비율",
			data : [ 300, 50, 100 ],
			backgroundColor : [ "rgb(255, 99, 132)", "rgb(54, 162, 235)",
					"rgb(255, 205, 86)" ],
		} ]
	}

	var myDoughnutChart = new Chart(ctx, {
		type : 'doughnut',
		data : data,
		options : {
			responsive : true,
			legend : {
				position : 'right',

			},
			animation : {
				animateScale : true,
				animateRotate : true
			}
		}
	});

	var ctx2 = document.getElementById("jobChart");
	var data = {
		labels : [ "암,성인병", "질병", "연금" ],
		datasets : [ {
			label : "가입 보험 비율",
			data : [ 20, 50, 30 ],
			backgroundColor : [ "rgb(255, 99, 132)", "rgb(54, 162, 235)",
					"rgb(255, 205, 86)" ]
		} ]
	}

	var myDoughnutChart = new Chart(ctx2, {
		type : 'doughnut',
		data : data,
		options : {
			responsive : true,
			legend : {
				position : 'right',

			},
			animation : {
				animateScale : true,
				animateRotate : true
			}
		}
	});

	var ctx3 = document.getElementById("incomeChart");
	var data = {
		labels : [ "암,성인병", "질병", "연금" ],
		datasets : [ {
			label : "가입 보험 비율",
			data : [ 20, 50, 30 ],
			backgroundColor : [ "rgb(255, 99, 132)", "rgb(54, 162, 235)",
					"rgb(255, 205, 86)" ]
		} ]
	}

	var myDoughnutChart = new Chart(ctx3, {
		type : 'doughnut',
		data : data,
		options : {
			responsive : true,
			legend : {
				position : 'right',
			},
			animation : {
				animateScale : true,
				animateRotate : true
			}
		}
	});
}

function analysisResultText(){
}
	

	/*$('#recommendButton').on('click', function(event) {

	});*/

