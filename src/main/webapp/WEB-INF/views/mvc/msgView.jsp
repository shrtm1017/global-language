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
<!-- select box�� ���� �ش� ���� ������ ���� -->
<!-- fmt:setLocale ���� -->
<spring:message code="hello"/>
<form >
<select id ="langSelect" name="language">
	<option value="ko">�ѱ���</option>
	<option value="en">����</option>
	<option value="ja">�Ϻ���</option>
</select>
	<input type="submit" value="����">
</form>
msgView.jsp
</body>
</html>