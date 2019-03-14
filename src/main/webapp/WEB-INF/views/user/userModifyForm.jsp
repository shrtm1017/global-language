<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<link href="${cp}/css/dashboard.css"
	rel="stylesheet">

</head>
<body>
	<%-- <%List<UserVo> userList = (List<UserVo>)request.getAttribute("userList");  %> --%>
	<!-- 정적 include -->
	<%@ include file="/WEB-INF/views/module/header.jsp" %>
	
	<%@ include file="/WEB-INF/views/module/footer.jsp" %>
	


	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


		<form id="userfrm2" action="${cp }/user/userModifyForm" method="post" class="form-horizontal" role="form"
		enctype="multipart/form-data">
			<h1>사용자 수정</h1>
			<div class="form-group">
					<label for="userNm" class="col-sm-3 control-label">사진</label>
					<div class="col-sm-9">
					<img src=""/>
						<input type="file" class="form-control" id="profile" name="profile" placeholder="사진" >
					</div>
				</div>
			
				<div class="form-group">
					<label for="userNm" class="col-sm-3 control-label">사용자 아이디</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="userId" name="userId" placeholder="사용자 이름" readonly="userId">
					</div>
				</div>

				<div class="form-group">
					<label for="userNm" class="col-sm-3 control-label">사용자 이름</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="userNm" name="userNm"
							placeholder="사용자 이름">
					</div>
				</div>
				<div class="form-group">
					<label for="userNm" class="col-sm-3 control-label">별명</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="alias"
							name="alias" placeholder="별명	">
					</div>
				</div>
				<div class="form-group">
					<label for="pass" class="col-sm-3 control-label">Password</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="pass" name="pass"
						>
					</div>
				</div>
								<div class="form-group">
					<label for="userNm" class="col-sm-3 control-label">주소1</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="addr1"
							name="addr1" placeholder="별명	" readonly>
					</div>
				</div>
					<div class="form-group">
					<label for="userNm" class="col-sm-3 control-label">상세주소</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="addr2"
							name="addr2" placeholder="별명	">
					</div>
				</div>
								<div class="form-group">
					<label for="userNm" class="col-sm-3 control-label">우편번호</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="zipcode"
							name="zipcode" placeholder="별명	" readonly>
					</div>
					<div class="col-sm-3">
						<button id="zipcodeBtn" type="button" class="btn btn-default">우편번호 검색</button>
					</div>
				</div>
					<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button id="regBtn" type="button" class="btn btn-default">사용자 수정</button>
					</div>
				</div>
				
		</form>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<%-- 순서 중요 --%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

function initData(){
	$("#userId").val("${userVo.userId}");
	$("#userNm").val("${userVo.userNm}");
	$("#alias").val("${userVo.alias}");
	$("#addr1").val("${userVo.addr1}");
	$("#addr2").val("${userVo.addr2}");
	$("#zipcode").val("${userVo.zipcode}");
// 	$("#pass").val("${userVo.pass}");
	$("#filename").val("${userVo.filename}")
	$("#realFilename").val("${userVo.realFilename}")
	$("img").attr("src","${cp}/user/profileImg?userId=${userVo.userId}");
}
function clearData(){
	$("#userId").val("");
	$("#userNm").val("");
	$("#alias").val("");
	$("#addr1").val("");
	$("#addr2").val("");
	$("#zipcode").val("");
	$("#pass").val("");
	
}
$(document).ready(function(){
	
	initData();
// 	if("${msg}" !=""){
		
// 	alert("${msg}");
	/*
	if("중복에 실패 했습니다."" !="")
		alert("중복체크에 실패 했습니다.");
	
	*/
	  <c:if test="${requestScope.msg != null}">
  		alert("${requestScope.msg}");

	</c:if>
// 	clearData();

	//우편번호 검색 버튼 클릭 이벤트
	$("#zipcodeBtn").on("click",function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            //새 우편번호 : data.zonecode
	            //우편번호  input select. val(data.zonecode);
	            $("#zipcode").val(data.zonecode);
	            //기본주소 (도로주소) : data.roadAddress
	            //주소1 input select. val(data.zonecode);
	            $("#addr1").val(data.roadAddress);
	            
	            //상세주소 input foucs
	            $("#addr2").focus();
	        }
	    }).open();
		
		
	});
	
	$("#regBtn").on("click", function(){
		//사용자 아이디
		if($("#userId").val().trim()==""){
			alert("사용자 아이디를 입력해주세요");
			$("#userId").focus();
			return false;
		}
		//사용자 이름
		if($("#userNm").val().trim()==""){
			alert("사용자 아이디를 입력해주세요");
			$("#userNm").focus();
			return false;
		}
		//별명
		if($("#alias").val().trim()==""){
			alert("사용자 아이디를 입력해주세요");
			$("#alias").focus();
			return false;
		}
		//주소1
		if($("#addr1").val().trim()==""){
			alert("주소를 입력해주세요");
			$("#zipcodeBtn").trigger("click");
			return false;
		}
		//주소2
		if($("#addr2").val().trim()==""){
			alert("상세주소를 입력해주세요");
			$("#addr2").focus();
			return false;
		}
		//우편번호
		//비밀번호
// 		if($("#pass").val().trim()==""){
// 			alert("비밀번호를 입력해주세요");
// 			$("#pass").focus();
// 			return false;
// 		}
		//정상적으로 validation이 완료 => form 전송
		$("#userfrm2").submit();
	});
	//사용자 등록 버튼 클릭 이벤트
});
    
</script>
</body>
</html>
