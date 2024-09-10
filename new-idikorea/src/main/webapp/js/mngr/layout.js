$( function(){
	$('.datepick').each(function(){
		$(this).datepicker();
	});

	$('.monthpick').each(function(){
		$(this).monthpicker();
	});

	$('.yearpicker').each(function(){
		$(this).yearpicker();
	});

	// 시작 종료날짜 체크
	$('.sdate').change(function(){
		let startDate = $('.sdate').val();
		$('.edate').datepicker('option', 'minDate', startDate);
	})

	$('.edate').change(function(){
		let endDate = $('.edate').val();
		$('.sdate').datepicker('option', 'maxDate', endDate);
	});

	// 이메일 직접입력 또는 선택
	$('.prevval').on('change', function(){
		if( $(this).val().length == 0 ){
			$(this).prev().attr('readonly', false);
			$(this).prev().val('');
			$(this).prev().focus();
		} else {
			$(this).prev().attr('readonly', true);
			$(this).prev().val( $(this).val() );
		}
	});
});

// 숫자 콤마 추가
function numericCommas(number){
	return number.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
}

// 쇼핑몰 형제 tr
function nextTR(target){
	if( $(target).parent().parent().next('tr').css('display') == 'none' ){
		$(target).text('닫기');
		$(target).parent().parent().next('tr').css('display', 'table-row');
	} else {
		$(target).text('보기');
		$(target).parent().parent().next('tr').css('display', 'none');
	}
};

// 전체선택
function selectAll(selectAll, class_name){
	const checkboxes=document.querySelectorAll('input.' + class_name);
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	})
}

// 추가컨텐츠 삭제
function del_article(button){
	$(button).parent().parent().remove();
}

// 추가첨부사진
function add_photo(){
	var html =
		`<tr class="photo">
			<th>
				추가첨부사진
				<button type="button" onclick="del_article(this);">삭제</button>
			</th>
			<td colspan="3">
				<ul>
					<li>
					<div class="preview" style="width:300px; margin-bottom: 6px;"></div>
						<div class="attachWrap">
							<input type="file" name="imageFiles" accept=".png, .jpg, .gif">
							<input type="text" class="attachFileView" style="width: 433px;" readonly>
							<button type="button" class="attachFile">파일첨부</button>
							<button type="button" class="attachFileReset">첨부삭제</button>
						</div>
						<input type="text" class="photoContent" placeholder="사진에 대한 구체적인 설명을 입력해 주세요." style="width: 510px; margin-top: 6px;">
						<ul class="advice">
							<li>사진 첨부 시, 사진에 대한 설명은 필수 입력 항목입니다.</li>
							<li>png, jpg, gif 확장자만 지원합니다.</li>
						</ul>
					</li>
				</ul>
			</td>
		</tr>`;
	$('.photo').last().after(html);
}

// 추가유튜브
function add_youtube(){
	var html =
		`<tr class="youtube">
			<th>
				추가유튜브링크
				<button type="button" onclick="del_article(this);">삭제</button>
			</th>
			<td colspan="3">
				<input type="text" class="linkLink" style="width: 510px;" placeholder="공유 클릭 후 나오는 퍼가기 주소를 복사하여 붙여 넣으세요.">
				<div style="margin-top: 6px;">
					<textarea class="linkContent" rows="5" cols="50" placeholder="영상 설명 또는 음성 내용(자막) 등 구체적인 내용을 입력해 주세요." required></textarea>
					<ul class="advice">
						<li>유튜브링크 첨부 시, 영상에 대한 설명은 필수 입력 항목입니다.</li>
					</ul>
				</div>
				<input type="hidden" class="linkOrder">
			</td>
		</tr>`;
	$('.youtube').last().after(html);
}

