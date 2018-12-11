<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/management/management.css">
<!-- header -->
<jsp:include page="../../includes/header.jsp" />
<div class="container ng-scope">
  <!-- 처음 화면 -->
  <div class="findContainer" id="first-find-list">
    <div class="callaction bg-gray">
      <div class="row">
        <span style="display:none;">
          <sec:authentication property="principal.user.userId" var="userId"/>
        </span>
        <div class="col-md-8">
          <div class="find-text">
            <h3>내가 가입한 보험이 궁금하지 않으세요?</h3>
            <p>가입한 생명보험을 확인하고, 필요한 보험을 추천드립니다!</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="cta-btn">
            <button class="btn btn-skin btn-lg" data-toggle="modal"
              data-target="#getMyInsuranceInformation">내 보험 정보 가져오기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 처음화면 끝 -->

  <!-- 보험찾기 눌러서 보험 찾고 난 뒤 뿌려줄 영역 -->
  <div class="row" id="after-find-insurance" style="display:none">
    <div class="col-sm-4">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="row">
            <div class="find-text">
              <h3> 내가 가입한 보험이<br>궁금하지 않으세요?
              </h3>
              <p>
                가입한 생명보험을 확인하고,<br>필요한 보험을 추천드립니다!
              </p>
            </div>
          </div>
          <button class="btn btn-skin btn-lg" data-toggle="modal"
              data-target="#getMyInsuranceInformation">내 보험 정보 가져오기</button>
        </div>
      </div>
    </div>
    <!-- 보험리스트 -->
    <div class="col-sm-8" id="insurance-large-list">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="find-text">
            <div class="insurance-list">
              <h5>내 보험 목록</h5>
			  <table class="table-large-list">
  				<thead class="thead-color">
    			  <tr>
      				<th scope="col" id="seq">#</th>
      				<th scope="col" id="insuranceName">상품명</th>
      				<th scope="col" id="insuranceType">상품종류</th>
    			  </tr>
  				</thead>
  				<tbody>
                  <!-- 내 보험 리스트 동적추가 -->
  			 	</tbody>
			  </table>
			</div>
          </div>
        </div>
      </div>
    </div>
    <!-- 보험리스트 끝-->
  <!-- 보험리스트 클릭할 경우 보험 리스트 영역과 상세영역 -->
  <div id="detail-insurance" class="col-sm-8" style="display:none">
    <div class="col-sm-4">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="find-text">
            <div class="insurance-list">
			  <table class="table table-small-list">
  				<thead class="thead-color">
    			  <tr>
      				<th scope="col" id="seq">#</th>
      				<th scope="col" id="insuranceName">상품명</th>
      				<th scope="col" id="insurancType">상품종류</th>
    			  </tr>
  				</thead>
  				<tbody>
    			  <!-- 작은 보험 목록 -->
  			 	</tbody>
			  </table>
			</div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="find-text" id="enrolled-insurance-detail-wrapper">
            <!-- 가입 보험 상세 동적으로 출력해주는 부분 -->
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 보험리스트 클릭할 경우 보험 리스트 영역과 상세영역 -->
  </div>
  <!-- 보험찾기 눌러서 보험 찾고 난 뒤 뿌려줄 영역 끝 -->



  <div class="findContainer" id="input-analys-info" style="display:none">
    <div class="callaction bg-gray">
      <div class="form-example-wrap mg-t-30">
        <div class="cmp-tb-hd cmp-int-hd">
          <h5>보험 분석을 위해 기본 정보를 입력해주세요</h5><br>
        </div>
        <div class="row">
          <div class="col-sm-5">
            <div class="form-example-int form-example-st">
              <div class="form-group">
                
                  <label class="find-info-label">성별</label> 
                  <ul class="phoneCarrier col-sm-10">
                    <li class="custom-li-left">
                      <input type="radio" id="M" name="gender" value="M"> 
                      <label for="M">남자</label>
               	    </li>
                    <li class="custom-li-left">
                      <input type="radio" id="W" name="gender" value="W"> 
                      <label for="W">여자</label>
                    </li>
                  </ul>
             
              </div>
            </div>

          </div>
          <div class="col-sm-5">
            <div class="form-example-int form-example-st">
              <div class="form-group">
                
                  <label class="find-info-label">생년월일</label>
                  <input
                    type="text" class="input100" placeholder="ex) 19930131">
              
              </div>
            </div>
          </div>
          <div class="col-sm-2">
            <div class="form-example-int">
              <button class="btn">분석하기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 보험분석하기 영역 -->
  <div class="wrapper row"  >
    <div class="col-sm-6" id="after-analys-graph" style="display:none">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="find-text">
            <div class="graph-area">
              <h5>내 현재 보험은?</h5>
              <br>
              <canvas id="analysChart" width="300"></canvas>
            </div>
            <div class="analysText">
             <span class="info-txt ng-binding">질병보장보험</span> 의 경우<br>
             <span class="info-txt ng-binding">평균보장금액</span>보다 
             <span class="info-txt ng-binding">부족</span> 하시네요!<br>
             <span class="info-txt ng-binding">하나생명</span> 보험을 추천합니다.
            </div>
          </div>
        </div>

      </div>
    </div>
    <div class="col-sm-6" id="my-recommend-insurance">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="bgChange recommendation-wrapper">
            <ul class="nav nav-tabs tabType2">
              <!-- 선택했을때 이벤트 처리! -->
              <li class="step-tab on" style="width: 50%;" onclick="getPsychologicalRecommendationList();">심리</li>
              <li class="step-tab shadow" style="width: 50%;" onclick="getDemographicRecommendationList()">인구</li>
            </ul>
            <br>
            <div class="form-area step1">
              <!-- 심리 추천 결과가 표시되는 곳 -->
            </div>
            <div class="form-area step2">
              <!-- 인구 통계 추천 결과가 표시되는 곳 -->
            </div>

          </div>
        </div>
      </div>
    </div>
    <!-- 보험분석하기 영역 끝 -->
  </div>
