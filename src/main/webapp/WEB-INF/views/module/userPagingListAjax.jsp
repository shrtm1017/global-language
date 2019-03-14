<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

            <h1 class="page-header">전체 사용자 리스트(tilesAjax)</h1>
            <!-- userList 정보를 화면에 출력하는 로직 작성 -->

            <div class="table-responsive">
               <table class="table table-striped">
                  <thead>
                     <tr>
                        <th>#</th>
                        <th>사용자 아이디</th>
                        <th>사용자 이름</th>
                        <th>별명</th>
                        <th>등록일시</th>
                     </tr>
                  </thead>
                  <tbody id="userListTbody">
                  </tbody>
               </table>
               <form action="${cp }/user/userForm" method="get">
               <button type="submit" class="btn btn-default">사용자 등록</button>
               </form>
               <c:set var="lastPage" value="${Integer(userCnt / pageSize + (userCnt % pageSize > 0 ? 1 : 0))}"/>

               <nav style="text-align: center;">
                  <ul id="pagenation" class="pagination">
                   
                  </ul>
               </nav>


            </div>
   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

   <script>
   function makePagenation(userCnt,pageSize,page) {
	   var lastPage=parseInt(userCnt/pageSize)+(userCnt%pageSize > 0 ? 1 : 0);
	   console.log("lastPage : " + lastPage)
	   var html ="";
	   
	   if(page == 1){
		   html +="<li class='disabled'>";
		   html +="		<a aria-label='Previous'>";
		   html +="			<spanaria-hidden='true'>&laquo;</span>";
		   html +="		</a>";
		   html +="	</li>";
	   }else{
	    html +="<li>"
// 	    html +=" 	<a href='${cp }/user/userPagingList' aria-label='Previous'>"
	    html +=" 	<a href='javascript:getUserPageList(1);' aria-label='Previous'>"
	    html +="  		<span aria-hidden='true'>&laquo;</span>"
	    html += "	</a>"
	    html +="</li>";
	   }
	   for(var i=1; i<=lastPage; i++){
		   var active="";
		   if(i==page)
			   active ="active";
		   html +="<li class='" + active + "'>";
// 		   html +="	<a href='${cp }/user/userPagingList?page="+i +"'>"+i+"</a>"
		   html +="	<a href='javascript:getUserPageList("+i+");'>"+i+"</a>"
		   html +="</li>"
	   }
	   if(page == lastPage){
		   html +="<li class='disabled'>";
		   html +="		<a aria-label='Next'>";
		   html +="			<spanaria-hidden='true'>&raquo;</span>";
		   html +="		</a>";
		   html +="	</li>";
	   }else{
	    html +="<li>"
	    html +=" 	<a href='javascript:getUserPageList("+lastPage+");' aria-label='Next'>"
	    html +="  		<span aria-hidden='true'>&raquo;</span>"
	    html += "	</a>"
	    html +="</li>";
	   }
	   
$("#pagenation").html(html);

}
   
   function makeUserList(userList) {
	   var html="";
	   
	   for(var i =0; i<userList.length; i++){
		   var user =userList[i];
		   html +="<tr class='userTr' data-userId='"+user.userId+"'>";
		   html +="	<td></td>";	
		   html +="	<td>"+user.userId+"</td>";
		   html +="	<td>"+user.userNm+"</td>";
		   html +="	<td></td>";
		   html +="	<td>"+user.reg_dt_fmt+"</td>";
		   html +="</tr>";
	   }
	   $("#userListTbody").html(html);
}
   function getUserPageList(page) {
	   $.ajax({
		  url:"${cp}/user/userPagingListAjax",
 		  data : "page="+page,
 		  success : function(data) {
 			  makeUserList(data.userList);
 			  makePagenation(data.userCnt,data.pageSize,data.page);
 		  }
	   });
	}
   function getUserPageListHtml(page) {
	   $.ajax({
		  url:"${cp}/user/userPagingListAjaxHtml",
 		  data : "page="+page,
 		  success : function(data) {
 			  /*
 			  	data : 
 			  		사용자 리스트 html...
 			  		=======seperator========
 			  		페이지 네이션
 			  
 			  */
 			var htmlArr= data.split("==============seperator===================");
 			//1.html->이벤트 등록  방법 html이 ajax 호출에 의해 정상적으로 생성된 이후
 			// 클릭 이벤트 핸들러 등록 sccuss -> ajax 등록
 			$("#userListTbody").html(data);
 			$("#pagenation").html(htmlArr[1]);
//  	         $(".userTr").on("click", function() {
//  	            console.log("userTr click");
//  	            //클릭한 userTr태그의 userId 값을 출력
//  	            //             var userId = $(this).children()[1].innerText;
//  	            //             console.log("userId : " + userId);

//  	            var userId = $(this).data("userid");

//  	            // /user
//  	            // 1. docuemnt
//  	            //document.location = "/user?userId=" + userId;

//  	            // 2. form
//  	            $("#userId").val(userId);
//  	            //$("#frm").attr("action", "/userAllList");
//  	            $("#frm").submit();
 	            
//  	         });

	console.log(data)
 		  }
	   });
	}
      //문서로딩이 완료된 이후 이벤트 등록
      $(document).ready(function() {
//     	  getUserPageList(1);
    	  getUserPageListHtml(1);
    	  
    	
    			//매개변수명은 상관없음
    	 
    	  
    	  //msg 속성이 존재하면 alert, 존재하지 않으면  넘어가기
    	  <c:if test="${msg != null}">
    	  	alert("${msg}");
    	  	<%session.removeAttribute("msg");%>
    	  </c:if>
         console.log("document ready");
   
         
         //2.이벤트 핸들러 대상을 변경(.userTr ->#userListTbody)
         //동적으로 생성되는 html을 감싸는 영역에 이벤트를 등록
         // 단 on 옵션에서 감싸는 영역안에 처리되어야할 selector를 명시
         // #(".userTr").on("click",".userTr", function()){
        	 
//          }
	         $("#userListTbody").on("click",".userTr", function() {
	            console.log("userTr click");
	            //클릭한 userTr태그의 userId 값을 출력
	            //             var userId = $(this).children()[1].innerText;
	            //             console.log("userId : " + userId);

	            var userId = $(this).data("userid");

	            // /user
	            // 1. docuemnt
	            //document.location = "/user?userId=" + userId;

	            // 2. form
	            $("#userId").val(userId);
	            //$("#frm").attr("action", "/userAllList");
	            $("#frm").submit();
	            });
         //사용자 tr 태그 클릭시 이벤트 핸들러
      });
   </script>

   <form id="frm" action="${request.getContextPath()}/user/user" method="get">
      <input type="hidden" id="userId" name="userId" />
   </form>

</body>
</html>







