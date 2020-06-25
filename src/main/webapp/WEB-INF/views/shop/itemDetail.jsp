<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
   <title>상품정보</title>
</head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/magiczoomplus/magiczoomplus.css'/>"/>
<script src="<c:url value='/resources/magiczoomplus/magiczoomplus.js'/>" charset="utf-8"></script>
<style type="text/css">
  
@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);

.tab-content{
    border:none;
}
nav > div a.nav-item.nav-link
{
  border-bottom: 1px solid #FC8D86;

}
nav > div a.nav-item.nav-link.active
{
  border-top: 1px solid #FC8D86;
  border-left: 1px solid #FC8D86;
  border-right: 1px solid #FC8D86;
}
nav > div a.nav-item.nav-link:hover,
nav > div a.nav-item.nav-link:focus
{
  border-top: 1px solid #FC8D86;
  border-left: 1px solid #FC8D86;
  border-right: 1px solid #FC8D86;

}

.qty .count {
    color: #000;
    display: inline-block;
    vertical-align: top;
    font-size: 15px;
    font-weight: 700;
    line-height: 20px;
    padding: 0 2px;
    min-width: 35px;
    text-align: center;
}
.qty .plus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 20px;
    height: 20px;
    font: 20px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    }
.qty .minus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 20px;
    height: 20px;
    font: 20px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    background-clip: padding-box;
}

.minus:hover{
    background-color: #717fe0 !important;
}
.plus:hover{
    background-color: #717fe0 !important;
}
/*Prevent text selection*/

.count{  
    border: 0;
    width: 2%;
}
nput::-webkit-outer-spin-button,
.count::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.count:disabled{
    background-color:white;
}
  
  
  

.fa-beat {
  animation:fa-beat 5s ease infinite;
}
@keyframes fa-beat {
  0% {
    transform:scale(1);
  }
  5% {
    transform:scale(1.25);
  }
  20% {
    transform:scale(1);
  }
  30% {
    transform:scale(1);
  }
  35% {
    transform:scale(1.25);
  }
  50% {
    transform:scale(1);
  }
  55% {
    transform:scale(1.25);
  }
  70% {
    transform:scale(1);
  }
}
 
</style>
<body>
<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function(){
   $.ajax({
      type : "POST",
      url : '<c:url value="/item/getOption"/>',
      data : {ITEM_NUM: "${item.ITEM_NUM}"},
      success : function(data){
         var str = "";
         var he="";
         $.each(data.list,function(index,items){
            if(he==items.OP_TYPE){
               str +="<option value='"+items.OP_NUM+"'>"+items.OP_VALUE;
               if(items.OP_PRICE>0){
                  var price=numberWithCommas(items.OP_PRICE);
                  str +="(+"+price+"원)";
               }
               str +="</option>";
               
            }else{
               if(he!=""){
                  str +="</td>"+
                       "</tr>";
               }
               str += "<tr >" +
               "<th class='pl-0' scope='row' style='font-family: Nanum Gothic, cursive; font-size: 15px;'>"+items.OP_TYPE+"<br></th>"+
               "<td class='p-2' ><select id='op_se' class='form-control p-0 '>"+
               "<option value='non_option'>--옵션선택--</option>"+
               "<option value='"+items.OP_NUM+"'>"+items.OP_VALUE;
               if(items.OP_PRICE>0){
                  var price=numberWithCommas(items.OP_PRICE);
                  str +="(+"+price+"원)";
               }
               str +="</option>";
               he=items.OP_TYPE;
            }
            

            
         
         })
         $("#item_option tbody").append(str);
         
      }
   });
   
   $('#item_option tbody').on('change','select',function(){
      var index=$('select').index(this);
      var items=$('select').get();
      if($('select').index(this)>0 && $('select:eq('+(index-1)+')').val()=='non_option'){
         alert("위 옵션을 입력해주세요");
         $('select:eq('+index+') option:eq(0)').prop("selected", true);
         return;
      }
      
         for(var i=index+1;i<items.length;i++){
            
            $('select:eq('+i+') option:eq(0)').prop("selected", true);
            
         }
         
      
      if(index==(items.length-1)&&$('select:eq('+(index)+')').val()!='non_option'){
         var op_list= ["0"];
         $.each(items,function(index,item){
            if($(item).val()!='non_option'){
               op_list.push($(item).val());
            }
         })
         $.ajax({
         type : "POST",
         url : '<c:url value="/item/getSelectOption"/>',
         data : {list: op_list},
         traditional:true,
         success : function(data){
            var str="";
            var price=0;
            var op_num="";
            str +="<li id='op_list' class='list-group-item p-2'>"+
            "<span style='text-align: left;' id='op_text'>";
            $.each(data.list,function(index,items){
               if((data.list.length-1)==index){
                  str +=items.OP_VALUE;
                  op_num+=items.OP_NUM;
               }else{
                  str +=items.OP_VALUE+",";
                  op_num+=items.OP_NUM+"_";
               }
               price+=items.OP_PRICE;
            })
            price+=${item.ITEM_FP};
            
            str +="</span>"+
            "<div class='qty pull-right' style='text-align: right; display: inline-block;'id='"+op_num+"'>"+
            "<span class='minus bg-dark'>-</span>"+
            "<input type='number' class='count' name='qty' id='qty' value='1' disabled>"+
            "<span class='plus bg-dark'>+</span>"+
            "&nbsp<span style=' font-weight: 700;' id='op_price' op_price='"+price+"'>"+numberWithCommas(price)+"원</span>"+
            "&nbsp<button type='button' id='op_c' class='btn btn-sm btn-primary' style='width: 20px; height: 20px; float: none; text-align: justify; padding-top: 0px; padding-right: 14px; padding-bottom: 2px; line-height: 0px; margin-right: 0px; min-width: 0px; margin-bottom: 0px; margin-top: -2px;'>"+
            "x"+
            "</button>"+
            "</div>" +
            "</li>";
            if($('#'+op_num).attr('id')==op_num){
               alert("이미있는 상품입니다");
            }
            else{
               $("#sel_op").before(str);
               totalPrice();
            }
            
         }
         
         });
      }
      
      
   });
   
});


