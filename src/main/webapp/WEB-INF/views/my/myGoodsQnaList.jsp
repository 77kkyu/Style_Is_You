<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri= "http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myUI.css'/>" />

<!-- json날짜형식 변환 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">

</head>
<style>
/* 상품문의 */
.board_list th {
	padding: 14px 0;
	background: url(/css/images/ico_board_th_bar.gif) no-repeat 0 center
		#f5f5f5;
	font-size: 14px;
	color: #666;
	font-weight: 400;
	/* text-align: center; */
}

.board_list {
	width: 70%;
	margin-top: 0px;
	background: #fff;
	font-size: 15px;
	line-height: 18px;
}

.board_list2 {
	width: 60%;
	margin-top: 0px;
	background: #fff;
	font-size: 15px;
	line-height: 18px;
}

.board_list2 .tit {
	background: #fff;
	font-size: 15px;
}

.board_list2 .tit td {
	position: relative;
	padding: 20px 0;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
}

.td {
	position: relative;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
	margin-left: 100px;
}


.align_left {
	text-align: left !important;
}

.board_list2 td.align_left {
	padding: 16px 110px;
}

.board_list td {
	padding: 16px 0;
	text-align: left; 
	border-bottom: 1px solid #e0e0e0;
	font-size: 14px;
	color: #444;
	vertical-align: top;
}

p.a {
	cursor: pointer;
}


body {
 /*  font-family: Verdana, Arial; */
  font-family: 'Open Sans', sans-serif;
}

a {
  text-decoration: none;
  color: #666;
  text-decoration:none
}

h1 {
    text-align: center;
    padding: 50px 0;
    font-weight: normal;
    font-size: 2em;
    letter-spacing: 10px;
}  

img {
	align:left;
}
p{
	align:center;
}

#mgq {
	/* width : 800px; */
	position: relative;
	top : -620px;
	left: 150px;

} 
</style>
<body>
<div class="container">
	<%@include file="/WEB-INF/tiles/mySide.jsp" %>
<div id="mgq" align="center">
<br/><br/><br/>
	<h2 align="center">나의 상품 Q&A</h2>
	<br/><br/>

	<%-- <table class="table table-striped">
		<colgroup>
			<col width="10%"/>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th colspan="2">문의상품</th>
				<th style="text-align:center">제목</th>
				<th style="text-align:center">작성일</th>
				<th style="text-align:center">답변</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table> --%>
	
	<table align="center" class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="15%"/>
			<col width="45%"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th colspan="2">문의상품</th>
				<th style="text-align:center">제목</th>
				<th style="text-align:center">작성일</th>
				<th style="text-align:center">답변</th>
			</tr>
		</thead>
		<tbody id="board_list1" name="board_list1">
		
		</tbody>
	</table>
	
</div>	
	<br>
	<div class="pageNumber" id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	
	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">

	$(document).ready(function(){
		fn_selectQnaList(1);
		$(".show1").click(function(){ //제목 
			console.log("토글실행", $(this).parent());
			$(this).next().toggle( 'slow' );
		});
	});
	
		function fn_selectQnaList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/my/myGoodsQnaList.do' />");
			comAjax.setCallback("fn_selectQnaListCallback");
			comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		
		function fn_selectQnaListCallback(data){
			var total = data.TOTAL;
			var body = $("#board_list1");
			body.empty();
			if(total == 0){
				var str = "<tr>" + "<td colspan='5'>등록된 게시물이 없습니다.</td>" + "</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectQnaList"
				};
				gfn_renderPaging(params);
				var str = "";
				$.each(data.list, function(key, value){
					var date = moment(value.GOODS_QNA_DATE).format("YYYY-MM-DD");
					var Level = value.GOODS_QNA_LEVEL;
					var Q= "<img src='/stu/img/ico_qna_q.png' align='left'>";
					var A= "<img src='/stu/img/ico_qna_a.png' align='left'>";
					if(Level == 1){ //답변 있음
						str += " <tr class='show1'> "
							+  " <td><img src='/stu/file/"+value.GOODS_THUMBNAIL+"' width='70px' height='70px'></td>"
							+  " <td><a href='/stu/shop/goodsDetail.do?IDX="+value.GOODS_NO +"' name='title'>" + value.GOODS_NAME + "</a></td>"
							+  " <td align='center'> "+value.GOODS_QNA_TITLE+"</td>"
							+  " <td align='center' > "+date+"</td>"
							+  " <td align='center'> <span class='btn btn-danger'>답변완료</span></td>"
							+  " </tr> "
							+  " <div> "
							+  " <tr id='hide' width='100%' bgcolor='#f1f3f5' style='display:none;'> "
							+  " <td colspan='5' style='padding:50px;' align='left'>"+Q+"&nbsp;"+value.GOODS_QNA_CONTENT 
							+  " <br><br><br> "+A+" &nbsp; <p>"+value.GOODS_QNA_AN+"</p> </td> "
							+  " </tr>"
							+  " </div> ";
							}else{ //답변 없음
							str += " <tr class='show1'> "
								+  " <td><img src='/stu/file/"+value.GOODS_THUMBNAIL+"' width='70px' height='70px'></td>"
								+  " <td><a href='/stu/shop/goodsDetail.do?IDX="+value.GOODS_NO +"' name='title'>" + value.GOODS_NAME + "</a></td>"
								+  " <td align='center'> "+value.GOODS_QNA_TITLE+"</td>"
								+  " <td align='center' > "+date+"</td>"
								+  " <td align='center'> <span class='btn btn-danger'>답변 준비중</span></td>"
								+  " </tr> "
								+  " <div> "
								+  " <tr id='hide' bgcolor='#f1f3f5' style='display:none;'> "
								+  " <td colspan='5' style='padding:50px;' align='left'>"+Q+value.GOODS_QNA_CONTENT +"</td> "
								+  " </tr>"
								+  " </div> ";
							}
			});
				body.append(str);
				
			}
		}
	</script>	
	</div>
</body>
</html>