<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="css/menu.css" rel="stylesheet">
<link href="css/layout.css" rel="stylesheet">
<link href="css/font.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
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
    <img src="img/귀여움자격증.jpeg" width=360px>
    <div id="insert-form">
        <h1>게시글 작성</h1>
        <h3>로그인 : ${loginVO.memberName} </h3>
        <form id="rForm" action="board" method="post">            
            
            <div class="form-group">
             	<label>제목 : </label>
                <textarea id="btitle" name="btitle" rows="1" cols="40" required>${board.btitle}</textarea>
            </div>
            
            <div class="form-group">
                <label>내용 : </label>
                <textarea id="bcontent" name="bcontent" rows="5" cols="40" required>${board.bcontent}</textarea>
            </div>

            <br>
        <input type="submit" value="등록" >
         <a href="javascript:history(-1)">취소</a>
        </form>
    </div>
    <img src="img/귀염둥이.jpeg" width=360px>
    </div>
    
    <script type="text/javascript" src="<c:url value='/resources/js/common.js'/>"></script>
    
		<script type="text/javascript">
		    
		    const rForm = document.getElementById("rForm");
		    rForm.addEventListener("submit", e => {
		    	//서버에 form data를 전송하지 않는다 
		    	e.preventDefault();
		    	
				myFetch("insert", "rForm", json => {
					if(json.status == 0) {
						//성공
						alert("게시물을 등록 하였습니다");
						location = "list";
					} else {
						alert(json.statusMessage);
					}
				});
		    });
		    
		</script>

</body>
</html>