</script>
<script>


$(document).ready(function(){

    $('.count').prop('disabled', true);
      $(document).on('click','.plus',function(){
      $(this).prev('.count').val(parseInt($(this).prev('.count').val()) + 1 );
      var p=$(this).parent().find('#op_price');
      var num=parseInt(p.attr('op_price'));
      var count=parseInt($(this).prev('.count').val())
      p.text(numberWithCommas(num*count)+"원");
      totalPrice();
   });
   $(document).on('click','.minus',function(){
      $(this).next('.count').val(parseInt($(this).next('.count').val()) - 1 );
         if ($(this).next('.count').val() == 0) {
            $(this).next('.count').val(1);
            return;
         }
         var p=$(this).parent().find('#op_price');
         var num=parseInt(p.attr('op_price'));
         var count=parseInt($(this).next('.count').val())
         p.text(numberWithCommas(num*count)+"원");
         totalPrice();
       });
      $(document).on('click','#op_c',function(){
         $(this).closest('li').remove();
         totalPrice();
      });
   $("#addCart").click(function(){
      addCart();

   });
   $("#buyItem").click(function(){
      buyItem();
   });
   $("#addJjim").click(function(){
	     addJjim();
	   });
   
});
   
   
function totalPrice(){
   var items=$("li[id='op_list']").get();
   
   var total=0;
   $.each(items,function(index,item){
      var price=parseInt($("li[id='op_list']:eq("+index+")").find('#op_price').attr('op_price'));
      var num=parseInt($("li[id='op_list']:eq("+index+")").find('.count').val());
      total+=num*price;
      
   })
   $("#tottalPrice").text(numberWithCommas(total));
   
}   

function addCart(){
var items=$("li[id='op_list']").get();
   if(items.length==0){
      alert("옵션항목을 추가하세요!");
      return;
   }
   var total=0;
   $.each(items,function(index,item){
      var op_name=$("li[id='op_list']:eq("+index+")").find('#op_text').text();
      var price=parseInt($("li[id='op_list']:eq("+index+")").find('#op_price').attr('op_price'));
      var num=parseInt($("li[id='op_list']:eq("+index+")").find('.count').val());
       
      $.ajax({
         type : "POST",
         url : '<c:url value="/item/addCart"/>',
         data : {CART_CNT:num,OP_VALUE:op_name,ITEM_OP_PRICE:price,ITEM_NUM:"${item.ITEM_NUM}"},
         success : function(data){
             
         }
      });  
   })
   alert("장바구니에담겼습니다!");
   location.href="<c:url value='/myPage/myCart'/>";
}
function buyItem(){
   var items=$("li[id='op_list']").get();
   if(items.length==0){
      alert("옵션항목을 추가하세요!");
      return;
   }
   $.ajax({
      type : "POST",
      url : '<c:url value="/item/delBuyItemCart"/>',
      success : function(data){
      }
   }); 
   var total=0;
   $.each(items,function(index,item){
      var op_name=$("li[id='op_list']:eq("+index+")").find('#op_text').text();
      var price=parseInt($("li[id='op_list']:eq("+index+")").find('#op_price').attr('op_price'));
      var num=parseInt($("li[id='op_list']:eq("+index+")").find('.count').val());
       
      $.ajax({
         type : "POST",
         url : '<c:url value="/item/buyItemCart"/>',
         data : {CART_CNT:num,OP_VALUE:op_name,ITEM_OP_PRICE:price,ITEM_NUM:"${item.ITEM_NUM}"},
         success : function(data){
         }
      });  
   })

    location.href="<c:url value='/item/qmember'/>"; 
   
}

