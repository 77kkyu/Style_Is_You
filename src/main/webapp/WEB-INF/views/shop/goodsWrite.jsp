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

.pad_5 {padding: 5px;}
.wdp_90 {width:90%}
.btn {border-radius:3px;padding:5px 11px;color:#fff !important; display:inline-block; background-color:#6b9ab8; border:1px solid #56819d;vertical-align:middle}
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
					<th>상품이름 </th>
					<td>
						<input type="text" id="GOODS_NAME" name="GOODS_NAME" placeholder="상품이름입력" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_NAME}"</c:if>>
					</td>
				</tr>
				
				
				<tr>
					<th>상품내용 </th>
					<td>
						<textarea rows="30" cols="100" id="GOODS_CONTENT" name="GOODS_CONTENT">
						<c:if test="${type eq 'modify'}">${map.GOODS_CONTENT}</c:if>
						</textarea>
					</td>
				</tr>

				<tr>
					<th>카테고리 </th>
					<td>
						<select name="GOODS_CATEGORY">
							<option value="outer">outer</option>
							<option value="top">top</option>
							<option value="one-piece">one-piece</option>
							<option value="bottom">bottom</option>
							<option value="acc">acc</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>상품원가 </th>
					<td>
						<input type="text" name="GOODS_ORIGIN_PRICE" id="GOODS_ORIGIN_PRICE" placeholder="상품원가" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_ORIGIN_PRICE}"</c:if>> 
					</td>
				</tr>
				
				<tr>
					<th>상품할인가 </th>
					<td>
						<input type="text" name="GOODS_SALE_PRICE" id="GOODS_SALE_PRICE" placeholder="상품할인가" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_SALE_PRICE}"</c:if>>
					</td>
				</tr>
				
				<tr>
					<th>상품판매가 </th>
					<td>
						<input type="text" name="GOODS_SELL_PRICE" id="GOODS_SELL_PRICE" placeholder="상품판매가" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_SELL_PRICE}"</c:if>>
					</td>
				</tr>
				
				<tr>
					<th>키워드 </th>
					<td>
						<input type="text" name="GOODS_KEYWORD" id="GOODS_KEYWORD" placeholder="키워드" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_KEYWORD}"</c:if>>
					</td>
				</tr>
				
				<tr>
					<th>PICK </th>
					<td>
						<input type="checkbox" name="PICK" id="PICK" value=" " style="padding:10px;"> 공백
						<input type="checkbox" name="PICK" id="PICK" value="BEST" style="padding:10px;"> BEST
						<input type="checkbox" name="PICK" id="PICK" value="MD PICK" style="padding:10px;"> MD PICK
						<input type="checkbox" name="PICK" id="PICK" value="MUSTHAVE" style="padding:10px;"> MUSTHAVE
						<input type="hidden" name="GOODS_PICK" id="GOODS_PICK" value="">
					</td>
				</tr>
				
				<tr>
					<th>상품사이즈 </th>
					<td>
						<input type="checkbox" name="SIZE" value="FREE" style="padding:10px;"> FREE
						<input type="checkbox" name="SIZE" value="S" style="padding:10px;"> S
						<input type="checkbox" name="SIZE" value="M" style="padding:10px;"> M
						<input type="checkbox" name="SIZE" value="L" style="padding:10px;"> L
						<input type="checkbox" name="SIZE" value="XL" style="padding:10px;"> XL
						<input type="hidden" name="GOODS_ATT_SIZE" id="GOODS_ATT_SIZE" value="">
					</td>
				</tr>
				
				<tr>
					<th>상품색상 </th>
					<td>
						<input type="text" name="GOODS_ATT_COLOR" id="GOODS_ATT_COLOR" placeholder="컬러" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">${map.GOODS_ATT_COLOR}</c:if>>
					</td>
				</tr>
				
				<tr>
					<th>상품수량 </th>
					<td>
					<input type="text" name="GOODS_ATT_AMOUNT" id="GOODS_ATT_AMOUNT" placeholder="상품수량" size="40" 
					style="padding:10px;" value=<c:if test="${type eq 'modify'}">${map.GOODS_ATT_AMOUNT}</c:if>>
					</td>
				</tr>
				<input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NO}"> 
		</table>
	
	<br>	
	<div align="center">
	<c:if test="${type eq 'write'}"><a href="#this" class="btn" id="write" onClick="fn_chk()">작성하기</a></c:if>
	<c:if test="${type eq 'modify'}"><a href="#this" class="btn" id="update" onClick="fn_chk()">수정하기</a></c:if>
	<a href="#this" class="btn" id="list">목록으로</a>
	</div>
