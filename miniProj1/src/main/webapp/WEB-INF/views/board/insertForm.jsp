<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>게시글 작성</title>
<%@ include file="/WEB-INF/views/include/meta.jsp" %>
<%@ include file="/WEB-INF/views/include/css.jsp" %>
<%@ include file="/WEB-INF/views/include/js.jsp" %>

<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
    <style type="text/css">
    	#rForm {
    		text-align:center;
    	}
	    .btitle {
			width: 80%;
			max-width: 800px;
			margin: 0 auto;
		}
		
	    .ck.ck-editor {
			width: 80%;
			max-width: 800px;
			margin: 0 auto;
		}
		
		.ck-editor__editable {
			height: 80vh;
		}
    </style>
</head>
<body>
 <%@ include file="/WEB-INF/views/include/header.jsp" %>

<div id="container">
    <img src="${pageContext.request.contextPath}/resources/img/귀여움자격증.jpeg" width=360px>
    <div id="insert-form">
        <h1>게시글 작성</h1>
        <h3>로그인 : ${principal.memberName} </h3>
        <form id="rForm" action="insert" method="post">            
            <sec:csrfInput/>
            <input class="btitle" id="btitle" name="btitle" required="required" placeholder="게시물 제목을 입력해주세요"><br/>
        	<textarea id="bcontent" name="bcontent" required="required" placeholder="게시물 내용을 입력해주세요">
			</textarea>
        <input type="submit" value="등록" >
         <a href="javascript:history(-1)">취소</a>
        </form>
    </div>
    <img src="${pageContext.request.contextPath}/resources/img/귀염둥이.jpeg" width=360px>
    </div>
    
		<script type="text/javascript" src="<c:url value='/resources/js/common.js'/>"></script>
		<script type="text/javascript">
		menuActive("board_link");
		
		//ckeditor관련 설정 
		let bcontent; //cfeditor의 객체를 저장하기 위한 변수 
		ClassicEditor.create(document.querySelector('#bcontent'))
		.then(editor => {
			console.log('Editor was initialized');
			//ckeditor객체를 전역변수 bcontent에 설정함 
			window.bcontent = editor;
		})
		.catch(error => {
			console.error(error);
		});
		
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
