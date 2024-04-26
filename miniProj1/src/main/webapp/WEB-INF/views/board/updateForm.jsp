<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <%@ include file="/WEB-INF/views/include/css.jsp" %>
    <%@ include file="/WEB-INF/views/include/js.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<nav>
    <ul>
        <li><a href="corpInfo.html">회사 소개</a></li>
        <li><a href="<c:url value='/member/signupForm'/>">회원가입</a></li>
        <li><a href="<c:url value='/member/loginForm'/>">로그인</a></li>
        <li><a href="<c:url value='/board/list'/>">게시판</a></li>
    </ul>
</nav>

<div id="container">
    <img src="${pageContext.request.contextPath}/resources/img/건강챙겨.png" width=360px>
        
            <div id = update-form>
            <h1>게시글 수정</h1>
   			<form id="rForm" method="post">
            <div class="form-group">
        	<label>게시글 번호 : </label>
        	<input type="text" id="bno" name="bno" value="${board.bno}" readonly="readonly"> <br/>
            </div>
            
            <div class="form-group">
             <label>제목 : </label>
             <input type="text" id="btitle" name="btitle" value="${board.btitle}" required="required"> <br/>
            </div>
            
            <div class="form-group">
                <label>내용 : </label>
                <input type="text" id="bcontent" name="bcontent" value="${board.bcontent}">
            </div>
            
            <div class="form-group">
                <label>작성자 : </label>
                <input type="text" id="bwriter" name="bwriter" value="${board.memberID}" readonly="readonly">
            </div>
            
            <div class="form-group">
                <label>작성일 : </label>
                <input type="text" id="bdate" name="bdate" value="${board.bdate}" readonly="readonly">
            </div>
		<br> 
				<input type="submit" value="수정">
       			<a href="<c:url value='/board/view&bno=${board.bno}'/>">취소</a>
       	</form>
    
		<script type="text/javascript" src="<c:url value='/resources/js/common.js'/>"></script>

		<script type="text/javascript">
		menuActive("board_link");
			
		const rForm = document.getElementById("rForm");
		rForm.addEventListener("submit", e => {
			//서버에 form data를 전송하지 않는다 
			e.preventDefault();
			
			myFetch("update", "rForm", json => {
				if(json.status == 0) {
					//성공
					alert("게시물 정보 수정을 성공 하였습니다");
					location = "view?bno=" + bno.value;
				} else {
					alert(json.statusMessage);
				}
			});
		});
		
		</script>   
 


    </div>
    <img src="${pageContext.request.contextPath}/resources/img/아프지마.jpeg" width=360px>
    </div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>