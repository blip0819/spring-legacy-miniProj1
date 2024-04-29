<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<meta charset="UTF-8">
<title>메인 페이지</title>
<%@ include file="/WEB-INF/views/include/meta.jsp" %>
<%@ include file="/WEB-INF/views/include/css.jsp" %>
<%@ include file="/WEB-INF/views/include/js.jsp" %>
</head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" style="background-color:#F6F6F6">
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

         <script>
        menuActive("home_link");
        </script>

        <img src="${pageContext.request.contextPath}/resources/img/떡볶이사주기쿠폰.jpg">
        
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
