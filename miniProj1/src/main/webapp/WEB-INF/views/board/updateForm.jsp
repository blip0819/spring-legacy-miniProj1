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
    <title>게시글 수정</title>
</head>
<body>
<nav>
    <ul>
        <li><a href="corpInfo.html">회사 소개</a></li>
        <li><a href="member?action=memberList">회원목록</a></li>
        <li><a href="member?action=logout">로그아웃</a></li>
        <li><a href="board?action=boardList">게시판</a></li>
    </ul>
</nav>

<div id="container">
    <img src="img/건강챙겨.png" width=360px>
        
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
    
		<script>
		    const rForm = document.getElementById("rForm");
		    const bno = document.getElementById("bno");
		    const btitle = document.getElementById("btitle");
		    const bcontent = document.getElementById("bcontent");
		    const bwriter = document.getElementById("bwriter");
		    const bdate = document.getElementById("bdate");
		
		    rForm.addEventListener("submit", e => {
		        e.preventDefault();
		
		        const param = {
		            action: 'update',
		            bno: bno.value,
		            btitle: btitle.value,
		            bcontent: bcontent.value,
		            bwriter: bwriter.value,
		            bdate: bdate.value
		        };
		        

		
		        fetch("update", {
		            method: "POST",
		            body: JSON.stringify(param),
		            headers: {"Content-type": "application/json; charset=utf-8"}
		        }).then(res => res.json()).then(json => {
		            console.log("json ", json);
		            if (json.status == 0) {
		                // 성공
		                alert("게시글 수정이 완료되었습니다.");
		                location = "view&bno=" + bno.value;
		            } else {
		                alert(json.statusMessage);
		            }
		        });
		    });
		</script>
 


    </div>
    <img src="img/아프지마.jpeg" width=360px>
    </div>

</body>
</html>