</div>
<!-- 내 보험 찾기 모달 -->
<div class="modal fade" id="getMyInsuranceInformation" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <span class="modal-title">내 보험정보 가져오기</span>
        <button type="button" class="close" data-dismiss="modal"
          style="width: 5%; margin-right: 0.5%">&times;</button>
      </div>
      <div class="modal-body">
        <ul class="nav nav-tabs tabType2">
          <li class="step-tab">1 STEP</li>
          <li class="step-tab">2 STEP</li>
          <li class="step-tab">3 STEP</li>
        </ul>
        <br>
        <div class="form-area step1">
          <div>
          	<div class="form-group">
              <label class="modal-label">이름</label>
          	  <input type="text" class="input100" id="step1Name" placeholder="이름">
          	</div>
          	<div class="form-group">
          	  <label class="modal-label">휴대폰번호</label>
          	  <input type="text" class="input-phone" id="step1Mobile1" placeholder="010" maxlength="3">
          	  -<input type="text" class="input-phone" id="step1Mobile2" placeholder="0000" maxlength="4">
          	  -<input type="text" class="input-phone" id="step1Mobile3" placeholder="0000" maxlength="4">
          	</div>
          	<div class="form-group">
          	  <label class="modal-label">주민등록번호</label>
          	  <input type="text" class="input-id-number" id="step1Ssn1" maxlength="6">
          	  -<input type="password" class="input-id-number" id="step1Ssn2" maxlength="7">
          	</div>
          	<div class="form-group">
          	  <label class="modal-label">통신사</label>
          	  <ul class="phoneCarrier col-sm-10">
                <li class="custom-li-left">
                  <input type="radio" id="SKT" name="phoneCarrier" value="SKT"> 
                  <label for="SKT">SKT</label>
               	</li>
                <li class="custom-li-left">
                  <input type="radio" id="KT" name="phoneCarrier" value="KT"> 
                  <label for="KT">KT</label>
                </li>
                <li class="custom-li-left">
                  <input type="radio" id="LG U+" name="phoneCarrier" value="LG">
                  <label for="LG U+">LG U+</label>
                </li>
                <li class="custom-li-left">
                  <input type="radio" id="etcPhone" name="phoneCarrier" value="ETC">
                  <label for="etcPhone">알뜰폰</label>
                </li>   
             </ul>
           </div>
          </div>
          <br>
          <div>
          	<div class="button-cancel">
              <button type="button" class="btn" data-dismiss="modal">취소</button>
        	</div>
        	<div class="button-next">
        	  <button type="button" class="btn" id="step1Button">다음</button>
          	</div>
          </div>
        </div>
        <br>
        <div class="form-area step2">
          <div>
          	<div class="form-group">
              <label class="modal-label">보안문자입력</label>
          	  <input type="text" class="input100" id="step2Security" placeholder="보안문자를 입력해주세요">
          	</div>
          	<div class="imgArea">
          	  <img src="/resources/img/management/e88baf38-7fc1-461d-b7d1-687c674fc2f5.png" >
          	</div>
          </div>
          <br>
          <div>
          	<div class="button-cancel">
              <button type="button" class="btn" data-dismiss="modal">취소</button>
        	</div>
        	<div class="button-next">
        	  <button type="button" class="btn" id="step2Button">다음</button>
          	</div>
          </div>
        </div>
        <div class="form-area step3">
          <input type="hidden" id="uuid">
          <button type="button" class="btn" id="step3Button" style="margin-bottom: 10px;">불러오기</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 보험  상품 상세 보기-->
