<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link href="${pageContext.request.contextPath}/css/font.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
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
    	<form id="rForm" action="" method="post">
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
			<a href="javascript:history(-1)" style="margin-left: 30px;">취소</a>
        </form>
    </div>
    <img src="${pageContext.request.contextPath}/resources/img/도파민중독자.jpg">
</div>

<script type="text/javascript" src="<c:url value='/resources/js/common.js'/>"></script>
<script type="text/javascript">
	
const rForm = document.getElementById("rForm");
rForm.addEventListener("submit", e => {
	//서버에 form data를 전송하지 않는다 
	e.preventDefault();
	
	myFetch("login", "rForm", json => {
		if(json.status == 0) {
			//성공
			alert(json.loginVO.memberName + " 회원님 로그인 감사합니다");
			//location = "<c:url value='/board/list'/>"; //절대 경로, 컨텍스트명 자동 변경 
			//location = "/mini/board/list"; //절대 경로 
			location = "../board/list"; //상대경로 
		} else {
			alert(json.statusMessage);
		}
	});
});

</script>  
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>