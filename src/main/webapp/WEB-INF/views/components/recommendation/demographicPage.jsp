<%@page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.common.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.index.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.custom.common.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/recommendation/recommendation.demographic.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp" />

<div class="container ng-scope">
  <div id="recommend" class="wrapper row">
    <!-- 입력 내용 확인 start -->
    <div class="col-sm-6 forms output step-txt">
      <form role="form" class="ng-pristine ng-valid">
        <div class="form-txt-board">
          <p class="txt-board">
            <span class="info-txt typeName ng-binding" id="spanUserName"></span> 님은<br>
            <span class="info-txt ng-binding" id="spanUserGender" ></span> 이며,<br
              class="txt-board-br"> <span
              class="info-txt ng-binding" id="spanUserAge"></span> 세의,<br> <span
              class="info-txt ng-binding" id="spanUserMarried"></span> 이며,<br
              class="txt-board-br"> <span
              class="info-txt ng-binding" id="spanUserJob"></span> 입니다.
          </p>
        </div>
      </form>
    </div>
    <!-- 입력 내용 확인 end -->
    <!-- 입력 start -->
    <div class="col-sm-6 forms step-area">
      <div class="bgChange">
        <ul class="nav nav-tabs tabType2">
          <li class="step-tab">1 STEP</li>
          <li class="step-tab">2 STEP</li>
        </ul>
        <div class="form-area step1">
          <form
            class="form-horizontal ng-pristine ng-valid ng-valid-maxlength"
            role="form">
            <div class="form-group">
              <label class="control-label col-sm-2" for="user">이름</label>
              <div class="col-sm-10 input-area">
                <input type="text"
                  class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-maxlength"
                  id="userName" ng-model="inName" maxlength="12"
                  ng-maxlength="12" placeholder="이름을 입력하세요" kr-input="">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2">성별</label>
              <ul class="col-sm-10 sex two-option-radio">
                <li class="custom-li-left"><input type="radio"
                  id="M" name="gender" value="M"> <label
                  for="M">남자</label></li>
                <li class="custom-li-right"><input type="radio"
                  id="W" name="gender" value="W"> <label
                  for="W">여자</label></li>
              </ul>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="birthNumber">생년월일</label>
              <div class="col-sm-10 input-area">
                <input type="text"
                  class="form-control onlyNumber ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-maxlength"
                  id="birthNumber" ng-model="inAge" maxlength="8"
                  placeholder="예) 1990212">
                <p class="notice is-pl">
                  <small>주민등록상의 생년월일을 입력하세요<br>
                  </small>
                </p>
              </div>
            </div>
            <!-- style="display: none;"추가 -->
            <div class="form-group">
              <div class="form-group">
                <label class="control-label col-sm-2">결혼여부</label>
                <ul class="col-sm-10 recommend-chk two-option-radio">
                  <li class="custom-li-left"><input type="radio"
                    id="married" name="isMarried" value="Y"> <label
                    for="married">기혼</label></li>
                  <li class="custom-li-right"><input type="radio"
                    id="single" name="isMarried" value="N"> <label
                    for="single">미혼</label></li>
                </ul>
              </div>
              <!-- 결혼 '유' 선택했을 경우 추가 -->
              <div class="form-group" id="childOrFamily"></div>
              <!-- 결혼무 선택했을 경우 보여줘야함-->

            </div>
          </form>

          <div class="btn-block btn-input">
            <!-- style="display: none;" -->
            <p class="notice errormsg">
              <small class="ng-binding" style="color: rgb(255, 0, 0);"></small>
            </p>
            <button class="btn btn-next next"
              onclick="moveStepEvent('next');">다음 단계</button>
          </div>
        </div>

        <!-- step-2 -->
        <div class="form-area step2">
          <form
            class="form-horizontal form-type2 ng-pristine ng-valid ng-valid-maxlength"
            role="form">
            <div class="form-group">
              <label class="control-label col-sm-2">암가족력 </label>
              <ul class="col-sm-10 recommend-chk two-option-radio">
                <li class="custom-li-left"><input type="radio"
                  id="cancer-has" name="hasFamilyCancer" value="Y"> <label
                  for="cancer-has">유</label></li>
                <li class="custom-li-right"><input type="radio"
                  id="cancer-none" name="hasFamilyCancer" value="N"> <label
                  for="cancer-none">무</label></li>
              </ul>
            </div>
            <div class="form-group" style="margin-bottom: 2%">
              <label class="control-label col-sm-4" for="income">년소득</label>
              <div class="col-sm-8 input-area" id="salary-input-wrapper">
                <input type="text"
                  class="form-control onlyNumber ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-maxlength"
                  id="income" ng-model="inSalary" maxlength="4"
                  placeholder="예) 2800"> <span class="unit">만원</span>
                <p class="notice">
                  <small>세금을 제외한 금액을 만원 단위로 입력해 주세요.</small>
                </p>
              </div>
            </div>
            <div class="form-group type-height">
              <label class="control-label col-sm-2" style="float: left">직업군
              </label>
              <ul class="jobs col-sm-10">
                <li class="custom-li-left"><input type="radio"
                  id="manager" name="job" value="관리자"> <label
                  for="manager">관리자</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="clerks" name="job" value="사무종사자"> <label
                  for="clerks">사무종사자</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="serviceWorker" name="job" value="서비스종사자">
                  <label for="serviceWorker">서비스 종사자</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="salesWorker" name="job" value="판매종사자">
                  <label for="salesWorker">판매 종사자</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="forestryAndFishery" name="job" value="농림어업숙련종사자">
                  <label for="forestryAndFishery">농림어업 숙련 종사자</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="technician" name="job" value="기능원및관련종사자">
                  <label for="technician">기능원 및 관련 종사자</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="mechanicalSkillWorker" name="job"
                  value="기계조작및조립종사자"> <label
                  for="mechanicalSkillWorker">기계조작 및 조립 종사자</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="labor" name="job" value="단순노무종사자"> <label
                  for="labor">단순노무 종사자</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="housewife" name="job" value="주부"> <label
                  for="housewife">주부</label></li>
                <li class="custom-li-left"><input type="radio"
                  id="etc" name="job" value="기타"> <label
                  for="etc">기타</label></li>
              </ul>
            </div>
          </form>
          <div class="btn-block btn-input">
            <!-- style="display: none;" -->
            <p class="notice errormsg">
              <small class="ng-binding" style="color: rgb(255, 0, 0);"></small>
            </p>
            <button class="btn btn-prev"
              onclick="moveStepEvent('prev');">이전 단계</button>
            <button type="button" class="btn btn-search"
              onclick="getDemographicResult();">내게 맞는 보험 찾기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- JavaScript -->
<script src="resources/js/recommendation/demographic.js"></script>
<!-- Plugins -->