<div class="modal fade" id="insuranceDetailModal" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <span class="modal-title">보험상품 상세보기</span>
          <button type="button" class="close" data-dismiss="modal" style="width:10%">&times;</button>
      </div>
      <div class="modal-body">
        <!-- 보험 상세 내역이 들어가는 부분 -->
      </div>
      <div class="modal-footer">'
        <button type="button" class="btn" data-dismiss="modal" style="width:15%">닫기 </button>
      </div>
    </div>
  </div>
</div>

<!-- 이미지 자르기 -->
<style>
.imgArea {
  max-width: 466px;
  overflow: hidden;
}
.imgArea img {
  max-width: initial;
  margin-top: -91%;
  margin-left: -5%;
  margin-bottom: -70%;
}

.already-has-insurance {
  background: rgba(0, 0, 0, 0.5);
}

.modal-title{
  padding: 1rem;
    margin: -1rem -1rem -1rem auto;
}

#modal-top{
  margin: 5% 0;
}

#modal-top img{
  margin-left:3%;
  margin-right:1%;
}

#modal-top-span{
  width:75%;
  margin:5% 0px;
  display:inline-block;
  text-align: center;
  font-weight: bold;
}

#download{
  width: 100%;
    margin: 1% 2%;
  display:inline-block;
  text-align: left;
  font-weight: bold;
}


.insurance-group{
  margin:0.1rem auto;
}

.insurance-group label{
  width:20%;
  margin-left:3%;
  background-color: #30b1b2;
  border-radius: 0.2rem;
  color: white;
  padding:0.1rem 0.5rem;
  text-align: center;
  box-shadow: 5px 6px #B8C6C7;
}

.insurance-group div{
  width:70%;
  display:inline-block;
  margin: 0px 3%;
  text-align: left;
  border-radius: 0.2rem;
    padding: 0.5% 2%;
  box-shadow: 3px 3px 5px lightgray;
}

#after-find-insurance .col-sm-4 {
	width: 33%;
	display: inline-block;
	vertical-align: middle;
}

#after-find-insurance .col-sm-8{
	width: 63%;
	display: inline-block;
	vertical-align: top;
}
#detail-insurance .col-sm-4 {
	width: 32%;
	vertical-align: top;
}
th[scope="row"] {
    width: 32%;
}
#detail-insurance .col-sm-4 .bg-gray {
	min-height : 486px;
}
</style>