// 추가영상
function add_video(){
	var html =
		`<tr class="video">
			<th>
				추가영상
				<button type="button" onclick="del_article(this);">삭제</button>
			</th>
			<td colspan="3">
				<div class="attachWrap">
					<input type="file" name="videoFiles" accept=".mp4">
					<input type="text" class="attachFileView" style="width: 433px;" readonly>
					<button type="button" class="attachFile">파일첨부</button>
					<button type="button" class="attachFileReset">첨부삭제</button>
				</div>
				<ul class="advice">
					<li>mp4 확장자만 지원합니다.</li>
				</ul>
				<div style="margin-top: 6px;">
					<textarea class="videoContent" rows="5" cols="50" placeholder="영상 설명 또는 음성 내용(자막) 등 구체적인 내용을 입력해 주세요." required></textarea>
					<ul class="advice">
						<li>영상 첨부 시, 영상에 대한 설명은 필수 입력 항목입니다.</li>
					</ul>
				</div>
			</td>
		</tr>`;
	$('.video').last().after(html);
}

// 데이터피커 비우기
$(document).on('click', 'button.clear_date', function(){
	$(this).prev('input').val('');
});

// QR코드 생성
function QRGenerator(target, idx, name, width_size, height_size){
	var json = '{"idx":' + idx + ',"name":"' + name + '"}';
	var qrcode = new QRCode(document.getElementById(target), {
		render: 'image',
		ecLevel: 'H',
		text: json,
		width: width_size,
		height: height_size,
		colorDark : "#000000",
		colorLight : "#ffffff",
		correctLevel : QRCode.CorrectLevel.H
	});
}

// 타켓 클릭
function target_click(target){
	$(target).click();
}

// 숨김 컨텐츠 표시
function dp_content(display_target, none_target, css_type){
	$(none_target).css('display', 'none');
	$(display_target).css('display', css_type);
}

// 같은 타켓 클릭 시 컨텐츠 표시 / 비표시 토클
function dp_content_toggle(target, content, css_type){
	if( $(target).is(':checked') ){
		$(content).css('display', css_type);
	} else {
		$(content).css('display', 'none');
	};
}

// 컨텐츠 도움말 열기/닫기
$(document).on('click', '.openerContentAdvice', function(){
	$(this).parent().next().css('left', $(this).position().left - 15 + 'px');
	$(this).parent().next().toggle();
});

// 컨텐츠 도움말 닫기
$(document).on('click', '.closeContentAdvice', function(){
	$(this).parent().hide();
});

// 사이드메뉴 열기/닫기
$(document).on('click', '.openerSideMenu', function(){

	// 사이드메뉴 보이기/숨김처리
	$('div.middleArea div.sideMenu').toggle();
	if($('div.middleArea div.sideMenu').is(':visible')){
		$('.openerSideMenu').html('<i class="fa fa-chevron-left" aria-hidden="true"></i>');
	} else {
		$('.openerSideMenu').html('<i class="fa fa-chevron-right" aria-hidden="true"></i>');
	}

	// 페이지타이틀 영역 크기 조정
	$('div.middleArea div.pageContent').toggleClass('toggle');

	// 사이드메뉴 열기/닫기 버튼 위치
	$('div.middleArea div.pageContent button.openerSideMenu').toggleClass('toggle');

	// 페이지위치
	$('div.middleArea div.pageContent div.contentTitle').toggleClass('toggle');
});

// 사이드메뉴 2차메뉴 이동, 3차메뉴 열기/닫기
$(document).on('click','div.sideMenu dl > dd > a', function(e){

	if($(this).next().length > 0){
		e.preventDefault();
		if($(this).next('ul').is(':hidden')){
			$('div.sideMenu dl dd ul').slideUp('fast');
		}

		$(this).next('ul').slideToggle('fast', function(){
			$(this).next('ul').show();
		});
	}
});

// 레이어 열기
function openlayer(title, content, target){
	var layer =
	'<div class="layerWrap">' +
	'	<div class="layer"></div>' +
	'	<div class="layerWindow">' +
	'		<div class="layerTitle">' +
	'			<h2>' + title + '</h2>' +
	'			<button type="button" class="closelayer">닫기</button>' +
	'		</div>' +
	'		<div class="layerContent">' + content + '</div>' +
	'	</div>' +
	'</div>';

	$(target).after(layer);
	$('body').css('overflow', 'hidden');
};

