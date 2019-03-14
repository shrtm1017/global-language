<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- select box를 변경 해당 언어로 로케일 변경 -->
<!-- fmt:setLocale 변경 -->
<spring:message code="hello"/>
<form >
<select id ="langSelect" name="language">
	<option value="ko">한국어</option>
	<option value="en">영어</option>
	<option value="ja">일본어</option>
</select>
	<input type="submit" value="전송">
</form>
msgView.jsp
</body>
</html>