<!-- JavaScript -->
<script src="resources/js/common/Chart.js"></script>
<script src="resources/js/common/Utils.js"></script>
<script src="resources/js/common/Insurance.js"></script>
<script>
	var loginUserId = '${userId}';
	
	// 처음 페이지 로딩 시 심리 추천 결과 가져오기
	getPsychologicalRecommendationList();
	
	// 추천 보험 상세보기 이벤트
	$('.recommendation-wrapper').on('click', '.insurance-card', Insurance.getInsuranceDetail);
	
	// 가입 보험 리스트가 비어 있는지 확인해
	// 있을 경우 : 가입 보험 목록 표시
	// 없을 경우 : 가입 보험 불러오기
	// getEnrolledInsurance() 함수가 보험 불러오기 div를 숨기고 가입 목록 div를 표시하므로 없을 경우 처리가 필요
	getEnrolledInsurances();
	
	var data = [ {
		x : '2016-12-25',
		y : 20
	}, {
		x : '2016-12-26',
		y : 10
	} ];
	var ctx = $('#analysChart');
	new Chart(ctx, {
		type : "horizontalBar",
		data : {
			labels : [ "질병보장", "재해상해", "연금", "저축", "기타" ],
			datasets : [ {
				data : [ 65, 59, 80, 81, 56 ],
				fill : false,
				backgroundColor : [ "rgba(255, 99, 132, 0.2)",
						"rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)",
						"rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)" ],
				borderColor : [ "rgb(255, 99, 132)", "rgb(255, 159, 64)",
						"rgb(255, 205, 86)", "rgb(75, 192, 192)",
						"rgb(54, 162, 235)", ],
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			},
			legend : {
				display : false,
			}
		}
	});


//탭 이벤트 함수
function stepTabEvent(clickedTab) {
	// 탭 관련 처리
    $('.step-tab').removeClass('on').addClass('shadow');
	$(clickedTab).removeClass('shadow').addClass('on');
	// 탭에 대한 내용 표시
	var index = $(clickedTab).index();
	$('.modal-body .form-area').removeClass('on');
	$('.modal-body .form-area').eq(index).addClass('on');
}

stepTabEvent($('.step-tab:first'));

//탭클릭 이벤트
$('.step-tab').click(function() {
	// 유효성 검사 추가
	stepTabEvent(this);
});


//이미지 동적 추가
function imageAppend(imagePath) {
	//이미지가 들어갈 부분 삭제
	$('.imgArea img').remove();
	
	//이미지 동적 추가
	var tag = '<img src="/resources/img/management/screenshots/'+imagePath+'">';
	$('.imgArea').append(tag);
}

//Step1 ajax 통신
$('.modal-body').on('click','#step1Button',function(event) {
	$.ajax({
		type : "post",
		url  : "http://localhost:5000/python-server/enter-basic-info-to-get-enrolled-insurances",
		data : JSON.stringify({
			"name": $('#step1Name').val(),
			"mobileno1": $('#step1Mobile1').val(),
			"mobileno2": $('#step1Mobile2').val(),
			"mobileno3": $('#step1Mobile3').val(),
			"ssn1": $('#step1Ssn1').val(),
			"ssn2": $('#step1Ssn2').val(),
			"mobileServiceProvider": $("input[name='phoneCarrier']:checked").val()
		}),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			stepTabEvent($('.step-tab')[1]);
			imageAppend(data.imagePath);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR.responseText);
		}
	});
});

//Step2 ajax 통신
$('.modal-body').on('click','#step2Button',function(event) {
	$.ajax({
		type : "post",
		url  : "http://localhost:5000/python-server/enter-security-number-to-get-enrolled-insurances",
		data : JSON.stringify({
			"uuid": $('.imgArea img').attr("src").split("/")[5].split(".")[0],
		    "securityNumber": $('#step2Security').val()
		}),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			if (data.is_success) {
				stepTabEvent($('.step-tab')[2]);
				$('#uuid').val(data.uuid);
			} else {
				imageAppend(data.uuid + '.png');
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR.responseText);
		}
	});
});

//Step3 ajax 통신
$('.modal-body').on('click','#step3Button',function(event) {
	console.log('여기')
	$.ajax({
		type : "post",
		url  : "/user/users/" + loginUserId + "/insurances?uuid=" + $('#uuid').val(),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			console.log($('#uuid').val());
			getEnrolledInsurances();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR.responseText);
		}
	});
});

// 내가 가입한 보험 목록을 가져오는 함수
function getEnrolledInsurances() {
	$.ajax({
		type : "get",
		url  : "/user/users/" + loginUserId + "/insurances",
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
    		$('.table-large-list tbody').empty();
    		$('.table-small-list tbody').empty();
			if (data !== null
				&& data !== undefined
				&& data.length > 0) {
		    	for ( var index in data) {
		    		var insurance = data[index];
		    		var tag = '<tr>'
		            		+ '	 <input type="hidden" name="insuranceId" value="'+ insurance.insuranceId +'">'
		    			    + '	 <th scope="row">'+ (parseInt(index) + 1) +'</th>'
		    				+ '	 <td>'+ insurance.insuranceName +'</td>'
		    				+ '	 <td>'+ insurance.insuranceType +'</td>'
		    	  			+ '</tr>';
		    		$('.table-large-list tbody').append(tag);
		    		$('.table-small-list tbody').append(tag);
		    	}
		    	$('#first-find-list').css('display','none');
		    	$('#after-find-insurance').css('display','block');
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR.responseText);
		}

	});
}

