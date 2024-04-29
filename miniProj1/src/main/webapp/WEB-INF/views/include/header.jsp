<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
    
<ul class="nav nav-pills nav-justified">
  <li class="nav-item">
    <a class="nav-link"  href="<c:url value='/'/>" id="home_link">회사소개</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value='/board/list'/>" id="board_link">게시판</a>
  </li>
  	<c:choose>
  		<c:when test="${empty principal}">
			<li class="nav-item"><a class="nav-link" href="<c:url value='/login/loginForm'/>">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/login/signUpForm'/>">회원가입</a></li>
  		</c:when>
  		<c:otherwise>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/login/logout'/>" id="login_link">로그아웃</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/member/view'/>" id="mypage_link">마이페이지</a></li>
  		</c:otherwise>
  	</c:choose>
</ul>