function openlayer_width(title, content, target, width){
	var layer =
	'<div class="layerWrap">' +
	'	<div class="layer"></div>' +
	'	<div class="layerWindow" style="width: ' + width + 'px; margin-left: ' + (width / 2) * -1 + 'px">' +
	'		<div class="layerTitle">' +
	'			<h2>' + title + '</h2>' +
	'			<button type="button" class="closelayer">닫기</button>' +
	'		</div>' +
	'		<div class="layerContent">' + content + '</div>' +
	'	</div>' +
	'</div>';

	$(target).after(layer);
	$('body').css('overflow', 'hidden');
}

// 레이어 닫기
$(document).on('click', '.layer, .closelayer', function(){
	$('.layerWrap').remove();
	$('body').css('overflow', 'visible');
});

// 8자리 날짜 형식변환
function dateFormatter(dateNum){
	var returnDateNum = dateNum.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
	return returnDateNum;
};

// 새창 윈도우 팝업
function openWindow(url, name, width, height){
	window.open(url, name, 'top=0, left=0, width=' + width + ', height=' + height + ', scrollbars=yes, resizable=yes');
}

// 8자리 날짜유효성체크
function isValidDate(dateStr){
	var returnMessage = '';
	var year = Number(dateStr.substr(0,4));
	var month = Number(dateStr.substr(4,2));
	var day = Number(dateStr.substr(6,2));
	var today = new Date();
	var yearNow = today.getFullYear();
	// var adultYear = yearNow - 20;
	if ( month < 1 || month > 12 ){
		returnMessage = '달은 1 ~ 12까지 입력 가능합니다.';
	} else if( day < 1 || day > 31 ){
		returnMessage = '일은 1 ~ 31까지 입력 가능합니다.';
	} else if( (month == 4 || month == 6 || month == 9 || month == 11) && day == 31 ){
		returnMessage = month + '월은 31일이 없습니다.';
	} else if( month == 2 ){
		var isleap = ( year % 4 == 0 && ( year % 100 != 0 || year % 400 == 0) );
		if( day > 29 || ( day == 29 && !isleap ) ){
			returnMessage = year + '년 2월은 ' + day + '일이 없습니다.';
		}
	}
	// if ( year < 1900 || year > adultYear ){ returnMessage = adultYear + '년생 이전 출생자 중 20세 이상만 가입 가능합니다.'; }
	return returnMessage;
};

// 전화번호 형식변환
function phoneFormatter(phoneNum){
	var returnPhoneNum = phoneNum.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
	return returnPhoneNum;
};

// 영문숫자입력 유효성검사
function isValidEngNum(str){
	var regular = /^[A-Za-z0-9+]*$/;
	if( regular.test(str) ){ return true; } else { return false; };
};

// 공백 유효성검사
function isValidSpace(str){
	if(str.search(/\s/) != -1){ return true; } else { return false; };
}

// 패스워드 유효성검사 - 영문,숫자,특수문자 혼합 8자리~20자리
function isValidPassword(str){
	var resNum = str.search(/[0-9]/g);
	var resEng = str.search(/[a-z]/ig);
	var resSpe = str.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	var returnMessage = '';

	if(str.length < 8 || str.length > 21){
		returnMessage = '패스워드는 8자리 이상 20자리 미만입니다.';
	} else if(isValidSpace(str)){
		returnMessage = '패스워드는 공백을 입력할 수 없습니다.';
	} else if(resNum < 0 || resEng < 0 || resSpe < 0 ){
		returnMessage = '패스워드는 영문, 숫자, 특수문자가 모두 포함되어야 합니다.';
	}
	return returnMessage;
}

