<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet">
<meta charset="UTF-8">
<title>메인 페이지</title></head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" style="background-color:#F6F6F6">
    <div class="menu" >
        <nav class="clearfix">
            <ul class="clearfix">
                <li><a href="corpInfo.html">회사 소개</a></li>
                <li><a href="member?action=signUpForm">회원가입</a></li>
                <li><a href="member?action=memberList">회원목록</a></li>
                <li><a href="member?action=loginForm">로그인</a></li>
                <li><a href="<c:url value='/board/list'/>">게시판</a></li>
            </ul>
            <a id="pull" href="#"></a>
        </nav>
    </div> 
        <img src="resources/img/떡볶이사주기쿠폰.jpg">
</body>
</html>
