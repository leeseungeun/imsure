/**
 * 인구 통계 기반 추천 결과를 보여주기 위한 javascript파일
 * 
 * @author 박소연
 */

var userName = Demographic.data.userName;
var isMarried = Demographic.data.isMarried;
var birthNumber = Demographic.data.birthNumber;
var income = Demographic.data.income;
var job = Demographic.data.job;
	
sendChartDataToServer();
analysisResultText();
//sendDataToServer();
//drawChart();


function sendChartDataToServer() {
	
	$.ajax({
		type : "post",
		url : "/user/draw-graph-based-on-demographical-features",
		data : JSON.stringify({
			"birthNumber" : birthNumber,
			"income" : income,
			"job" : job
		}),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			console.log('성공' + data);
			$('#userNameTitle').append(userName);
			for ( var index in data) {
				var dataIndex = data[index];
				var resultData = [dataIndex.accidentInsurance, dataIndex.diseaseInsurance, dataIndex.pensionInsurance,
					dataIndex.savingsInsurance, dataIndex.deadInsurance, dataIndex.variableInsurance, dataIndex.medicalInsurance, dataIndex.nursingInsurance];
				console.log(resultData);
				var type = index;
				
				drawChart(resultData, type);
				// 값 계산하기 추가 되야함
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		}
	});
}

function drawChart(resultData, type){
	//ajax통신으로 데이터 받아오기
	//차트 그리기
	
	var ctx = '';
	if(type == 0 ){
		ctx = $("#incomeChart");
	}else if(type == 1){
		ctx = $("#ageChart");
	}else if(type == 2){
		ctx = $("#jobChart");
	}
	
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
	
	var isMarriedComment='';
	if(isMarried == 'Y'){
		isMarriedComment='행복한 가정을 이루고 사는 ';
	}else{
		isMarriedComment='싱글라이프를 살고 있는 ';
	}
	$("#isMarriedComment").empty();
	$("#userNameResult").empty();
	$("#insuranceTypeFirst").empty();
	$("#insuranceTypeSecond").empty();
	$("#insuranceTypeThird").empty();
	$("#insuranceTypeFourth").empty();
	
	$("#isMarriedComment").append(isMarriedComment);
	$("#userNameResult").append(userName);
	$("#insuranceTypeFirst").append('재해상해보험');
	$("#insuranceTypeSecond").append('질병보장보험');
	$("#insuranceTypeThird").append('연금보험');
	$("#insuranceTypeFourth").append('저축보험');
}

// 버튼 눌렀을 때 화면 동적으로 바꿔주기
$('#recommendButton').on('click', function(event) {

	var String = '<div class="col-sm-4 output step-txt"style="min-height: 589px;">'
			   + '<form role="form" class="ng-pristine ng-valid">'
			   + '<div class="analysResultDiv">'
			   + '<p class="txt-board">'
			   + '<span id="isMarriedComment"></span><br>'
			   + '<span id="userNameResult" class="info-txt typeName ng-binding"></span>'
			   + '님에게  꼭 필요한 보험은<br>' 
			   + '<span id="insuranceTypeFirst" class="info-txt ng-binding"></span>,' 
			   + '<span id="insuranceTypeSecond" class="info-txt ng-binding"></span> 보험이며,<br>'
			   + '고려해볼만한 보험은<br>' 
			   + '<span id="insuranceTypeThird" class="info-txt ng-binding"></span>,'
			   + '<span id="insuranceTypeFourth" class="info-txt ng-binding"></span><br> 보험입니다.'
			   + '</p>'
			   + '</div>'
			   + '</form>'
			   + '</div>'
			   + '<div class="col-sm-8 forms step-area" style="min-height: 589px;">'
			   + '<div class="bgChange">'
			   + '<div class="title-wrapper">'
	           + '<h4 class="recommendation-header">'
	           + '<span class="application-name">I\'M SURE</span>에서 확신하는' 
	           + '<span class="recommendation-highlight">추천</span> 생명보험은?'
	           + '</h4>'
	           + '<button type="button" class="btn" data-toggle="modal"'
	           + 'data-target="#algorithmDescriptionModal">Why SURE ?</button>'
	           + '</div>'
			   + '<ul class="nav nav-tabs">'
			   + '<li class=".step-tab" style="width:20%">암/성인병</li>'
			   + '<li class=".step-tab" style="width:20%">질병</li>'
			   + '<li class=".step-tab" style="width:20%">연금</li>'
			   + '<li class=".step-tab" style="width:20%">저축</li>'
			   + '<li class=".step-tab" style="width:20%">더보기</li>'
			   + '</ul>'
			   + '<div class="form-area step1 on">'
			   + '<div class="recommendation-list"></div>'
			   + '</div>'
			   + '<button class="buttonPrev"><span> 이전</span></button>'
			   + '</div>'
			   + '</div>';
	$('.row').empty();
	$('.row').append(String);
	analysisResultText();
	
});

