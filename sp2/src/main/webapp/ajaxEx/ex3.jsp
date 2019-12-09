<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnSend").click(function() {
		var url = "ex3_ok.jsp";
		var query = "num=1";
		
		url = url+"?"+query;
		$.getJSON(url, function(data) {
			console.log(data);
		});
		
	});
});
</script>

</head>
<body>

<h3>AJAX - 예</h3>

<p>
	<button type="button" id="btnSend">확인</button>
</p>

<div id="resultLayout"></div>

</body>
</html>