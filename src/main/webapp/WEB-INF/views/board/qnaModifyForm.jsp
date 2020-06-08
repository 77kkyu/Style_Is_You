<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function main() {
		if (confirm("메인페이지로 가시겠습니까?") == true) {
			location.href = 'main';
		} else {
			return;
		}
	}
</script>
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
			<h2>1:1 문의하기</h2>
			<br> <br>
		</div>
		<form:form commandName="qnaModel" action="./qnaModify" method="post"
			class="form-horizontal">
			<form:input type="hidden" path="qna_num"
				value="${qnaModel.qna_num}" />
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">이름:</label>
				<div class="col-sm-8">
					<p class="form-control-static">${qnaModel.name }</p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">연락처:</label>
				<div class="col-sm-8">
					<p class="form-control-static">${qnaModel.phone }</p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email:</label>
				<div class="col-sm-8">
					<p class="form-control-static">${qnaModel.email }</p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">상품 선택:</label>
				<div class="col-sm-8">
					<p class="form-control-static">
						<%-- ${qnaModel.order_goods_Name} --%>
					</p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">문의제목:</label>
				<div class="col-sm-8">
					<form:input class="form-control" type="text" path="subject"
						value="${qnaModel.subject}" required="requiered" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">문의내용:</label>
				<div class="col-sm-8">
					<form:textarea class="form-control" rows="20" path="content"
						value="${qnaModel.content}" required="requiered"></form:textarea>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-10" style="text-align: right;">
					<button type="submit" class="btn btn-info">수정하기</button>
					<button type="button" class="btn btn-default" onclick="main();">취소</button>
				</div>
			</div>
		</form:form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>