function addJjim(){
	var num="${MEM_ID}";
	  if(num==""){
		  alert("로그인이 필요한 서비스입니다.");
		  return;
		}
	      $.ajax({
	         type : "POST",
	         url : '<c:url value="/myPage/addJjim"/>',
	         data : {ITEM_NUM:"${item.ITEM_NUM}"},
	         success : function(data){
		         if(data==true){
					alert("찜목록에 추가했습니다.");
			     }else{
					alert("이미 찜목록에 있습니다.");
				 }
	         }
	      });  
	   
}
</script>

<!------ Include the above in your HEAD tag ---------->

<div class="container pt-5 text-center" >
      <div  >
         <div class="container-fliud">
            <div class="wrapper row " >
               <div  class="preview col-md-5" style="width: 400px; height: auto; display: inline; float: none;">
                  
                  <a style="width: 350px;height: 350px;" data-lens-image="" href="<c:url value='/images/item/${item.ITEM_IMAGE1}'/>" data-options="zoomMode: magnifier"class="simpleLens-lens-image MagicZoom"> 
                  <img  src="<c:url value='/images/item/${item.ITEM_IMAGE1}'/>"
					class="simpleLens-big-image" alt="ss">
				  </a>

               </div>
               <div class="details col-md-7  pl-0 ml-0" style="">
                  <h4 class="product-title text-left" style="font-family: 'Nanum Gothic', cursive; width: 500px; display: inline-block;">${item.ITEM_NAME}</h4>

                  <hr style="line-height: 24px; width: 500px;">

                  <table class="table table-borderless pl-0 ml-0 " id="item_option"  style="display: inline-block;text-align:left; width: 500px;">
                     <thead>
                        <tr>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <th class="pl-0" scope="row" style="font-family: 'Nanum Gothic', cursive; font-size: 15px;">판매가</th>
                           <td style="text-decoration:line-through;"><fmt:formatNumber value="${item.ITEM_PRICE}" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                           <th class="pl-0" scope="row"style="font-family: 'Nanum Gothic', cursive; font-size: 15px;">할인가</th>
                           <td ><fmt:formatNumber value="${item.ITEM_FP}" pattern="#,###"/>원</td>
                        </tr>
                        
                        
                     </tbody>
                  </table>
                  <div class="text-left mb-2" style="display: inline-block;">
                     <ul class="list-group"
                        style="width: 500px; justify-content: center; display: inline-block;">
                        
                        <li class="list-group-item "id="sel_op"  style="text-align: right;">
                        <span style="text-align: right;">
                           총상품금액
                        <span id="tottalPrice">0</span>
                            원
                        </span>
                            
                        </li>

                     </ul>
                  </div>
                  <hr style="width: 500px;">
                  
                  <div class="btn-group ">
                  <button class="btn btn-warning" id="addJjim" type="button">
                     <i class="fa fa-heart fa-beat"></i>
                  </button>
                  </div>
                  &nbsp
                  <div class="btn-group cart">
                     <button type="button" id="addCart" class="btn btn-success">
                     장바구니
                        </button>
                  </div>
                  <div class="btn-group wishlist">
                     <button type="button" id="buyItem" class="btn btn-danger">
                        바로구매</button>
                  </div>
                  
               </div>
                  
            </div>
            </div>
         </div>
      </div>
   
 <div class="container pt-5 mt-5">
              <div class="row">
                <div class="col-xs-12 " style="width:100%">
                  <nav>
                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                      <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" style="font-weight: 700;">상세정보</a>
                      <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" style="font-weight: 700;">같은상품</a>
                      <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false" style="font-weight: 700;">상품후기</a>
                      <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false" style="font-weight: 700;">Q&A</a>
                    </div>
                  </nav>
                  <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent" >
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" >
                   	
                   	<div class="text-center" style="width: 100%;">${item.ITEM_IMAGE2}</div>
                    </div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
       				<jsp:include  page="/WEB-INF/viewtiles2/item/itemMatch.jsp" flush="true">
						<jsp:param name="ITEM_NUM" value="${item.ITEM_NUM}"/>
						<jsp:param name="ITEM_TYPE" value="${item.ITEM_TYPE}"/>
					</jsp:include>
                    </div>
                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                     <jsp:include  page="/WEB-INF/viewtiles2/review/reviewList.jsp" flush="true">
						<jsp:param name="ITEM_NUM" value="${item.ITEM_NUM}"/>
						</jsp:include>
                    </div>
                    <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                      <jsp:include  page="/WEB-INF/viewtiles2/qna/qnalist.jsp" flush="true">
						<jsp:param name="ITEM_NUM" value="${item.ITEM_NUM}"/>
						</jsp:include>
                    </div>
                  </div>
                
                </div>
              </div>
        </div>


</body>
</html>