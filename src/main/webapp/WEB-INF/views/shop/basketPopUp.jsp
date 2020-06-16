<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
</head>
<style>
.font{
	padding: 10px;
    color: #333;
    font-size: 15px;
    font-weight: 600;
    letter-spacing: -1px;
    line-height: 24px;
    text-align: center;
    font-family: 'mgb';
}

.btn_1{
display: inline-block;
    background-color: #444 !important;
    height: 42px;
    padding: 0 30px;
    border: none;
    color: #fff;
    font-size: 13px;
    line-height: 43px;
    font-weight: 500;
    text-align: center;
    vertical-align: middle;
    box-sizing: border-box;
    cursor: pointer;
}

.btn_2{
	display: inline-block;
    height: 44px;
    padding: 0 28px;
    border: 1px solid #666 !important;
    background-color: #fff;
    color: #333;
    font-size: 13px;
    line-height: 43px;
    font-weight: 500;
    text-align: center;
    vertical-align: middle;
    box-sizing: border-box;
    cursor: pointer;
}
</style>
<body>
<div align="center">
<table>
	<tr>
		<p class="font">선택한 상품이 장바구니에 담겼습니다.</p>
	</tr>
	<tr>
		<td><img src="/stu/img/장바구니.png" height="84px" ></td>
	</tr>
</table>
	<span class="btn_1" onClick="cart_close();">쇼핑계속하기</span>
 <span class="btn_2" onClick="go_cart();">장바구니 바로가기</span> 
</div>

<form id="commonForm" name="commonForm"></form>
</body>
</html>

<script>


 function go_cart(){
	opener.location.href="/stu/basket/basketList.do";
	close();
}
 
function cart_close(){
	close();
}
</script>