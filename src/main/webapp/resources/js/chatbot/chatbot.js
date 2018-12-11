//현재 시간을 구하는 함수
function formatAMPM(d) {
    var h = d.getHours();
    return (h % 12 || 12)
        + ':' + d.getMinutes().toString().padStart(2, '0')
        + ' ' + (h < 12 ? 'A' : 'P') + 'M';
};

$(document).ready(function (){
	$('#one').click(function(event){
		event.preventDefault();
		
		//현재 시간
		var d = new Date();
		time = formatAMPM(d);
		
		var tag = '<div class="outgoing_msg">'
		    	+ '  <div class="sent_msg">'
		    	+ '	   <p>I\'MSURE가 궁금합니다.</p>'
		    	+ '    <span class="time_date" style="float: right;">'+time+'</span>'
		    	+ '  </div>'
		    	+ '</div>'
				+ '<div class="received_msg">'
				+ '  <div class="received_with_msg">'
				+ '    <p>'
				+ 'I\'MSURE는 생명보험 추천 어플리케이션입니다.<br>'
				+ '그동안 어려웠던 보험을 과학적 근거에 기반해 생명보험을 추천해드립니다.<br>'
				+ '<br>'
				+ '심리 지표를 이용한 추천을 통해 나의 성격에 맞는 생명보험을 알아보세요!<br>'
				+ '인구통계 지표를 이용한 추천을 통해 나와 비슷한 사람들이 가입한 생명보험을 알아보세요!<br>'
				+ '내 보험 관리를 통해 가입한 생명보험을 확인하고,관리하세요!'
				+ '    </p>'
				+ '	   <span class="time_date">'+time+'</span>'
				+ '  </div>'
				+ '</div>'

		$('.mesgs').append(tag);
		$('.modal-body').scrollTop($('.modal-body')[0].scrollHeight);
	});
	$('#two').click(function(event){
		event.preventDefault();
		
		//현재 시간
		var d = new Date();
		time = formatAMPM(d);
		
		var tag = '<div class="outgoing_msg">'
	    		+ '  <div class="sent_msg">'
	    		+ '	   <p>보험은 왜 필요한가요?</p>'
	    		+ '    <span class="time_date" style="float: right;">'+time+'</span>'
	    		+ '  </div>'
	    		+ '</div>'
	    		+ '<div class="received_msg">'
	    		+ '  <div class="received_with_msg">'
	    		+ '    <p>'
	    		+ '사람들의 삶에는 수많은 일들이 일어납니다.<br>'
	    		+ '그 중에 신체부위를 심하게 다치거나 어떤 특정 질병에 걸려 엄청난 고생을 하기도 합니다.<br>'
	    		+ '이 때 적절한 보험 가입으로 미리 대비를 한 사람들은 문제없이 의료비를 보상받지만,<br>'
	    		+ '그렇지 않은 사람들은 큰 어려움을 겪게 됩니다.<br>'
	    		+ '미래를 미리 준비할 수 있는 보험은 꼭! 필요한 존재입니다.<br>'
	    		+ '<br>'
	    		+ '지금 바로 I\'MSURE의 생명보험 추천 서비스를 통해서 자신에게 맞는 적절한 보험을 찾아보세요!'
	    		+ '    </p>'
	    		+ '	   <span class="time_date">'+time+'</span>'
	    		+ '  </div>'
	    		+ '</div>'

	    $('.mesgs').append(tag);
		$('.modal-body').scrollTop($('.modal-body')[0].scrollHeight);
	});
	$('#three').click(function(event){
		event.preventDefault();
		
		//현재 시간
		var d = new Date();
		time = formatAMPM(d);
		
		var tag = '<div class="outgoing_msg">'
    			+ '  <div class="sent_msg">'
    			+ '	   <p>보험 추천은 어떻게 이루어 지나요?</p>'
    			+ '    <span class="time_date" style="float: right;">'+time+'</span>'
    			+ '  </div>'
    			+ '</div>'
    			+ '<div class="received_msg">'
    			+ '  <div class="received_with_msg">'
    			+ '    <p>'
    			+ 'I\'MSURE는 2가지 방식으로 생명보험을 추천합니다.<br>'
    			+ '심리 지표를 이용한 추천은 성격검사를 통해 외향성,친화성,성실성,신경성,개방성을 점수로 나타냅니다.<br>'
    			+ '점수를 바탕으로 자신에게 맞는 생명보험 상품을 추천해 드립니다.<br>'
    			+ '인구통계 지표를 이용한 추천은 나와 비슷한 나이,성별,소득을 가진 사람은 어떤 생명보험에 가입했는지 보여주며,<br>'
    			+ '자신의 인구통계 특성에 따라 가장 필요한 생명보험 상품을 추천해 드립니다.<br>'
    			+ '<br>'
    			+ '지금 바로 I\'MSURE의 생명보험 추천 서비스를 통해서 자신에게 맞는 적절한 보험을 찾아보세요!'
    			+ '    </p>'
    			+ '	   <span class="time_date">'+time+'</span>'
    			+ '  </div>'
    			+ '</div>'

    	$('.mesgs').append(tag);
		$('.modal-body').scrollTop($('.modal-body')[0].scrollHeight);
	});
});

//보험 상세보기를 위한 ajax
$('.modal-content').on('click','#send',function(event) {
	//에코통신
	$.ajax({
		type : "post",
		url : "/user/send-message",
		data : JSON.stringify({
			"message" : $('#chat').val()
		}),
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			//현재 시간
			var d = new Date();
			time = formatAMPM(d);
			//보내는 메시지 내용 입력
			var tag = '<div class="outgoing_msg">'
				    + '  <div class="sent_msg">'
					+ '	   <p>'+$('#chat').val()+'</p>'
					+ '    <span class="time_date" style="float: right;">'+time+'</span>'
					+ '  </div>'
					+ '</div>'
					
			$('.mesgs').append(tag);
			$('#chat').val("");
			$('.modal-body').scrollTop($('.modal-body')[0].scrollHeight);
        },
		success : function(data, status, xhr) {
			//현재 시간
			var d = new Date();
			time = formatAMPM(d);
			//전달받은 메시지 내용 입력
			var tag = '<div class="received_msg">'
					+ '  <div class="received_with_msg">'
					+ '    <p>'+data.message+'</p>'
					+ '	   <span class="time_date">'+time+'</span>'
					+ '  </div>'
					+ '</div>'

			$('.mesgs').append(tag);
			$('.modal-body').scrollTop($('.modal-body')[0].scrollHeight);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert(jqXHR.responseText);
		}
	});
});