<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jspf" %>
</head>
<body>


	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>문의하기</caption>
			<tbody><tr>
			<td style="padding:0px; border:none;">
				<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td width="100" bgcolor="f6f6f6">제목</td>
					<td width="475" class="gray" style="padding-left:10px;text-align:left;" align="left">
						<input type="text" name="subject" id="qna_title" style="width:90%;" maxlength="100" value="">
					</td>
					
					<td width="100" bgcolor="f6f6f6">문의유형</td>
					<td align="left" class="gray" style="padding-left:10px; text-align:left;">
						<select id="group" name="group" id="qna_category" style="width:90%;"><option value="61">1. 상품문의 드려요~♥</option><option value="62">2. 배송문의 드려요~♥</option><option value="63">3. 배송전 변경,취소 문의드려요~♥</option><option value="64">4. 교환,반품 문의드려요~♥</option><option value="65">5. 입금결제 문의드려요~♥</option><option value="66">6. 기타문의드려요~♥</option></select>
					</td>
					
				</tr>
				</tbody></table>
			</td>
		</tr>

		<!-- 글쓴이 이메일 시작 -->
		<tr>
			<td style="padding:0px; border-bottom:none;">
				<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td width="100" bgcolor="f6f6f6">글쓴이</td>
					<td align="left" class="gray" style="padding-left:10px;text-align:left;">
						<input type="text" name="writer" id="member_name" style="width:90%;" maxlength="50" value="">
					</td>
					<td width="100" bgcolor="f6f6f6" class="gray_6">이메일</td>
					<td align="left" class="gray" style="padding-left:10px; text-align:left;">
						<input autocomplete="off" type="text" name="email" id="member_email" style="width:90%;" maxlength="100" value="">
					</td>
				</tr>
				</tbody></table>
			</td>
		</tr>
		<!-- 글쓴이 이메일 끝 -->

		<!--내용입력 -->
		<tr>
			<td colspan="2" class="view_text">
				<textarea rows="20" cols="100" title="내용" id="qna_content" name="Qna_CONTENT"></textarea>
			</td>
		</tr>
		<!-- 내용입력 : 끝 -->

		<!-- 비밀번호-->
		<tr>
			<td style="padding:0px; border-bottom:none;">
				<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td width="100" bgcolor="f6f6f6">비밀번호</td>
					<td align="left" class="gray" style="padding-left:10px;text-align:left;">
						<input autocomplete="off" type="password" name="pass" id="qna_passwd" style="width:120px;" maxlength="20" value="">&nbsp;&nbsp;
						<!-- <input type="checkbox" name="isSecret" value="T" style="margin-right:5px;">비밀글(관리자만 볼수 있습니다.) -->
					</td>
				</tr>
				</tbody></table>
			</td>
		</tr>
		<!--// 비밀번호  -->


		</tbody>
		</table>
		<div id="" class="">
			<label><input type="checkbox" name="isSecret" value="T" style="margin-right:5px;" id="qna_secret" checked=""><span></span>비밀글(관리자만 볼수 있습니다.)</label>
		</div>
		
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	
	<%@ include file="../include/include-body.jspf" %>
	<script type="text/javascript">
		var gfv_count = 1;
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openQnaList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertQna();
			});

		});
		
		function fn_openQnaList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openQnaList.do' />");
			comSubmit.submit();
		}
		
		function fn_insertQna(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertQna.do' />");
			comSubmit.submit();
		}

	</script>
</body>
</html>