// 첨부파일 확장자 유효성검사
function validate_AttachImage(fieldName, attachFileVal, checkExtArray){
	var attachFileExt = attachFileVal.split('.').pop().toLowerCase();
	if( $.inArray( attachFileExt, checkExtArray ) == -1 ){
		alert( fieldName + '의 첨부 가능한 파일의 확장자는 ' + checkExtArray.join(', ').toUpperCase() + ' 입니다.');
		return 'false';
	}
}

// 첨부파일
$(document).on('click', 'div.attachWrap button.attachFile, input.attachFileView', function(){
	$(this).siblings('input[type="file"]').click();
});

$(document).on('change', 'div.attachWrap input[type="file"]', function(){
	// $(this).siblings('input[type="text"]').val( $(this).val() );
	var names = [];
	for (var i = 0; i < $(this).get(0).files.length; ++i){
		names.push($(this).get(0).files[i].name);
	}
	// $(this).siblings('input[type="text"]').val( names );
	$(this).next('input[type="text"]').val( names );
});

$(document).on('click', 'div.attachWrap button.attachFileReset', function(){
	$(this).siblings('input').val('');
});

// datepicker
$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
	prevText: '이전 달',
	nextText: '다음 달',
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	showMonthAfterYear: true,
	yearSuffix: '년',
	changeYear: true,
	changeMonth: true,
	yearRange: 'c-100:c+2'
});

// monthpicker
$.monthpicker.setDefaults({
	dateFormat: 'yy-mm',
	prevText: '이전 년',
	nextText: '다음 년',
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	changeYear: true,
	changeMonth: true,
	yearRange: 'c-200:c'
});

// 페이징(화면에 표시할 페이징 수, 총 페이지 수, 현재 페이지 번호)
function paging(functionName, viewpagingCount, totalPage, currentPageNum){

	// 페이지블럭 내 첫페이지번호
	var firstNumberInPageBlock = 1;
	if(currentPageNum % viewpagingCount != 0){
		firstNumberInPageBlock = Math.floor(currentPageNum / viewpagingCount) * viewpagingCount + 1
	} else {
		firstNumberInPageBlock = (Math.floor(currentPageNum / viewpagingCount) -1) * viewpagingCount + 1;
	}

	// 페이지블럭 내 마지막페이지번호
	var lastNumberInPageBlock = firstNumberInPageBlock + viewpagingCount - 1;
	if(lastNumberInPageBlock > totalPage){ lastNumberInPageBlock = totalPage; };

	html = '';
	html += '<ul class="clearFix">';

	if(currentPageNum > 1){
		html += '<li class="pagingBlock">';
		html += '	<a href="./" onclick="' + functionName + '(1); event.preventDefault();" class="paging" title="첫 페이지로 이동"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>';
		html += '</li>';
	}

	if(currentPageNum > 1){
		html += '<li class="pagingPrev">';
		html += '	<a href="./" onclick="' + functionName + '(' + (currentPageNum - 1) + '); event.preventDefault();" class="paging" title="이전 페이지로 이동"><i class="fa fa-angle-left" aria-hidden="true"></i></a>';
		html += '</li>';
	}

	for(var i = firstNumberInPageBlock; i <= lastNumberInPageBlock; i++){
		html += '<li>';
			if( i == currentPageNum ){
				html += '<strong>' + i + '</strong>';
			} else{
				html += '<a href="./" onclick="' + functionName + '(' + i + '); event.preventDefault();" class="paging" title="' + i + ' 페이지로 이동">' + i + '</a>';
			}
		html += '</li>';
	}

	if(currentPageNum < totalPage){
		html += '<li class="pagingNext">';
		html += '	<a href="./" onclick="' + functionName + '(' + (currentPageNum + 1) + '); event.preventDefault();" class="paging" title="다음 페이지로 이동"><i class="fa fa-angle-right" aria-hidden="true"></i></a>';
		html += '</li>';
	}

	if(currentPageNum < totalPage){
		html += '<li class="pagingBlock">';
		html += '	<a href="./" onclick="' + functionName + '(' + totalPage + '); event.preventDefault();" class="paging" title="끝 페이지로 이동"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>';
		html += '</li>';
	}

	html += '</ul>';
	return html;
};

