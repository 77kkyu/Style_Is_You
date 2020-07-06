<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>



<!DOCTYPE html>
<html>
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상품등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<head>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

</head>
<style>
@CHARSET "UTF-8";

a:link, a:visited {text-decoration: none; color: #656565;}

.board_list {width:100%;border-top:2px solid #252525;border-bottom:1px solid #ccc}
.board_list thead th:first-child{background-image:none}
.board_list thead th {border-bottom:1px solid #ccc;padding:12px 0 13px 0;color:#3b3a3a;vertical-align:middle}
.board_list tbody td {border-top:1px solid #ccc;padding:10px 0;text-align:center;vertical-align:middle}
.board_list tbody tr:first-child td {border:none}
.board_list tbody td.title {text-align:left; padding-left:20px}
.board_list tbody td a {display:inline-block}

.board_view {width:50%;border-top:2px solid #252525;border-bottom:1px solid #ccc}
.board_view tbody th {text-align:left;background:#f7f7f7;color:#3b3a3a}
.board_view tbody th.list_tit {font-size:13px;color:#000;letter-spacing:0.1px}
.board_view tbody .no_line_b th, .board_view tbody .no_line_b td {border-bottom:none}
.board_view tbody th, .board_view tbody td {padding:15px 0 16px 16px;border-bottom:1px solid #ccc}
.board_view tbody td.view_text {border-top:1px solid #ccc; border-bottom:1px solid #ccc;padding:45px 18px 45px 18px}
.board_view tbody th.th_file {padding:0 0 0 15px; vertical-align:middle}

.pad_5 {padding: 5px;}
.wdp_90 {width:90%}
.btn {border-radius:3px;padding:5px 11px;color:#fff !important; display:inline-block; background-color:#6b9ab8; border:1px solid #56819d;vertical-align:middle}

a {
	text-decoration: none;
	color: #666;
}

h1 {
	text-align: center;
	padding: 50px 0;
	font-weight: normal;
	font-size: 2em;
	letter-spacing: 10px;
}
</style>
<body>

<br><br>
<div align="center">
<h2>${title}</h2>
</div>

<br><br>
<div align="center">
<form name="frm" id="frm" enctype="multipart/form-data" method="post">
		<table align="center" border="0">
				
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="REVIEW_TITLE" name="REVIEW_TITLE" placeholder="제목입력" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.REVIEW_TITLE}"</c:if>>
					</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" placeholder="작성자입력" size="40" 
						style="padding:10px;" value="${SESSION_NAME}" readonly>
					</td>
				</tr>
				
				
				<tr>
					<th>상품내용 </th>
					<td>
						<textarea rows="50" cols="250" id="REVIEW_CONTENT" name="REVIEW_CONTENT">
						<c:choose>
						<c:when test="${type eq 'modify'}">${map.REVIEW_CONTENT}</c:when>
						<c:otherwise>
						<pre>
※리뷰작성 시 최대 적립금 2,000원 지급!(50자 이상 리뷰 작성시)
(일반리뷰 500원 / 상품포토리뷰 1000 / 상품착용포토리뷰(키,몸무게,구매사이즈(컬러) '작성필수') 2,000원)

키(cm):
몸무게(kg):
구매사이즈(컬러):
상품리뷰:
						</pre>
						</c:otherwise>
						</c:choose>
						</textarea>
					</td>
				</tr>
				
				<tr>
					<th>개인정보 수집 및 이용 동의</th>
					<td>
						<textarea rows="15" cols="40" readonly>
						■ 
						개인정보의 수집·이용 목적
						서비스 제공 및 계약의 이행, 구매 및 대금결제, 
						물품배송 또는 청구지 발송, 회원관리 등을 위한 목적
						■ 
						수집하려는 개인정보의 항목
						이름, 주소, 연락처 등
						■
						개인정보의 보유 및 이용 기간
						회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당정보를 파기합니다.
						#개인정보의 위탁 처리STYLE IS YOU는 서비스 향상을 위해 관계법령에 따라 회원의 
						동의를 얻거나 관련 사항을 공개 또는 고지 후 회원의 개인정보를 외부에 위탁하여 처리하고 있습니다. 
						STYLE IS YOU의 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다. 
						- 수탁자 : (주)STYLE IS YOU- 위탁 업무 내용 : 카카오 알림톡 발송 업무 직송 등 일부 배송형태에 따라, 
						전자상거래소비자보호법 제 21조에 의거 협력사에 배송정보가 제공 됩니다.
						</textarea>
					</td>
				</tr>

				<input type="hidden" id="IDX" name="IDX" value="${IDX}"> 
				<input type="hidden" id="MEMBER_NO" name="MEMBER_NO" value="${SESSION_NO}">	
				<input type="hidden" id="MEMBER_NAME" name="MEMBER_NAME" value="${SESSION_NAME}">	
		</table>
	
	<br>	
	<div align="center">
	<a href="#this" class="btn" id="write" onClick="fn_chk()">작성하기</a>
	<!-- <a href="#this" class="btn" id="update" onClick="fn_chk()">수정하기</a> -->
	<a href="#this" class="btn" id="list">목록으로</a>
	</div>
</form>

</div>
<!-- commandForm  -->
<form id="commonForm" name="commonForm"></form>

<script type="text/javascript">

$(function(){
	CKEDITOR.replace('REVIEW_CONTENT',{
        width:'120%',
        height:'400px',
		filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileReviewUpload.do'

	});
});

	var gfv_count = 1;

// $(document).ready(function() 함수 또는 코드가 호출 또는 실행되는 시점을
// 스케쥴링할 수 있게 해준다. 그 시점은 바로 문서객체모델이라고 하는 DOM
// (Document Object Model)이 모두 로딩되었을 때인데 이렇게
// $(document).ready(function() 안에 위치한 코드를 DOM이 모두 준비된 이후에 
// 실행되게끔 해준다.
$(document).ready(function() {

	$("#list").on("click", function(e){//목록으로 버튼
		//html 에서 a 태그나 submit 태그는 고유의 동작이 있다. 
		//페이지를 이동시킨다거나 form 안에 있는 input 등을 전송한다던가 
		//그러한 동작이 있는데 e.preventDefault 는 그 동작을 중단시킨다.
		e.preventDefault(); 
		fn_openDetailList();	
	});

	$("#write").on("click", function(e){ //작성하기 버튼
		e.preventDefault();
		fn_insertReview();
	});

	$("#update").on("click", function(e){ //수정하기 버튼
		e.preventDefault();
		fn_updateReview();	
	});

	
	
});


function fn_openDetailList() {

	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsDetail.do' />");//이동할 url
	comSubmit.addParam("IDX", ${IDX});
	comSubmit.submit(); //전송
	
}

function fn_updateReview(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/shop/goodsModify.do' />");
	comSubmit.submit();
}

function fn_insertReview() { // 유효성체크

	var comSubmit = new ComSubmit("frm"); // 객체생성
	comSubmit.setUrl("<c:url value='/shop/insertReview.do' />"); // url설정

    // 게시글 제목 필요
    if(!$("#REVIEW_TITLE").val()){
        alert("제목를 입력해주세요.");
        $("#REVIEW_TITLE").focus();
        return false;
    }
	 	// 게시글 내용 필요
    if(CKEDITOR.instances.REVIEW_CONTENT.getData() =='' 
            || CKEDITOR.instances.REVIEW_CONTENT.getData().length ==0){
        alert("내용을 입력해주세요.");
        $("#REVIEW_CONTENT").focus();
        return false;
    }
	 	
 	
	comSubmit.submit();
	
}


</script>

</body>
</html>


