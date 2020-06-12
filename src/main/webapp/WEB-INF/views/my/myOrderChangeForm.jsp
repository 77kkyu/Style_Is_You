<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>my주문상태</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

 <script>
 $(document).ready(function(){
		/* alert('동작함'); */
	});

 
function order_change(mem_no, order_no){
	var mem_no = mem_no;
	var order_no = order_no;
	
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/order_change.do' />");
	comSubmit.addParam("member_no", mem_no);
	comSubmit.addParam("order_no", order_no);
	comSubmit.submit();
}
 
	
function order_cancle(mem_no, order_no){
	var mem_no = mem_no;
	var order_no = order_no;
	
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/order_cancle.do' />");
	comSubmit.addParam("mem_no", mem_no);
	comSubmit.addParam("order_no", order_no);
	comSubmit.submit();
}
 
function order_ok(mem_no, order_no){
	alert("동작1");
	var mem_no = mem_no;
	var order_no = order_no;
	
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	
	if(confirm("수취확인 후 교환/환분/AS문의는 고객 게시판을 이용해 주시기 바랍니다.")){
	$.ajax({
		url: "/stu/order_ok.do",
		data : {"mem_no": mem_no, "order_no": order_no},
		type: "post",
		async:false,
		success : function(data){
		alert("수취확인이 완료되었습니다.");
		location.href = "/stu/myOrderList.do";
		}
	})
	}else{
	return;
	}
}

function order_qna(mem_no, order_no){
	var mem_no = mem_no;
	var order_no = order_no;
	alert("수취확인 후 교환/환불/AS는 상품문의 게시판에서 신청하셔야 합니다.");
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/board/qnaBoard.do' />");
	comSubmit.addParam("member_no", mem_no);
	comSubmit.addParam("order_no", order_no);
	comSubmit.submit();
}

</script>
 
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption> 글쓰기 </caption>
    </thead>
    <tbody>
        <form action="write_ok.jsp" method="post" encType="multiplart/form-data">
            <tr>
                <th>제목: </th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="subject" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="10" placeholder="내용을 입력하세요. " name="content" class="form-control"></textarea></td>
            </tr>
            <tr>
                <th>비밀번호: </th>
                <td><input type="password" placeholder="비밀번호를 입력하세요" class="form-control"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="등록" onclick="sendData()" class="pull-right"/>
                    <input type="button" value="reset" class="pull-left"/>
                    <input type="button" value="목록으로" class="pull-right" onclick="javascript:location.href='/stu/myOrderList.do'"/>
                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
