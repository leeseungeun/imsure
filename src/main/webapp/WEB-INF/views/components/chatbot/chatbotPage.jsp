<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="resources/css/chatbot/chatbot.css">

<!-- header -->
<jsp:include page="../../includes/header.jsp"/>

<!-- 챗봇 버튼 -->
<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#chatbot"> 챗봇 </button>

<!-- 모달 -->
<div class="modal fade" id="chatbot" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-notify modal-info" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">보험 상담</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="mesgs">
          <div class="received_msg">
            <div class="received_with_msg">
              <p>Test which is a new approach to have all
                solutions</p>
              <span class="time_date"> 11:01 AM </span>
            </div>
          </div>
          <div class="outgoing_msg">
            <div class="sent_msg">
              <p>Test which is a new approach to have all
                solutions</p>
              <span class="time_date" style="float: right;"> 11:01 AM </span>
            </div>
          </div>
          <div class="received_msg">
            <div class="received_with_msg">
              <p>Test, which is a new approach to have</p>
              <span class="time_date"> 11:01 AM </span>
            </div>
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
<!-- Plugins -->
<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<script src="resources/vendor/bootstrap/js/popper.min.js"></script>
<script src="resources/vendor/select2/select2.min.js"></script>
<script src="resources/vendor/daterangepicker/moment.min.js"></script>
<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<script src="resources/vendor/countdowntime/countdowntime.js"></script>

<script>
//보험 상세보기를 위한 ajax
$('.modal-body').on('click','#send',function(event) {
	$.ajax({
		type : "post",
		url : "/user/send-message",
		data : JSON.stringify({
			"message" : $('#chat').val()
		}),
		contentType : "application/json; charset=UTF-8",
		success : function(data, status, xhr) {
			var tag = '<div class="outgoing_msg">'
					+ '  <div class="sent_msg">'
					+ '	   <p>'+data+'</p>'
					+ '    <span class="time_date" style="float: right;"> 11:01 AM </span>'
					+ '  </div>'
					+ '</div>'
					
			$('.mesgs').append(tag);				
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert(jqXHR.responseText);
		}
	});
});
</script>