// 주소검색
//var geocoder = new kakao.maps.services.Geocoder();
function execDaumPostcode(zipcode, address){
	new daum.Postcode({
		oncomplete: function(data){
			$('#' + zipcode).val(data.zonecode);
			$('#' + address).val(data.roadAddress);
			// var juso =  data.roadAddress;
			// geocoder.addressSearch(juso, callback);
		}
	}).open();
}

var callback = function(result, status){
	if (status === kakao.maps.services.Status.OK){
		$("#lat").val(result[0].y);
		$("#lng").val(result[0].x);
	}
};

// 숫자앞 자리수 0 추가하기
function fillZero(criNum, fillNum, str){
	return str.length > criNum ? str : new Array(fillNum - str.length + 1).join('0') + str;
}

// 날짜 형식 리턴
function getDay(reqDate){
	var reqDateYear = reqDate.getFullYear();
	var reqDateMonthStr = (reqDate.getMonth() + 1) + '';
	var reqDateMonth = fillZero(10, 2, reqDateMonthStr);
	var reqDateDayStr = (reqDate.getDate()) + '';
	var reqDateDay = fillZero(10, 2, reqDateDayStr);
	return reqDateYear + '-' + reqDateMonth + '-' + reqDateDay;
}

// 오늘 날짜 리턴
function getToday(sDate, eDate){
	var today = new Date();
	$('input[name=' + sDate + ']').val(getDay(today));
	$('input[name=' + eDate + ']').val(getDay(today));
}

// 오늘 날짜 기준 기간 리턴
function getPeriod(sDate, eDate, num){
	if(num != 0){
	var today = new Date();
	$('input[name=' + eDate + ']').val(getDay(today));
	today.setDate(today.getDate() - num);
	$('input[name=' + sDate + ']').val(getDay(today));
	} else {
		$('input[name=' + sDate + ']').val('');
		$('input[name=' + eDate + ']').val('');
	}
}

// 텝메뉴 추가
function viewTabmenu(hidden_contents, visible_content, display_Value, target){
	$(target).siblings().removeClass('active');
	$(target).addClass('active');
	$(hidden_contents).css('display','none');
	$(visible_content).css('display', display_Value);
}

// 테이블바디 숨김/보임 처리
function tbodyDisplay(button_name, target){
	if($(target).css('display') == 'none'){
		$(button_name).text('상세숨김');
		$(target).css('display', 'table-row-group');
	} else {
		$(button_name).text('상세보기');
		$(target).css('display', 'none');
	}
}

// 이미지확대
function img_exp(_this, min, max){
	$(_this).text($(_this).text() == '확대' ? '축소' : '확대');
	var target = $(_this).prev('img');
	target.css('width', target.outerWidth() == min ? max + 'px' : min + 'px');
}

// sortable 중복 실행
function sortableExe(target){
	$(target).sortable();
	$(target).disableSelection();
}

// 쇼핑몰 적립금 토글
function saved_money(target, value){
	$(target).attr('readonly', value);
}

// 쇼핑몰 옵션 활성화 비활성화
function disableOption(common_class, disable_items, checked_target){
	$(common_class).prop('disabled', false); // 초기화
	$(disable_items).prop('disabled', true);
	$(checked_target).click();
}

// 타이니에디터 세팅(가장 아래 세팅)
tinymce.init({
	language: "ko_KR", //한글판으로 변경
	selector: '.editor textarea',
	height: 400,
	menubar: false,
	plugins: 'lists image media table code quickbars',
	toolbar: "blocks fontfamily fontsize bold italic underline strikethrough forecolor backcolor align numlist bullist lineheight outdent indent image media table code",
});