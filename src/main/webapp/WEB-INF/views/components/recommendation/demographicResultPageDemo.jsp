<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.demographicResult.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.custom.common.css">
<!-- header -->
<jsp:include page="../../includes/header.jsp"/>

<div class="container ng-scope">
  <div id="recommend" class="wrapper row">
    <div class="col-sm-12" id="result-part">
      <div class="row">
        <div class="col-sm-4 output step-txt"style="min-height: 589px;">
          <form role="form" class="ng-pristine ng-valid">
            <div class="analysResultDiv">
              <span style="display: none;">
                <sec:authentication property="principal.user.userId" var="userId"/>
              </span>
              <p class="txt-board">
                <span id="isMarriedComment"></span><br>
                <span id="userNameResult" class="info-txt typeName ng-binding"></span>
                님에게  꼭 필요한 보험은<br> 
                <span id="insuranceTypeFirst" class="info-txt ng-binding"></span>, 
                <span id="insuranceTypeSecond" class="info-txt ng-binding"></span> 보험이며,<br>
                고려해볼만한 보험은<br> 
                <span id="insuranceTypeThird" class="info-txt ng-binding"></span>,
                <span id="insuranceTypeFourth" class="info-txt ng-binding"></span><br> 보험입니다.
              </p>
            </div>
          </form>
        </div>
        <div class="col-sm-8 forms step-area" style="min-height: 589px;">
          <div class="bgChange">
          <div class="title-wrapper-demo">
            <h4 class="recommendation-header">
              <span class="application-name">I'M SURE</span>에서 확신하는 
              <span class="recommendation-highlight">추천</span> 생명보험은?
            </h4>
            <button type="button" class="btn whysure" data-toggle="modal" style="width:30%;margin:0% 0% 2% 70%"
              data-target="#algorithmDescriptionModal">Why SURE ?</button>
          </div>
            <ul class="nav nav-tabs">
              <li class="step-tab" >질병</li>
              <li class="step-tab" >재해/상해</li>
              <li class="step-tab" >사망</li>
              <li class="step-tab" >연금</li>
              <li class="step-tab" >저축</li>
              <li class="step-tab" >더보기</li>
            </ul>
            <div class="form-area step1">
              <div class="recommendation-list" id="step1"></div>
            </div>
            <div class="form-area step2">
              <div class="recommendation-list" id="step2"></div>
            </div>
            <div class="form-area step3">
              <div class="recommendation-list" id="step3"></div>
            </div> 
            <div class="form-area step4">
              <div class="recommendation-list" id="step4"></div>
            </div>
            <div class="form-area step5">
              <div class="recommendation-list" id="step5"></div>
            </div>
            <div class="form-area step6">
              <div class="recommendation-list" id="step6"></div>
            </div>
            <button class="buttonPrev"><span> 이전</span></button>
           </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 알고리즘 설명 모달 -->
<jsp:include page="../../includes/demographicAlgorithmDescriptionModal.jsp"></jsp:include>

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
      <div class="modal-footer">
        <button type="button" class="btn" data-dismiss="modal" style="width:15%">닫기 </button>
      </div>
    </div>
  </div>
</div>

<!-- JavaScript -->
<script src="/resources/js/common/chartist.min.js"></script>
<script>
function sendCardDataToServer(){
	
	Demographic.data['userId'] = '${userId}';
	
	$.ajax({
		type : "post",
		url : "/user/recommend-based-on-demographical-features",
		data : JSON.stringify(Demographic.data),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
		
			var tag = '<div class="noInsuranceInfo">추천 보험이 존재하지 않습니다.</div> ';
			// data에서 종류를 뽑아서 남기고,
			var insuranceTypeMap = data.map(insurance => insurance['insuranceType']).filter((v, i, a) => a.indexOf(v) === i)			
			//["질병보장보험", "재해상해보험", "사망보험", "연금보험"]
			if(insuranceTypeMap.indexOf('질병보장보험') == -1){
				$('#step1').append(tag)
			}
			if(insuranceTypeMap.indexOf('재해상해보험') == -1){
				$('#step2').append(tag)
			}
			if(insuranceTypeMap.indexOf('사망보험') == -1){
				$('#step3').append(tag)
			}
			if(insuranceTypeMap.indexOf('연금보험') == -1){
				$('#step4').append(tag)
			}
			if(insuranceTypeMap.indexOf('저축보험') == -1){
				$('#step5').append(tag)
			}
			if(insuranceTypeMap.indexOf('간병보험') == -1 && insuranceTypeMap.indexOf('어린이보험') == -1){
				$('#step6').append(tag)
			}
			stepTabEvent($('.step-tab:first'));
			for ( var index in data) {
				var insurance = data[index];
				insurance['imageAlt'] = '하나생명';
				insurance['imagePath'] = 'resources/img/recommendation/hana_logo_small.png';
				
				if(insurance.insuranceType=="질병보장보험"){
					$("#step1").append(Utils.formatElement(insurance,Insurance.listCardFormat));
					
				}else if(insurance.insuranceType=="재해상해보험"){
					$("#step2").append(Utils.formatElement(insurance,Insurance.listCardFormat))
					
				}else if(insurance.insuranceType=="사망보험"){
					$("#step3").append(Utils.formatElement(insurance,Insurance.listCardFormat))
					
				}else if(insurance.insuranceType=="연금보험"){
					$("#step4").append(Utils.formatElement(insurance,Insurance.listCardFormat))
					
				}else if(insurance.insuranceType=="저축보험"){
					$("#step5").append(Utils.formatElement(insurance,Insurance.listCardFormat))
					
				}else if(insurance.insuranceType=="간병보험"){
					$("#step6").append(Utils.formatElement(insurance,Insurance.listCardFormat))
				}else if(insurance.insuranceType=="어린이보험"){
					$("#step6").append(Utils.formatElement(insurance,Insurance.listCardFormat))
				}	
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		}
	});
}
</script>
<script src="/resources/js/common/Insurance.js"></script>
<script src="/resources/js/recommendation/demographicResultDemo.js"></script>
<!-- Plugins -->



