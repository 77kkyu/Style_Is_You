function gfn_isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if(this.formId == "commonForm"){
		$("#commonForm").empty();
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();	
	};
}
var gfv_ajaxCallback="";
function ComAjax(opt_formId){
	this.url="";
	this.formId=gfn_isNull(opt_formId) ==true ? "commonForm" : opt_formId;
	this.param="";
	
	if(this.formId == "commonForm"){
		var frm=$("#commonForm");
		if(frm.length>0){
			frm.remove();
		}
		var str="<form id='commonForm' name='commonForm'></form>";
		$('body').append(str);
	}
	this.setUrl=function setUrl(url){
		this.url=url;
	};
	this.setCallback = function setCallback(callBack){
		fv_ajaxCallback = callBack;
	};
	this.addParam = function addParam(key,value){ 
		this.param = this.param + "&" + key + "=" + value; 
	};
	this.ajax = function ajax(){
		if(this.formId != "commonForm"){
			this.param += "&" + $("#"+this.formId).serialize();
		}
		$.ajax({
			url : this.url,
			type : "POST",
			data : this.param,
			async : false,
			success : function(data,status){
				if(typeof(fv_ajaxCallback)=="function"){
					fv_ajaxCallback(data);
				
				}
				else{
					eval(fv_ajaxCallback + "(data);");
				}
			}
		});
	};
}
/* divId : 페이징 태그가 그려질 div
 * pageIndx : 현재 페이지 위치가 저장될 input 태그 id
 * recordCount : 페이지당 레코드 수 
 * totalCount : 전체 조회 건수 
 * eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
 */
var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params){
	var divId = params.divId;
	gfv_pageIndex=params.pageIndex;
	var totalCount = params.totalCount;
	var currentIndex = $("#"+params.pageIndex).val();
	if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex)){
		currentIndex=1;
	}
	
	var recordCount = params.recordCount;
	if(gfn_isNull(recordCount)){
		recordCount=5;
	}
	var totalIndexCount=Math.ceil(totalCount/recordCount);
	gfv_eventName = params.eventName;
	
	$("#"+divId).empty();
	var preStr = "";
	var postStr="";
	var str = "";
	var first = (parseInt((currentIndex-1)/10)*10)+1;
	var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount % 10 : 10;
	var prev = (parseInt((currentIndex-1)/10)*10)-9 > 0 ? (parseInt((currentIndex-1)/10)*10)-9 : 1;
	var next = (parseInt((currentIndex-1)/10)+1)*10+1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) *10+1 : totalIndexCount;
	
	if(totalIndexCount > 10){ //페이지수가 10개 이상인 경우
		preStr += "<a herf='#this' class='pad_1' style='margin-right: 10px;' onclick='_movePage(1)'><img src='http://localhost:8080/stu/img/bttttnrrrr.jpg' width='30px' height='30px' border='0' alt='right'></a>" +
			"<a href='#this' class='pad_1' style='margin-right: 10px;' onclick='_movePage("+ prev +")'><img src='http://localhost:8080/stu/img/bttttnrrrr.jpg' width='30px' height='30px' border='0' alt='right'></a>";
		
	}else if(totalIndexCount <=10 && totalIndexCount > 1){ //페이지수가 10개보다 작은 경우
		preStr += "<a href='#this' class='pad_1' style='margin-right: 10px;' onclick='_movePage(1)'><img src='http://localhost:8080/stu/img/bttttnrrrr.jpg' width='30px' height='30px' border='0' alt='right'></a>";
	}else if(totalIndexCount >= 1) {}
	
	if(totalIndexCount > 10){ //페이지수가 10개 이상인 경우
		postStr += "<a href='#this' class='pad_1' style='margin-left: 10px;' onclick='_movePage("+ next +")'><img src='http://localhost:8080/stu/img/bttttn.jpg' width='30px' height='30px' border='0' alt='right'></a>"+
			"<a href='#this' class='pad_1' style='margin-left: 10px;' onclick='_movePage("+ totalIndexCount +")'><img src='http://localhost:8080/stu/img/bttttn.jpg' width='30px' height='30px' border='0' alt='right'></a>";
	}else if(totalIndexCount <=10 && totalIndexCount > 1){ //페이지수가 10개보다 작은 경우
		postStr+= "<a href='#this' class='pad_1' style='margin-left: 10px;' onclick='_movePage("+ totalIndexCount +")'><img src='http://localhost:8080/stu/img/bttttn.jpg' width='30px' height='30px' border='0' alt='right'></a>";
	}else if(totalIndexCount >= 1) {}
	
	for(var i=first; i<(first+last); i++){
		if(i != currentIndex){
			str += "<a href='#this' class='pad_1' style='padding: 5px;' id='tag' onclick='_movePage("+i+")'>"+i+"</a>";
		}else{
			str += "<b><a href='#this' class='pad_1' style='padding: 5px;' id='tag' onclick='_movePage("+i+")'>"+i+"</a></b>"
		}
	}
	$("#"+divId).append(preStr + str + postStr);
}
function _movePage(value){
	$("#"+gfv_pageIndex).val(value);
	if(typeof(gfv_eventName)=="function"){
		gfv_eventName(value);
	}
	else{
		eval(gfv_eventName + "(value);");
	}
}