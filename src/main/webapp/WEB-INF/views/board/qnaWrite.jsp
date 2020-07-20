 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
   String sessionName = (String)session.getAttribute("SESSION_NAME");
   String sessionId = (String)session.getAttribute("SESSION_ID");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri= "http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>
</head>
<body>

<br/><br/><br/>
   <h2 align="center">문의하기</h2>
   <br/><br/>
   
   <form id="frm" name="frm" enctype="multipart/form-data">
   <input type="hidden" id="member_no" name="MEMBER_NO" value="${SESSION_NO}">
      <table class="board_view">
         <colgroup>
            <col width="15%">
            <col width="*%"/>
         </colgroup>
         <tbody><tr>
         <td style="padding:0px; border:none;">
            <table style="width:100%; height:30px; border:0; cellpadding:0; cellspacing:0;">
            <tbody><tr>
               <td width="10%" bgcolor="f6f6f6" align="center">제목</td>
               <td width="450px" class="gray" style="padding-left:10px;text-align:left;" align="left">
                  <input type="text" id="qna_title" name="QNA_TITLE" style="width:90%;" maxlength="100">
               </td>
               
               <td width="10%" bgcolor="f6f6f6" align="center">문의유형</td>
               <td width="450px" align="left" class="gray" style="padding-left:10px; text-align:left;">
                  <select id="group" name="QNA_CATEGORY" id="qna_category" style="width:90%;">
                  <option value="61">1. 상품문의 드려요~♥</option>
                  <option value="62">2. 배송문의 드려요~♥</option>
                  <option value="63">3. 배송전 변경, 취소 문의드려요~♥</option>
                  <option value="64">4. 교환, 반품 문의드려요~♥</option>
                  <option value="65">5. 입금결제 문의드려요~♥</option>
                  <option value="66">6. 기타문의드려요~♥</option>
                  </select>
               </td>
               
            </tr>
            </tbody></table>
         </td>
      </tr>

      <!-- 글쓴이 이메일 시작 -->
      <tr>
         <td style="padding:0px; border-bottom:none;">
            <table style="width:100%; height:30px; border:0; cellpadding:0; cellspacing:0;">
            <tbody><tr>
               <td width="10%" bgcolor="f6f6f6" align="center">글쓴이</td>
               <td align="left" class="gray" style="padding-left:10px;text-align:left;">
                  <input type="text" name="QNA_NAME" id="member_name" style="width:90%;" maxlength="50" value=<%=sessionId %>>
               </td>
               <td width="10%" bgcolor="f6f6f6" class="gray_6" align="center">이메일</td>
               <td align="left" class="gray" style="padding-left:10px; text-align:left;">
                  <input type="text" name="MEMBER_EMAIL" id="member_email" style="width:90%;" maxlength="100">
               </td>
            </tr>
            </tbody>
         </table>
      </td>
   </tr>
      <!-- 글쓴이 이메일 끝 -->

      <!--내용입력 -->
      <tr>
         <td colspan="2" class="view_text">
            <textarea rows="20" cols="130" title="내용" id="qna_content" name="QNA_CONTENT"></textarea>
         </td>
      </tr>
      <!-- 내용입력 : 끝 -->

      <!-- 비밀번호-->
      <tr>
         <td style="padding:0px; border-bottom:none;">
            <table style="width:100%; height:30px; border:0; cellpadding:0; cellspacing:0;">
            <tbody><tr>
               <td width="100" bgcolor="f6f6f6" align="center">비밀번호</td>
               <td align="left" class="gray" style="padding-left:10px;text-align:left;">
                  <input autocomplete="off" type="password" name="QNA_PASSWD" id="qna_passwd" style="width:150px;" maxlength="20" value="">&nbsp;&nbsp;
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
      <p>
         <label><input type="checkbox" name="QNA_SECRET" value="1" style="margin-right:5px;" id="qna_secret" checked=""><span></span>비밀글(관리자만 볼수 있습니다.)</label>
      </p>
      </div>
      <br>
      <p>
      <a href="#this" class="btn" id="write">작성하기</a>
      <a href="#this" class="btn" id="list">목록으로</a>
      </p>
   </form>
   
   <form id="commonForm" name="commonForm"></form>
   <script type="text/javascript">
      var gfv_count = 1;
   
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openQnaList();
         });
         
         $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
//             chkEmpty();
            fn_insertQna();
         });
      });
      
      function fn_openQnaList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/qna/openQnaList.do' />");
         comSubmit.submit();
      }
      
      function fn_insertQna(){
         var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/qna/insertQna.do' />");
         comSubmit.submit();
      }

//       function chkEmpty(){
         
//          if($('input[name=QNA_NAME]').val() == undefined || $('input[name=QNA_NAME]').val() == "") {alert("이름을 입력해주세요!");}
//          else if($('input[name=QNA_TITLE]').val() == undefined || $('input[name=QNA_TITLE]').val() == "") {alert("제목을 입력해주세요!");}
//          else if($('textarea[name=QNA_CONTENT]').val() == undefined || $('textarea[name=QNA_CONTENT]').val() == "") {alert("내용을 입력해주세요!");}
//          else if($('input[name=MEMBER_EMAIL]').val() == undefined || $('input[name=MEMBER_EMAIL]').val() == "") {alert("이메일을 입력해주세요!");}
//          else if($('input[name=QNA_CATEGORY]').val() == undefined || $('input[name=QNA_CATEGORY]').val() == "") {alert("문의유형을 입력해주세요!");}
//          else if($('input[name=QNA_SECRET]').val() == undefined || 'input[name=QNA_SECRET]').val() == "") {alert("비밀번호를 입력해주세요!");}
//       }
   </script>
   
</body>
</html>