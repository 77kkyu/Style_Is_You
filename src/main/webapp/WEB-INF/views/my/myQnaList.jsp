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

<br/><br/><br/>
	<h2 align="center">상품 Q&A</h2>
	<br/><br/>

	<table class="qna_list">
		<colgroup>
			<col width="10%"/>
			<col width="15%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th colspan="2" scope="col">문의상품</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">답변</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	<br>
	<div class="pageNumber" id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	
	
	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectQnaList(1);
			
			
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
			var body = $("#qna_list");
			body.empty();
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='5'>등록된 게시물이 없습니다.</td>" + 
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
					var Level = value.GOODS_QNA_LEVEL;
					/* var Level1 = "0";
					$.each(Level,function(idx,row){
						if(Level[idx].NAME == "0"){
							return Level[idx];	
						}else if(Level[idx].NAME == "0") {
							return Level[idx];
						}
						return ""
					});
					alert(Level);  */

					//var Level = 0;
					//alert(value.GOODS_QNA_LEVEL == 1);
					
					
					if(Level == 1){
				str += " <div> "
					+  " <tr id='show"+cnt+"'> "
					+  " <td align='center' > "+value.RNUM+"</td>"
					+  " <td class='align_left'> "+value.GOODS_QNA_TITLE+"</td>"
					+  " <td align='center'> "+value.MEMBER_NAME+"</td>"
					+  " <td align='center' > "+date+"</td>"
					+  " <td align='center'> <span class='btn btn-danger'>답변완료</span></td>"
					+  " </tr> "
					+  " </div> "
					+  " <div> "
					+  " <tr width='100%' align='center' bgcolor='#f1f3f5'> "
					+  " <td></td> "
					+  " <td id='hide"+cnt+"' height='50px;'>하하하ddddddddddddddㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td> "
					+  " <td></td><td></td><td></td> "
					+  " </tr>"
					+  " </div> ";
						cnt++
					}else{

					str += " <tr align='center' id='show"+cnt+"' > "
						+  " <td > "+value.RNUM+"</td>"
						+  " <td class='align_left'> "+value.GOODS_QNA_TITLE+"</td>"
						+  " <td align='center'> "+value.MEMBER_NAME+"</td>"
						+  " <td align='center' > "+date+"</td>"
						+  " <td align='center' width='90px' height='38px'></td>"
						+  " </tr> "
						+  " <div> "
						+  " <tr width='100%' align='center' bgcolor='#f1f3f5'> "
						+  " <td></td>"
						+  " <td id='hide"+cnt+"' height='50px;'>하하하ddddddddddddddㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td> "
						+  " <td></td><td></td><td></td> "
						+  " </tr>"
						+  " </div> ";
						cnt++
					}
				//" <td > <span class='btn btn-danger'>답변완료</span></td>"
				////+  " <td>"+value.GOODS_QNA_LEVEL+"</td>"
			});
				body.append(str);
				
			}
		}
	</script>	
</body>
</html>