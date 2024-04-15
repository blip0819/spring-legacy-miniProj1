<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="/resources/css/menu.css" rel="stylesheet">
<link href="/resources/css/layout.css" rel="stylesheet">
<link href="/resources/css/font.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>게시글 자세히보기</title>
</head>
<body>
    <nav>
        <ul>
            <li><a href="corpInfo.html">회사 소개</a></li>
            <li><a href="member?action=memberList">회원목록</a></li>
            <li><a href="member?action=logout">로그아웃</a></li>
            <li><a href="<c:url value='/board/list'/>">게시판</a></li>
        </ul>
    </nav>
    
    <div id="container">
        <img src="resources/img/스불행.jpeg" width="360px">
        <div id="view">
            <h1>게시글 자세히보기</h1>
            <label>게시글 번호 : ${board.bno}</label><br/>
            <label>제목 : ${board.btitle}</label><br/><br/>
            <label>내용 : ${board.bcontent}</label><br/><br/>
            <label>ViewCount : ${board.view_count}</label><br/>
            <label>작성자: ${board.memberID}</label><br>
            <label>작성일: ${board.bdate}</label><br>
            
            <script type="text/javascript" src="<c:url value='/resources/js/common.js'/>"></script>
            <script>
            function jsDelete() {
            	if (confirm("정말로 삭제하시겠습니까?")) {
            		myFetch("delete", "viewForm", json => {
            			if(json.status == 0) {
            				//성공
            				alert("게시물 정보를 삭제 하였습니다");
            				location = "list";
            			} else {
            				alert(json.statusMessage);
            			}
            		});
            	}
            }

            function jsUpdateForm() {
            	if (confirm("정말로 수정하시겠습니까?")) {
            		//서버의 URL을 설정한다 
            		location = "updateForm";
            	
            		//서버의 URL로 전송한다 
            		viewForm.submit();
            	}	
            }
            </script>
            <!-- 두개의 폼을 하나로 합치는 방법 , js를 사용하여 처리  -->
            	<form id="viewForm" method="post">
            		<input type="hidden" name="bno" value="${board.bno}">
            		<input type="button" value="삭제" onclick="jsDelete()">
            		<input type="button" value="수정" onclick="jsUpdateForm()">
            	</form>     
             
                <div>
                    <a href="list">목록</a>
                    <a href="updateForm?bno=${board.bno}">수정</a>
                    <a href="delete?bno=${board.bno}">삭제</a>
                </div>

        <img src="img/사랑평화행복.jpeg" width="360px">
        

</body>
</html>
