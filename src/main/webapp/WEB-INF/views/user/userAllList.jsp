<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<%@ include file="/WEB-INF/views/module/header.jsp" %>
	
	<%@ include file="/WEB-INF/views/module/footer.jsp" %>
	
	<%@ include file="/WEB-INF/views/module/userList.jsp" %>
	
   

    

<!--    <!-- Bootstrap core JavaScript -->
<!--     ================================================== --> -->
<!--    <!-- Placed at the end of the document so the pages load faster --> -->
<!--    <script -->
<!--       src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<%--    <%-- 순서 중요 --%> --%>
<!--    <script -->
<!--       src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
</body>
</html>