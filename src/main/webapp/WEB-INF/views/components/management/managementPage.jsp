<%@ page language="java" contentType="text/html; charset=utf-8"%>
<link rel="stylesheet" type="text/css"
  href="resources/css/management/management.css">
<!-- header -->
<jsp:include page="../../includes/header.jsp" />
<div class="container ng-scope">
  <!-- 처음 화면 -->

  <div class="findContainer">
    <div class="callaction bg-gray">
      <div class="row">
        <div class="col-md-8">
          <div class="find-text">
            <h3>내가 가입한 보험이 궁금하지 않으세요?</h3>
            <p>가입한 생명보험을 확인하고, 필요한 보험을 추천드립니다!</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="cta-btn">
            <button class="btn btn-skin btn-lg">내 보험 정보 가져오기</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 처음화면 끝 -->

  <!-- 보험찾기 눌러서 보험 찾고 난 뒤 뿌려줄 영역 -->
  <div class="row">
    <div class="col-sm-4">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="row">
            <div class="find-text">
              <h3>
                내가 가입한 보험이<br>궁금하지 않으세요?
              </h3>
              <p>
                가입한 생명보험을 확인하고,<br>필요한 보험을 추천드립니다!
              </p>
            </div>
          </div>
          <button class="btn btn-skin btn-lg">내 보험 정보 가져오기</button>
        </div>
      </div>
    </div>
    <!-- 보험리스트 -->
    <div class="col-sm-8">
      <div class="findContainer">
        <div class="callaction bg-gray">
            <div class="find-text">
              <div class="insurance-list">보험리스트</div>
            </div>
        </div>
      </div>
    </div>
    <!-- 보험리스트 끝-->
  </div>
  <!-- 보험찾기 눌러서 보험 찾고 난 뒤 뿌려줄 영역 끝 -->

  <!-- 보험리스트 클릭할 경우 보험 리스트 영역과 상세영역 -->
  <div class="row">
    <div class="col-sm-4">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="find-text">
            <div class="insurance-list">보험리스트</div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="find-text">
            <div class="insurance-detail">보험 상세</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 보험리스트 클릭할 경우 보험 리스트 영역과 상세영역 -->


  <div class="findContainer">
    <div class="callaction bg-gray">
      <div class="form-example-wrap mg-t-30">
        <div class="cmp-tb-hd cmp-int-hd">
          <h5>보험 분석을 위해 기본 정보를 입력해주세요</h5>
        </div>
        <div class="row">
          <div class="col-sm-5">
            <div class="form-group">
              <label class="find-info-label">성별</label>
              <label>남자</label><input type="radio" id="M" name="gander"
                value="M"> 
              <label>여자</label><input type="radio"
                id="W" name="gander" value="W">
            </div>

          </div>
          <div class="col-sm-5">
            <div class="form-example-int form-example-st">
              <div class="form-group">
                <div class="nk-int-st">
                  <label class="find-info-label">생년월일</label><input type="text"
                    class="input100"
                    placeholder="ex) 19930131">
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-2">
            <div class="form-example-int">
              <button class="btn btn-skin btn-lg">분석하기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 보험분석하기 영역 -->
  <div class="wrapper row">
    <div class="col-sm-6">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="row">
            <div class="find-text">
              그래프
              <canvas id="analysChart" width="350"></canvas>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-6">
      <div class="findContainer">
        <div class="callaction bg-gray">
          <div class="bgChange">
            <ul class="nav nav-tabs tabType2">
              <!-- 선택했을때 이벤트 처리! -->
              <li class=".step-tab">1 STEP</li>
              <li class=".step-tab">2 STEP</li>
            </ul>
            <div class="form-area step1 on">심리카드 영역</div>
            <div class="form-area step2 on">인구카드 영역</div>
          </div>
        </div>
      </div>
    </div>
    <!-- 보험분석하기 영역 끝 -->
  </div>
</div>
<!-- JavaScript -->
<script src="resources/js/common/Chart.js"></script>
<script>
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
			labels : [ "암,성인병", "연금", "저축", "상해", "기타" ],
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
</script>