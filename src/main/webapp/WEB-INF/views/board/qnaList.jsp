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
<!-- <script type="text/javascript">
(isSearch)

</script> -->
<style type="text/css">
.paging {
	text-align: center;
	height: 32px;
	margin-top: 5px;
	margin-bottom: 15px;
}

.paging a, .paging strong {
	display: inline-block;
	width: 36px;
	height: 32px;
	line-height: 28px;
	font-size: 14px;
	border: 1px solid #e0e0e0;
	margin-left: 5px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	-moz-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
}

.paging a:first-child {
	margin-left: 0;
}

.paging strong {
	color: #fff;
	background: skyblue;
	border: 1px solid skyblue;
}

.paging .page_arw {
	font-size: 11px;
	line-height: 30px;
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
			<h2>1:1문의</h2>
			<br> <br>
		</div>
		<div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th style="width: 10%; text-align: center;">번호</th>
						<th style="width: 30%; text-align: center;">상품명</th>
						<th style="width: 30%; text-align: center;">제목</th>
						<th style="width: 20%; text-align: center;">등록일</th>
						<th style="width: 10%; text-align: center;">답변여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${qnaList}">
						<c:url var="viewURL" value="qnaView">
							<c:param name="qna_num" value="${list.qna_num}" />
							<c:param name="currentPage" value="${currentPage}" />
						</c:url>
						<tr>
							<td style="width: 10%; text-align: center;">${list.qna_num}</td>
							<td style="width: 30%; text-align: left;">${list.order_goods_name}</td>
							<td style="width: 30%; text-align: left;"><a
								href="${viewURL}">${list.subject}</a></td>
							<td style="width: 20%; text-align: center;"><fmt:formatDate
									value="${list.regdate}" pattern="YYYY-MM-dd" /></td>
							<td style="width: 10%; text-align: center;"><c:if
									test="${list.admin == 1 }">Yes</c:if> <c:if
									test="${list.admin == 0 }">No</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<c:if test="${fn:length(qnaList) le 0}">
				<br />
				<center>등록된 게시물이 없습니다</center>
				<br />
			</c:if>
		</div>
		<form>
			<a href="./qnaWriteForm" class="btn btn-info" role="button">문의쓰기</a>
			<div class="col-sm-offset-5 paging" style="display: inline;">${pagingHtml}</div>
			<button type="submit" class="btn btn-info" style="float: right;">
				<span class="glyphicon glyphicon-search"></span> 검색
			</button>
			<div class="col-xs-2" style="float: right;">
				<input type="text" class="form-control" name="isSearch"
					required="required"> <br>
			</div>
			<div style="float: right;">
				<label class="radio-inline"><input type="radio"
					name="searchNum" value="1" required="required">제목</label> <label
					class="radio-inline"><input type="radio" name="searchNum"
					value="2" required="required">내용</label>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>