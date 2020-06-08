<%-- </script>
<script language="javascript"> 


//글자수 제한 체크 
function fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
	one_char = str.charAt(i);
	if(escape(one_char).length > 4){
	    rbyte += 2;                                         //한글2Byte
	}else{
    	rbyte++;                                            //영문 등 나머지 1Byte
	}

	if(rbyte <= maxByte){
	    rlen = i+1;                                          //return할 문자열 갯수
	}
}

	if(rbyte > maxByte){
    	alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
    	str2 = str.substr(0,rlen);                                  //문자열 자르기
    	obj.value = str2;
    	fnChkByte(obj, maxByte);
	}else{
    	document.getElementById('byteInfo').innerText = rbyte;
	}
}

 
</script>

	      	 <!-- 글자 수 제한 -->
	      	 <textarea name="commentt" style="width: 885px; height: 55px;"onKeyUp="javascript:fnChkByte(this,'200')"></textarea>
	      		<button type="button" class="btn1 btn-primary1" onclick="onComment()">입력	</button>
	      		<div style="margin-bottom:10px;"><br/>&nbsp;&nbsp;&nbsp;<span id="byteInfo">0</span>/200Byte</div>
	      	 </c:if>
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function onDelete() {
		if (confirm("정말로 1:1문의를 삭제하시겠습니까?") == true) {
			alert("1:1문의가 삭제되었습니다.");
			location.href = 'qnaDelete?qna_num=${qnaModel.qna_num}';
		} else {
			return;
		}
	}
	function onModify() {
		location.href = 'qnaModifyForm?qna_num=${qnaModel.qna_num}';
	};
	function cmmDelete() {
		if (confirm("정말로 답변글을 삭제하시겠습니까?") == true) {
			alert("답변글이 삭제되었습니다.");
			location.href = 'qnaCommDelete?qna_num=${qnaModel.qna_num}&comment_num=${qnaCommModel.comment_num}';
		} else {
			return;
		}
	}
</script>
<style>
p {
	display: inline-block;
}

#regdate {
	float: right;
}
</style>
</head>
<body>
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="./index.jsp">Home</a></li>
					<li>고객센터</li>
					<li class="active">1:1문의</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<div class="container">
		<div class="register-top heading">
			<br> <br>
			<h2>1:1 문의</h2>
		</div>
		<ul class="pager">
			<li class="next"><a href="./qnaList">목록</a></li>
		</ul>
		<!-- 문의글 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<p>${qnaModel.subject }</p>
				<p id="regdate">
					<fmt:formatDate value="${qnaModel.regdate }" pattern="yyyy-MM-dd" />
				</p>
			</div>
			<div class="panel-body" style="min-height: 200px">
				<br>${qnaModel.content }<br> <br>
			</div>
		</div>
		<!-- 답변 리스트 -->
		<c:if test="${null ne qnaCommModel.content}">
			<div class="panel panel-info">
				<div class="panel-heading">
					<p>답변입니다.</p>
					<p id="regdate">
						<fmt:formatDate value="${qnaCommModel.regdate }"
							pattern="yyyy-MM-dd" />
					</p>
				</div>
				<div class="panel-body">${qnaCommModel.content }
					<c:if test="${session_id == 'admin'}">
						<button type="button" class="btn btn-info" onclick="cmmDelete()">삭제</button>
					</c:if>
				</div>
			</div>
		</c:if>
		<c:if test="${null eq qnaCommModel.content}">
		</c:if>
		<!-- 답변 쓰기 -->
		<form:form commandName="QnA" action="./qnaCommWrite" method="post"
			class="form-horizontal">
			<form:input type="hidden" path="qna_num" value="${qnaModel.qna_num}" />
			<c:if test="${session_id == 'admin' && null eq qnaCommModel.content}">
				<div style="padding-left: 20px">
					<div class="col-sm-12 form-group">
						<div class="form-group">
							<label for="comment">답변쓰기</label>
							<form:textarea class="form-control" rows="2" path="content"
								required="required"></form:textarea>
						</div>
						<div class="form-group">
							<div class="col-sm-12" style="text-align: right;">
								<button type="submit" class="btn btn-info">등록</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</form:form>
		<!-- 회원:문의글 수정/삭제 -->
		<c:if test="${session_id != 'admin' }">
			<button type="button" class="btn btn-info" onclick="onModify()">수정</button>
			<button type="button" class="btn btn-info" onclick="onDelete()">삭제</button>
		</c:if>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>