</form>

</div>
<!-- commandForm  -->
<form id="commonForm" name="commonForm"></form>

<script type="text/javascript">

$(function(){
	CKEDITOR.replace('GOODS_CONTENT',{
        width:'120%',
        height:'400px',
		filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload.do'
			
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
		fn_openBoardList();	
	});

	$("#write").on("click", function(e){ //작성하기 버튼
		e.preventDefault();
		fn_insertBoard();
	});

	$("#update").on("click", function(e){ //수정하기 버튼
		e.preventDefault();
		fn_updateGoods();	
	});

	
	
});


function fn_openBoardList() {

	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");//이동할 url
	comSubmit.submit(); //전송
	
}

function fn_updateGoods(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/shop/goodsModify.do' />");
	comSubmit.submit();
}

function fn_insertBoard() { // 유효성체크

	var comSubmit = new ComSubmit("frm"); // 객체생성
	comSubmit.setUrl("<c:url value='/shop/goodsWrite.do' />"); // url설정

    // 게시글 제목 필요
    if(!$("#GOODS_NAME").val()){
        alert("제목를 입력해주세요.");
        $("#GOODS_NAME").focus();
        return false;
    }
	 	// 게시글 내용 필요
    if(CKEDITOR.instances.GOODS_CONTENT.getData() =='' 
            || CKEDITOR.instances.GOODS_CONTENT.getData().length ==0){
        alert("내용을 입력해주세요.");
        $("#GOODS_CONTENT").focus();
        return false;
    }
	 	
 	// 상품원가 
    if(!$("#GOODS_ORIGIN_PRICE").val()){
        alert("상품원가를 입력해주세요.");
        $("#GOODS_ORIGIN_PRICE").focus();
        return false;
    }
 	// 할인가
    if(!$("#GOODS_SALE_PRICE").val()){
        alert("상품할인가를 입력해주세요.");
        $("#GOODS_SALE_PRICE").focus();
        return false;
    }
 	// 판매가
    if(!$("#GOODS_SELL_PRICE").val()){
        alert("판매가를 입력해주세요.");
        $("#GOODS_SELL_PRICE").focus();
        return false;
    }
/*   	// PICK
     if(!$("#GOODS_PICK").val()){
        alert("PICK을 선택해주세요.");
        return false;
    }
 	// 사이즈
    if(!$("#GOODS_ATT_SIZE").val()){
        alert("상품사이즈를 선택해주세요.");
        return false;
    }  */ 
	 // 컬러
    if(!$("#GOODS_ATT_COLOR").val()){
        alert("상품컬러를 입력해주세요.");
        $("#GOODS_ATT_COLOR").focus();
        return false;
    }
	 // 상품 수량
    if(!$("#GOODS_ATT_AMOUNT").val()){
        alert("상품수량을 입력해주세요.");
        $("#GOODS_ATT_AMOUNT").focus();
        return false;
    }


	comSubmit.submit();
	
}

function fn_chk() {
	
	
	var obj = $("[name=PICK]");
	var chkArray = new Array(); //배열 선언

	$('input:checkbox[name=PICK]:checked').each(function() { //체크된 값을 가져옴
		chkArray.push(this.value);
	});
	$('#GOODS_PICK').val(chkArray);

	//alert($('#GOODS_PICK').val());

	
	var obj1 = $("[name=SIZE]");
	var chkArray1 = new Array(); //배열 선언

	$('input:checkbox[name=SIZE]:checked').each(function() { //체크된 값을 가져옴
		chkArray1.push(this.value);
	});
	$('#GOODS_ATT_SIZE').val(chkArray1);

	//alert($('#GOODS_ATT_SIZE').val());
		
}

</script>

</body>
</html>


