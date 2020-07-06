<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>



<!DOCTYPE html>
<html>
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상품문의등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<head>

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
<h2>상품문의</h2>
</div>

<br><br>
<div align="center">
<form name="frm" id="frm" method="post">
		<table align="center" border="0">
				
				<tr>
					<th></th>
					<td>
						<input type="text" id="GOODS_QNA_TITLE" name="GOODS_QNA_TITLE" placeholder="제목입력" size="60" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_QNA_TITLE}"</c:if>>
						<input type="radio" name="GOODS_QNA_SECRET" id="GOODS_QNA_SECRET" value="0" style="padding:10px;"> 공개
					    <input type="radio" name="GOODS_QNA_SECRET" id="GOODS_QNA_SECRET" value="1" style="padding:10px;" checked="checked"> 비공개
					</td>
				</tr>
				
				
				<tr>
					<th> </th>
					<td>
						<textarea rows="30" cols="100" id="GOODS_QNA_CONTENT" name="GOODS_QNA_CONTENT">
						<c:if test="${type eq 'modify'}">${map.GOODS_QNA_CONTENT}</c:if>
						</textarea>
					</td>
				</tr>
		</table>
						<input type="hidden" id="IDX" name="IDX" value="${IDX}">
						<input type="hidden" id="MEMBER_NO" name="MEMBER_NO" value="${SESSION_NO}">	
						<input type="hidden" id="MEMBER_NAME" name="MEMBER_NAME" value="${SESSION_NAME}">
	<br>	
</form>
</div>

<div align="center">
<a href="#this" class="btn" id="write" onClick="fn_chk()">작성하기</a>
<!-- <a href="#this" class="btn" id="update" onClick="fn_chk()"></a> -->
<a href="#this" class="btn" id="list">목록으로</a>
</div>

<!-- commandForm  -->
<form id="commonForm" name="commonForm"></form>

<script type="text/javascript">

$(function(){
	CKEDITOR.replace('GOODS_QNA_CONTENT',{
        width:'110%',
        height:'400px',
		//filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload.do'
        allowedContent:true,
    	toolbar :[['NewPage','Preview','Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','-',
    	'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Outdent','Indent','HorizontalRule','Link','Unlink','-',
    	'Find','Replace','SelectAll','Flash','Table','SpecialChar'],
    	'/',['Styles','Format','Font','FontSize','Undo','Redo'],['TextColor','BGColor'],['Cut','Copy','Paste','PasteText'],['Source']],

	});
});

	var gfv_count = 1;

$(document).ready(function() {

	$("#list").on("click", function(e){//목록으로 버튼
		//html 에서 a 태그나 submit 태그는 고유의 동작이 있다. 
		//페이지를 이동시킨다거나 form 안에 있는 input 등을 전송한다던가 
		//그러한 동작이 있는데 e.preventDefault 는 그 동작을 중단시킨다.
		e.preventDefault(); 
		fn_openGoodsDetail();	
	});

	$("#write").on("click", function(e){ //작성하기 버튼
		e.preventDefault();
		fn_insertGoodsQna();
	});

	$("#update").on("click", function(e){ //수정하기 버튼
		e.preventDefault();
		fn_updateGoodsQna();
	});

	
	
});


function fn_openGoodsDetail() {

	window.history.back();
	
}

function fn_updateGoodsQna(){
	var comSubmit = new ComSubmit("frm");
	//comSubmit.setUrl("<c:url value='/shop/goodsModify.do' />");
	comSubmit.submit();
}

function fn_insertGoodsQna() { // 유효성체크

	var comSubmit = new ComSubmit("frm"); // 객체생성
	comSubmit.setUrl("<c:url value='/shop/goodsQnaInsert.do' />"); // url설정

    // 게시글 제목 필요
    if(!$("#GOODS_QNA_TITLE").val()){
        alert("제목를 입력해주세요.");
        $("#GOODS_QNA_TITLE").focus();
        return false;
    }
	 	// 게시글 내용 필요
    if(CKEDITOR.instances.GOODS_QNA_CONTENT.getData() =='' 
            || CKEDITOR.instances.GOODS_QNA_CONTENT.getData().length ==0){
        alert("내용을 입력해주세요.");
        $("#GOODS_QNA_CONTENT").focus();
        return false;
    }
	 	
	comSubmit.submit();
	
}


</script>

</body>
</html>


