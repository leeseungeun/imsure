<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.custom.common.css">
<link rel="stylesheet" type="text/css" href="resources/css/recommendation/recommendation.demographic.css">
<!-- header -->
<jsp:include page="../../includes/header.jsp"/>

<div class="container ng-scope" >
    <div id="recommend" class="wrapper row">
      <div class="col-sm-6 forms output step-txt" style="min-height: 589px;">
            <form role="form" class="ng-pristine ng-valid">
                <div class="form-txt-board">
                    <p class="txt-board">
                        <span class="info-txt typeName ng-binding">김땡땡</span> 님은<br>
                        <span class="info-txt ng-binding">여자</span> 이며,<br class="txt-board-br">
                        <span class="info-txt ng-binding">60</span> 세의,<br>
                        <span class="info-txt ng-binding">개인사업자</span> 이며,<br class="txt-board-br">
                        <span class="info-txt ng-binding">미혼</span> 입니다.
                    </p>
                    <div class="btn-block btn-output">
                        <button class="btn btn-search" id="btn-right-search" ng-click="sendSugarResult()" ng-readonly="next2Checek()" ng-attr-title="{{next2buttonTitle}}" title="" style="display: none;">내게 맞는 보험 찾기
                        </button>
                    </div>
                </div>
            </form>   
        </div>
        <div class="col-sm-6 forms step-area" style="min-height: 589px;">
            <div class="bgChange">
                <ul class="nav nav-tabs tabType2">
                <!-- 선택했을때 이벤트 처리! -->
                    <li class=".step-tab ">1 STEP</li>
                    <li class=".step-tab ">2 STEP</li>
                </ul>
                <div class="form-area on">
                    <form class="form-horizontal ng-pristine ng-valid ng-valid-maxlength" role="form">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="user" >이름</label>
                            <div class="col-sm-10 input-area" >
                                <input type="text"  class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-maxlength" id="user" ng-model="inName" maxlength="12" ng-maxlength="12" placeholder="이름을 입력하세요" kr-input="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" >성별</label>
                            <ul class="col-sm-10 sex" >
                                <li class="custom-li-left" >
                                    <input type="radio" id="male"name="gender" value="남자">
                                    <label for="male" >남자</label>
                                </li>
                                <li class="custom-li-right">
                                    <input type="radio" id="female"name="gender" value="여자">
                                    <label for="female" >여자</label>
                                </li>

                            </ul>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="birth-d">생년월일</label>
                            <div class="col-sm-10 input-area">
                                <input type="text" class="form-control onlyNumber ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-maxlength" id="birth-d" ng-model="inAge" maxlength="8" placeholder="예) 1990212" ng-blur="ageCheck()">
                                <p class="notice is-pl">
                                    <small>
                                        주민등록상의 생년월일을 입력하세요<br>
                                    </small>
                                </p>
                            </div>
                        </div>
                        <!-- style="display: none;"추가 -->
                       <div class="form-group">
                            <div class="form-group">
                              <label class="control-label col-sm-2" >결혼여부</label>
                              <ul class="col-sm-10 recommend-chk" >
                                <li class="custom-li-left">
                                  <input type="radio" id="married" name="marry" value="기혼">
                                  <label for="married" >기혼</label>
                                  </li>
                                <li class="custom-li-right">
                                  <input type="radio" id="single" name="marry" value="미혼">
                                  <label for="single" >미혼</label>
                                  </li>
                              </ul>
                            </div>
                            <!-- 결혼 '유' 선택했을 경우 추가 -->
                            <div class="form-group">
                              <label class="control-label col-sm-2" >자녀유무</label>
                              <ul class="col-sm-10 recommend-chk">
                                <li class="custom-li-left">
                                  <input type="radio" id="child-has" name="child" value="유">
                                  <label for="child-has" >유</label>
                                  </li>
                                <li class="custom-li-right">
                                  <input type="radio" id="child-none" name="child" value="무">
                                  <label for="child-none" >무</label>
                                </li>
                              </ul>
                              <p class="notice is-pl" id="childNotice">
                                    <small>
                                        자녀가 성인인 경우는 '무'를 선택해주세요.<br>
                                    </small>
                              </p>
                            </div>
                            <!-- 결혼무 선택했을 경우 보여줘야함-->
                            <div class="form-group">
                                <label class="control-label col-sm-2" >부양가족
                                </label>
                                <ul class="col-sm-10 recommend-chk">
                                    <li class="custom-li-left">
                                        <input type="radio" id="fam-has" name="family" value="유">
                                        <label for="fam-has" >유</label>
                                    </li>
                                    <li class="custom-li-right">
                                        <input type="radio" id="fam-none" name="family" value="무">
                                        <label for="fam-none" >무</label>
                                    </li>  
                                </ul>
                            </div>
                        </div>
                    </form>
                    
                    <div class="btn-block btn-input">
                    <!-- style="display: none;" -->
                        <p class="notice errormsg" >
                            <small class="ng-binding" style="color: rgb(255, 0, 0);"></small>
                        </p>
                        <button class="btn btn-next next" ng-readonly="next1Check()">다음 단계</button>
                    </div>
                </div>
                
                
                <!-- step-2 -->
                <div class="form-area on">
                    <form class="form-horizontal form-type2 ng-pristine ng-valid ng-valid-maxlength" role="form">
                        <div class="form-group">
                                <label class="control-label col-sm-2" >암가족력
                                </label>
                                <ul class="col-sm-10 recommend-chk">
                                    <li class="custom-li-left">
                                        <input type="radio" id="cancer-has" name="cancer" value="유">
                                        <label for="cancer-has" >유</label>
                                    </li>
                                    <li class="custom-li-right">
                                        <input type="radio" id="cancer-none" name="cancer" value="무">
                                        <label for="cancer-none" >무</label>
                                    </li>  
                                </ul>
                            </div>
                        <div class="form-group" style="margin-bottom:2%">
                            <label class="control-label col-sm-4" for="salary">년소득</label>
                            <div class="col-sm-8 input-area">
                                <input type="text" class="form-control onlyNumber ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-maxlength" id="salary" ng-model="inSalary" maxlength="4" placeholder="예) 2800">
                                <span>만원</span>
                                <p class="notice">
                                    <small>세금을 제외한 금액을 만원 단위로 입력해 주세요.</small>
                                </p>
                            </div>
                        </div>
                        <!-- 암가족력이 있는지 물어보는거 추가 -->
                        <div class="form-group type-height">
                            <label class="control-label col-sm-2" style="float:left">직업군
                                </label>
                            <ul class="jobs">
                                <li class="custom-li-left">
                                    <input type="radio" id="manager" name="joblist" value="근로소득자">
                                    <label for="manager" >관리자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="expert" name="joblist" value="개인사업자">
                                    <label for="expert" >개인사업자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="clerks" name="joblist" value="근로소득자">
                                    <label for="clerks" >사무종사자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="service" name="joblist" value="근로소득자">
                                    <label for="serviceWorker" >서비스 종사자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="salesWorker" name="joblist" value="근로소득자">
                                    <label for="salesWorker" >판매 종사자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="forestryAndFishery" name="joblist" value="근로소득자">
                                    <label for="forestryAndFishery" >농림어업 숙련 종사자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="technician" name="joblist" value="근로소득자">
                                    <label for="technician" >기능원 및 관련 종사자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="mechanicalSkillWorker" name="joblist" value="근로소득자">
                                    <label for="mechanicalSkillWorker" >기계조작 및 조립 종사자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="technician" name="joblist" value="근로소득자">
                                    <label for="labor" >단순노무 종사자</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="technician" name="joblist" value="근로소득자">
                                    <label for="housewife" >주부</label>
                                </li>
                                <li class="custom-li-left">
                                    <input type="radio" id="technician" name="joblist" value="근로소득자">
                                    <label for="etc" >기타</label>
                                </li>
                            </ul>
                        </div>
                    </form>
                    <div class="btn-block btn-input">
                    <!-- style="display: none;" -->
                        <p class="notice errormsg" >
                           <small class="ng-binding" style="color: rgb(255, 0, 0);"></small>
                        </p>
                        <button class="btn btn-prev">이전 단계</button>
                        <button class="btn btn-search" ng-click="sendSugarResult()" ng-readonly="next2Checek()" ng-attr-title="{{next2buttonTitle}}" title="">내게 맞는 보험 찾기
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</div>


<!-- JavaScript -->
<!-- Plugins -->


<script>
//탭을 클릭하면 관련 input이 나오게



</script>