// 내보험 상세 보기 닫기
$("#detail-insurance").on('click','button.close',function(event){
	$('#insurance-large-list').css('display','inline-block');
	$('#detail-insurance').css('display','none');
});
// 내보험 상세보기
$(".table-large-list tbody").on('click','tr',function(event){
	
	var insuranceId = $(this).find('input[name="insuranceId"]').val();
	$.ajax({
		type : "get",
		url  : "/user/users/"+loginUserId+"/insurances/"+insuranceId,
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			var tag = '<div class="insurance-detail">' + 
            			'<h5>해외여행보험</h5>' +
			  				'<button type="button" class="close" style="width:10%">&times;</button><br>' + 
			  					'<table class="table">' + 
  								'<tbody>' +
    			  					'<tr>' +
      									'<th scope="row">계약상태</th>' +
      									'<td>'+ data.contractStatus + '</td>' + 
    			  					'</tr>' +
    			  					'<tr>' +
      									'<th scope="row">구분</th>' +
      									'<td>' + data.insuranceType  + '</td>' + 
    			  					'</tr>' +
    			  					'<tr>' + 
      									'<th scope="row">담당점포</th>' +
      									'<td>' + data.storeInCharge + '</td>' +
    			  					'</tr>' +
    			  					'<tr>' +
      									'<th scope="row">보험기간</th>' +
      									'<td>' + data.insuranceTerm + '</td>' +
    			  					'</tr>' +	
    			  					'<tr>' +
      									'<th scope="row">증권번호</th>' +
      									'<td>' + data.stockNumber + '</td>' +
    			  					'</tr>' +
  			 					'</tbody>' + 
			  				'</table>' +
			  			'<div>' +
			  			'<label id="insuranceMoney">보장금액</label><input type="text" class="input100" placeholder="숫자만">' +
			  			'<span id="insuranceLink"><a href="">내 보장금액을 모른다면?</a></span>' +
			  			'</div>' +
			  		'</div>';
			  $('#enrolled-insurance-detail-wrapper').html(tag);
			  $('#insurance-large-list').css('display','none');
			  $('#detail-insurance').css('display','inline');
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR.responseText);
		}
	});
});

// 심리 추천 결과를 표시하는 함수
function getPsychologicalRecommendationList() {
	$.ajax({
		type : "get",
		url  : "/user/users/" + loginUserId + "/psychological-recommendation-results",
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			
			// 활성화된 탭의 인덱스를 가져와 CSS 변경
			var activeIndex = $('.step-tab.on').index();
			
			var formToAppend = tabFormCss(activeIndex);
			
			for ( var index in data) {
				var insurance = data[index];
				
				// 부족한 데이터 추가
				insurance['imageAlt'] = '하나생명';
				insurance['imagePath'] = 'resources/img/recommendation/hana_logo_small.png';
				
				var tag = Utils.formatElement(insurance, Insurance.listCardFormat);
				
				$(formToAppend).append(tag);
				if (insurance['hasSameType'] === 'Y') {
					$('.insurance-card:last-child').addClass('already-has-insurance');
				}
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR.responseText);
		}
	});
}

// 인구통계 추천 결과를 표시하는 함수
function getDemographicRecommendationList() {
	$.ajax({
		type : "get",
		url  : "/user/users/" + loginUserId + "/demographic-recommendation-results",
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			
			// 활성화된 탭의 인덱스를 가져와 CSS 변경
			var activeIndex = $('.step-tab.on').index();
			
			var formToAppend = tabFormCss(activeIndex);

			for ( var index in data) {
				var insurance = data[index];
				// 부족한 데이터 추가
				insurance['imageAlt'] = '하나생명';
				insurance['imagePath'] = 'resources/img/recommendation/hana_logo_small.png';
				
				var tag = Utils.formatElement(insurance, Insurance.listCardFormat);
				
				$(formToAppend).append(tag);
				if (insurance['hasSameType'] === 'Y') {
					$('.insurance-card:last-child').addClass('already-has-insurance');
				}
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR.responseText);
		}
	});
}

function tabFormCss(index) {
	
	var tabSelector = '.recommendation-wrapper .step-tab:eq(' + index + ')';
	var formSelector = '.recommendation-wrapper .form-area:eq(' + index + ')';
	
	// 탭에 CSS 추가
	$('.recommendation-wrapper .step-tab').removeClass('on').addClass('shadow');
	$(tabSelector).removeClass('shadow').addClass('on');
	
	// form CSS 추가
	$('.recommendation-wrapper .form-area').removeClass('on').addClass('shadow');
	$(formSelector).removeClass('shadow').addClass('on');
	$(formSelector).empty();
	
	return formSelector;
}

</script>