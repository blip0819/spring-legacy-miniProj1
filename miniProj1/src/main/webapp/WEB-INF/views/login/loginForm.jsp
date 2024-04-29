<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>로그인화면</title>
    <%@ include file="/WEB-INF/views/include/css.jsp" %>
    <%@ include file="/WEB-INF/views/include/js.jsp" %>

</head>
<c:if test="${not empty param.err}">
<script>
    alert("아이디 또는 비밀번호가 잘못되었습니다");
</script>    
</c:if>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div id="container">
    <img src="${pageContext.request.contextPath}/resources/img/누워있기.jpeg">
    <div id="login-form">
        <h1>로그인 화면 </h1>
    	<form id="rForm" action="<c:url value='/login'/>" method="post">
            <div class="form-group">
            <sec:csrfInput/>
                <label for="memberID">아이디 : </label>
                <input type="text" id="memberID" name="memberID" required="required" placeholder="아이디를 입력해주세요">
            </div>

            <div class="form-group">
                <label for="memberPW">비밀번호 : </label>
                <input type="password" id="memberPW" name="memberPW" required="required" placeholder="비밀번호를 입력해주세요">
            </div>
            <div class="form-group checkbox-group">
                <input type="checkbox" id="autologin" name="autologin" value="Y">
                <label for="autologin">자동로그인</label>
            </div>
            <input type="submit" value="로그인" style="margin-left: 110px;">
			<a href="javascript:history(-1)" style="margin-left: 30px;">취소</a>
        </form>
    </div>
    <img src="${pageContext.request.contextPath}/resources/img/도파민중독자.jpg">
</div>

<script>
	menuActive("login_link");
	window.addEventListener("load", e => {
		
		<%-- 로그인시 오류 메시지 출력 --%>
		msg = "${error ? exception : ''}"; 
		if (msg !== "")  {
			alert(msg);
		}
		
	})
 </script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>