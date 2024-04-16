<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link href="css/menu.css" rel="stylesheet">
	<link href="css/font.css" rel="stylesheet">
	<link href="css/layout.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>로그인화면</title>

</head>
<c:if test="${not empty param.err}">
<script>
    alert("아이디 또는 비밀번호가 잘못되었습니다");
</script>    
</c:if>
<body>
<nav>
    <ul>
    	<li><a href="corpInfo.html">회사 소개</a></li>
    	<li><a href="<c:url value='/member/signupForm'/>">회원가입</a></li>
    	<li><a href="<c:url value='/member/loginForm'/>">로그인</a></li>
    	<li><a href="<c:url value='/board/list'/>">게시판</a></li>
    </ul>
</nav>

<div id="container">
    <img src="img/누워있기.jpeg">
    <div id="login-form">
        <h1>로그인 화면 </h1>
        <form id="rForm" action="member" method="post">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
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
			<a href="mainDefault.html" style="margin-left: 30px;">취소</a>
        </form>
    </div>
    <img src="img/도파민중독자.jpg">
</div>
</body>
</html>