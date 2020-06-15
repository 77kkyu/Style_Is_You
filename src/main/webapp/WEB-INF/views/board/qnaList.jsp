<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri= "http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>
</head>
<style>
.wrapper3 {
  max-width: 1000px;
  margin: 0 auto;
}

h1 {
  text-align: center;
  padding: 100px 0;
  font-weight: normal;
  font-size: 4em;
  letter-spacing: 10px;
}

li {
  list-style: none;
  float: left;
  
}

.bar {
  height: 1.5px;
  width: 100%;
  background-color: #DCDCDC;
}

.flex-menu li {
  text-align:center;
  width: 100%;
}
</style>
<body>

<br/>
<div class="pagemid">
  <div class="wrapper3">
    <ul class="flex-menu">
        <li><a href="http://localhost:8090/stu/faq/openFaqList.do">FAQ</a></li>
    	<li><a href="http://localhost:8090/stu/notice/openNoticeList.do">공지사항</a></li>
    	<li><a href="http://localhost:8090/stu/qna/openQnaList.do">QNA</a></li>
    </ul>
    <br>
    <div class="bar">
    </div>
  </div>
</div>

<br/><br/><br/>
	<h2 align="center">QNA</h2>
	<br/><br/>

	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="20%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	<br>
	<div class="pageNumber" id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	<p>
	<a href="#this" class="btn" id="write">글쓰기</a>
	</p>
	
	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectQnaList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openQnaWrite();
			});	
			
			$("a[name='title']").on("click", function(e){ //제목 
				console.log("asdasd", $(this).parent().parent());
				$(this).parent().parent().find('#pwdChk').show();
			});

			$(".myButton").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openQnaDetail($(this));
			});
		});
		
		
		function fn_openQnaWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna/openQnaWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openQnaDetail(obj){
			
			//$('#pwdChk').show();
			console.log("asdq",obj);
			//if($('#qnaPasswd').val())
			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna/openQnaDetail.do' />"); 
			comSubmit.addParam("QNA_NO", obj.parent().parent().find("input[name='title']").val());
			comSubmit.submit();
		
		}
		
		function fn_selectQnaList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/qna/selectQnaList.do' />");
			comAjax.setCallback("fn_selectQnaListCallback");
			comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("QNA_NO_FE", $("#QNA_NO_FE").val());
			comAjax.ajax();
		}
		
		function fn_selectQnaListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				body.append(str);
			}
			else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectQnaList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.QNA_NO + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='title'>" + value.QNA_TITLE + "   " +
									+ value.QNA_LEVEL + "</a>" +
									"<input type='hidden' name='title' value=" + value.QNA_NO + ">" + 
								"</td>" +
								"<td>" + value.QNA_NAME + "</td>" + 
								"<td>" + value.QNA_DATE + "</td>";
					str += '<td id="pwdChk" style="display:none;" colspan="4">Password : ';
					str += '<input type="password" id="qnaPasswd" value="qna_passwd">';
					str += '<a href="#" class="myButton">확인</a>'
					str += '</td></tr>';
				});
				body.append(str);
				
			}
		}
	</script>	
</body>
</html>