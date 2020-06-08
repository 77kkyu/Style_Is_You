<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<h2>QNA</h2>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri= "http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>
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
	
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	<a href="#this" class="btn" id="write">글쓰기</a>
	

	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectQnaList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openQnaWrite();
			});	
			
			$("a[name='qna_title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openQnaDetail($(this));
			});
		});
		
		
		function fn_openQnaWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openQnaWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openQnaDetail(qna_no){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openQnaDetail.do' />");
			comSubmit.addParam("QNA_NO", qna_no);
			comSubmit.submit();
		}
		
		function fn_selectQnaList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectQnaList.do' />");
			comAjax.setCallback("fn_selectQnaListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("qna_NO", $("#qna_NO").val());
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
								"<td>" + value.qna_NO + "</td>" + 
								"<td class='qna_title'>" +
									"<a href='#this' name='qna_title'>" + value.qna_TITLE + "</a>" +
									"<input type='hidden' name='qna_title' value=" + value.qna_NO + ">" + 
								"</td>" +
								"<td>" + value.qna_DATE + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				$("a[name='qna_title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openQnaDetail($(this));
				});
			}
		}
	</script>	
</body>
</html>