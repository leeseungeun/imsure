<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="resources/css/chatbot/chatbot.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp"/>

<!-- 챗봇 버튼 -->
<button type="button" class="button" data-toggle="modal" data-target="#chatbot"> 1:1 보험 상담 </button>

<!-- 모달 -->
<div class="modal fade" id="chatbot" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-notify modal-info" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">1:1 보험 상담</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="mesgs">
          <div class="received_msg">
            <div class="received_with_msg">
              <p>
				안녕하세요!<br>
				보험에 확신을 더한 생명보험 추천 어플리케이션 I'MSURE입니다.<br>
				보험과 관련된 다양한 질문을 입력하시면 답변을 메시지로 받으실 수 있습니다.<br>
				<br>
				무엇이든 물어보세요!<br>
				FAQ와 1:1 채팅을 통해 궁금하신 사항을 해결하실 수 있습니다.
              </p>
              <span class="time_date"></span>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer" id="faq-footer">
      	<div class="dropdown dropup float-right">
    	  <button type="button" class="btn faq dropdown-toggle" data-toggle="dropdown">
     	    FAQ
    	  </button>
    	  <div class="dropdown-menu">
      	    <a class="dropdown-item" id="one">I'MSURE가 궁금합니다.</a>
      		<a class="dropdown-item" id="two">보험은 왜 필요한가요?</a>
      		<a class="dropdown-item" id="three">보험 추천은 어떻게 이루어 지나요?</a>
          </div>
  		</div>
  	  </div>
  	  <div class="modal-footer">
  		<input type="text" class="form-control" id="chat" placeholder="궁금한 내용을 물어보세요.">
    	<button type="button" id="send" class="btn btn-info">Send</button>
      </div>
    </div>
  </div>
</div>
        
<!-- JavaScript -->
<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<script src="resources/vendor/bootstrap/js/popper.min.js"></script>
<script src="resources/vendor/select2/select2.min.js"></script>
<script src="resources/vendor/daterangepicker/moment.min.js"></script>
<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<script src="resources/js/chatbot/chatbot.js"></script>
