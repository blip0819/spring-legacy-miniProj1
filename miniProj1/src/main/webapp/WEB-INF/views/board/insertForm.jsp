<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>게시글 작성</title>
<%@ include file="/WEB-INF/views/include/css.jsp" %>
<%@ include file="/WEB-INF/views/include/js.jsp" %>
</head>
<body>
 <%@ include file="/WEB-INF/views/include/header.jsp" %>

<div id="container">
    <img src="${pageContext.request.contextPath}/resources/img/귀여움자격증.jpeg" width=360px>
    <div id="insert-form">
        <h1>게시글 작성</h1>
        <h3>로그인 : ${loginVO.memberName} </h3>
        <form id="rForm" action="insert" method="post">            
            
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
    <img src="${pageContext.request.contextPath}/resources/img/귀염둥이.jpeg" width=360px>
    </div>
    
    <script type="text/javascript" src="<c:url value='/resources/js/common.js'/>"></script>
    
		<script type="text/javascript">
		menuActive("board_link");
		    
		    const rForm = document.getElementById("rForm");
		    rForm.addEventListener("submit", e => {
		    	//서버에 form data를 전송하지 않는다 
		    	e.preventDefault();
		    	
		    	myFetch("insert", "rForm", json => {
					switch(json.status) {
					case 0:
						//성공
						alert("게시물을 등록 하였습니다");
						location = "list";
						break;
					default:
						alert(json.statusMessage);
					}
				});
		    });
		    
		</script>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
