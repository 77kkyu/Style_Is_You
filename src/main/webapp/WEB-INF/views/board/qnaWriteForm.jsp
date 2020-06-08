<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<form:form commandName="qnaModel" action="./qnaWrite" method="post"
			class="form-horizontal">
			<form:hidden path="id" value="${memberModel.id }" />
			<form:hidden path="name" value="${memberModel.name }" />
			<form:hidden path="phone" value="${memberModel.phone }" />
			<form:hidden path="email" value="${memberModel.email }" />
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">이름:</label>
				<div class="col-sm-8">
					<p class="form-control-static">${memberModel.name }</p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">연락처:</label>
				<div class="col-sm-8">
					<p class="form-control-static">${memberModel.phone }</p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email:</label>
				<div class="col-sm-8">
					<p class="form-control-static">${memberModel.email }</p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sel1">상품 선택:</label>
				<div class="col-sm-8">
					<select class="form-control" id="sel1" name='order_goods_name'
						onchange="this.form.order_goods_name.value=this.value">
						<c:forEach var="list" items="${orderList}">
							<option value="${list.order_goods_name}">${list.order_goods_name}</option>
						</c:forEach>
					</select>
				</div>
				<br>
			</div>
			<input type=hidden value='' name='order_goods_name'>
			<div class="form-group">
				<label class="control-label col-sm-2">문의제목:</label>
				<div class="col-sm-8">
					<form:input path="subject" class="form-control" id="focusedInput"
						required="required" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">문의내용:</label>
				<div class="col-sm-8">
					<form:textarea path="content" class="form-control" rows="15"
						required="required"></form:textarea>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-10" style="text-align: right;">
					<button type="submit" class="btn btn-info">문의하기</button>
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